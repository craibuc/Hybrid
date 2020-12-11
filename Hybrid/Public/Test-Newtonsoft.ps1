
function Test-Newtonsoft {

    [CmdletBinding()]
    param ()

    Write-Host "Test-Newtonsoft"

    try 
    {
        $xml = [xml]"<?xml version='1.0' standalone='no'?>
        <root>
          <person id='1'>
            <name>Alan</name>
            <url>http://www.google.com</url>
          </person>
          <person id='2'>
            <name>Louis</name>
            <url>http://www.yahoo.com</url>
          </person>
        </root>"
                
        $json = [Newtonsoft.Json.JsonConvert]::SerializeXmlNode($xml)
        $json
   }
    catch 
    {
        Write-Warning $_.Exception.Message    
    }

}