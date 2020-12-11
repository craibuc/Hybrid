Write-Debug "PSScriptRoot: $PSScriptRoot"

@("$PSScriptRoot\Public\*.ps1","$PSScriptRoot\Private\*.ps1") | Get-ChildItem -ErrorAction 'Continue' | 
    Where-Object { $_.Name -like '*.ps1' -and $_.Name -notlike '__*' -and $_.Name -notlike '*.Tests*' } | 
    ForEach-Object {
        # dot-source script
        . $_
    }

Get-ChildItem "$PSScriptRoot\bin" -Filter *.dll | ForEach-Object {
    Write-Debug "Loading $( $_.Name )"
    [System.Reflection.Assembly]::LoadFile( $_.FullName )
}