Properties {
    $ModuleName='Hybrid'
}

FormatTaskName "-------- {0} --------"

Task default -depends List

Task List -Description 'List all tasks' {
    psake -docs
}

Task Clean -Description "Removing build-related files" {
    "$PSScriptRoot/$ModuleName/bin"
    "$PSScriptRoot/src/bin"
    "$PSScriptRoot/src/obj" | 
    ForEach-Object {
        Remove-Item $_ -Recurse -Force -ErrorAction SilentlyContinue
    }
}

Task Build -Description "Add dependencies to /bin" -Depends Clean {
    & dotnet publish "$PSScriptRoot/src" -f net5.0 -c Release -o "$PSScriptRoot/$ModuleName/bin"
}

