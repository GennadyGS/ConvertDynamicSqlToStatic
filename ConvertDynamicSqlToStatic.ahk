#HotIf GetKeyState("Ctrl", "P")
/ & s::
{
    Run "pwsh -windowstyle hidden -File ConvertDynamicSqlToStatic.ps1"
}
