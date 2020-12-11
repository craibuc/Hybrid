
function Test-NLog {

    [CmdletBinding()]
    param ()

    Write-Host "Test-NLog"

    try 
    {

        $LoggingConfiguration = [NLog.Config.LoggingConfiguration]::new()

        $Console = [NLog.Targets.ColoredConsoleTarget]::new()
        $Console.Layout = '${machinename}|${processname}|${environment-user}|${logger}|${date:format=HH\:mm\:ss}|${level}: ${message}'
        $LoggingConfiguration.AddTarget("console", $Console)

        $rule1 = [NLog.Config.LoggingRule]::new("*", [NLog.LogLevel]::Trace, $Console)
        $LoggingConfiguration.LoggingRules.Add($rule1)

        [NLog.LogManager]::Configuration = $LoggingConfiguration
        $Log = [NLog.LogManager]::GetLogger( $MyInvocation.MyCommand.Name )

        $Log.Debug("Debug Message")
        $Log.Info("Info Message")
        $Log.Warn("Warn Message")
        $Log.Error("Error Message")
        $Log.Trace("Trace Message")
        $Log.Fatal("Fatal Message")            
    }
    catch 
    {
        Write-Warning $_.Exception.Message    
    }

}