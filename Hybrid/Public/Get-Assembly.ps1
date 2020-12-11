function Get-Assembly {

    [CmdletBinding()]
    param (
        [string]$Name
    )

    try {
        $bin = Join-Path (Split-Path $PSScriptRoot -Parent) 'bin'
        Write-Debug "bin: $bin"

        $Search = [string]::IsNullOrEmpty($Name) ? "$bin*" : ( Join-Path $bin "$Name.dll")
        Write-Debug $Search

        [AppDomain]::CurrentDomain.GetAssemblies() | Where-Object { $_.Location -like $Search}
    }
    catch {
        Write-Warning $_.Exception.Message
    }

}