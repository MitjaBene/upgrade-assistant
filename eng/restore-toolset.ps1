# $dotnetRoot = Join-Path $RepoRoot '.dotnet'
# $dotnetSdkVersion = $GlobalJson.tools.dotnet

try {
  dotnet workload install ios --source https://aka.ms/dotnet/maui/rc1/index.json
  dotnet workload install android-aot --source https://aka.ms/dotnet/maui/rc1/index.json
  dotnet workload install maccatalyst --source https://aka.ms/dotnet/maui/rc1/index.json
  dotnet workload install maui --source https://aka.ms/dotnet/maui/rc1/index.json

  dotnet workload list
  dotnet workload search
}
catch {
  Write-Host $_.ScriptStackTrace
  Write-PipelineTelemetryError -Category 'RestoreToolset' -Message $_
  ExitWithExitCode 1
}

ExitWithExitCode 0