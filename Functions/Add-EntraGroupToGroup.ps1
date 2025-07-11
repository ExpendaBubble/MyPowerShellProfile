function Add-EntraGroupToGroup {
    [CmdletBinding(SupportsShouldProcess=$True)]
    param (
        [Parameter(Mandatory)]
        [Microsoft.Graph.PowerShell.Models.MicrosoftGraphGroup]$SourceGroup,

        [Parameter(Mandatory)]
        [Microsoft.Graph.PowerShell.Models.MicrosoftGraphGroup]$TargetGroup
    )

    # Get group members
    Write-Verbose "Retrieving members for source group: $($SourceGroup.DisplayName) .."
    $sourceGroupMember = Get-MgGroupMember -All -GroupId $SourceGroup.Id
    Write-Verbose "Retrieving members for target group: $($TargetGroup.DisplayName) .."
    $targetGroupMember = Get-MgGroupMember -All -GroupId $TargetGroup.Id

    # Table for quick lookup
    $table = New-Object -TypeName System.Collections.Hashtable
    $sourceGroupMember | ForEach-Object {
        $table.Add($_.Id,$_)
    }

    # Compare target vs source group members and add the delta
    Compare-Object -ReferenceObject @($targetGroupMember) -DifferenceObject @($sourceGroupMember) -Property Id |
    Where-Object -Property 'SideIndicator' -eq '=>' |
    ForEach-Object {
        if ($PSCmdlet.ShouldProcess(
            "Adding $($table[$_.Id].AdditionalProperties.userPrincipalName) to $($TargetGroup.DisplayName) ..",
            "$($TargetGroup.DisplayName)",
            "Add Member"))
        {
            New-MgGroupMember -GroupId $TargetGroup.Id -DirectoryObjectId $_.Id
        }
    }
}