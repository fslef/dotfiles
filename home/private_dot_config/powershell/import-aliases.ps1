$aliases = Get-Content -Path ~/.zshrc_aliases
$aliases | ForEach-Object {
    $aliasName = ($_ -split "=")[0].Replace("alias ", "")
    $aliasValue = ($_ -split "=")[1]

    #if alias value contains "cd"
    if ($aliasValue -match "cd") {
        $aliasValue = $aliasValue -replace "cd ", ""
        Function cd3 { Set-Location -Path $aliasValue }
    }
    Set-Alias -Name $aliasName -Value $aliasValue.Replace("`"", "")

}