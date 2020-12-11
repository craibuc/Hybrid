using namespace Intacct.SDK
function New-IntacctSession {

    [CmdletBinding()]
    param (
        
    )

    Write-Host "New-IntacctSession"

    try 
    {
        $config = [Intacct.SDK.ClientConfig]::new()
        $config
    }
    catch 
    {
        Write-Warning $_.Exception.Message    
    }

}