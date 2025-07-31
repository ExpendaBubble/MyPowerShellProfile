function New-EventDrivenScheduledTask {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]$Name,
        [string]$Description,
        [Parameter(Mandatory)]
        [string]$EventData,
        [Parameter(Mandatory)]
        [int]$EventId,
        [Parameter(Mandatory)]
        [string]$EventSource,
        [Parameter(Mandatory)]
        [ValidateScript({ Test-Path -LiteralPath $_ })]
        $Process,
        [string]$Argument,
        [ValidateScript({ Test-Path -LiteralPath $_ })]
        $WorkingDirectory,
        [Parameter(Mandatory)]
        [ValidateSet('System','User')]
        [string]$Context
    )

    # Define Action
    $splatAction = New-Object -TypeName System.Collections.Hashtable
    $splatAction.Add('Execute', $Process)
    if ($PSBoundParameters['Argument']) { $splatAction.Add('Argument', $Argument) }
    if ($PSBoundParameters['WorkingDirectory']) { $splatAction.Add('WorkingDirectory', $WorkingDirectory) }

    # Define Principal
    $splatPrincipal = New-Object -TypeName System.Collections.Hashtable
    switch ($Context) {
        System {$splatPrincipal.Add('UserId', 'S-1-5-18')}
        User {$splatPrincipal.Add('GroupId', 'S-1-5-32-545')}
    }

    # Define Settings
    $splatSettings = New-Object -TypeName System.Collections.Hashtable
    $splatSettings.Add('AllowStartIfOnBatteries', $true)

    # Ensure Even Source exists
    if (-not [System.Diagnostics.EventLog]::SourceExists($EventSource)) { New-EventLog -LogName Application -Source $EventSource }

    # Define Event Trigger
    $classTrigger = Get-CimClass -ClassName MSFT_TaskEventTrigger -Namespace Root/Microsoft/Windows/TaskScheduler:MSFT_TaskEventTrigger
    $taskTrigger = New-CimInstance -CimClass $classTrigger -ClientOnly
    $xmlTrigger = "<QueryList><Query Id=""0"" Path=""Application""><Select Path=""Application"">*[System[(EventID=$EventId)] and EventData[Data='$eventData']]</Select></Query></QueryList>"
    $taskTrigger.Subscription = $xmlTrigger

    # Define Task
    $splatTask = New-Object -TypeName System.Collections.Hashtable
    $splatTask.Add('Action', (New-ScheduledTaskAction @splatAction))
    $splatTask.Add('Principal', (New-ScheduledTaskPrincipal @splatPrincipal))
    $splatTask.Add('Settings', (New-ScheduledTaskSettingsSet @splatSettings))
    $splatTask.Add('TaskName', $Name)
    $splatTask.Add('Trigger', $taskTrigger)
    if ($PSBoundParameters['Description']) { $splatAction.Add('Description', $Description) }

    # Create Task
    Register-ScheduledTask @splatTask | Out-Null
}