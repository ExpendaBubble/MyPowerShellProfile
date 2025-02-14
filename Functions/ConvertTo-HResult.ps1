function ConvertTo-HResult ([int64]$decimal) {
    "0x" + $decimal.ToString("X2")
}
