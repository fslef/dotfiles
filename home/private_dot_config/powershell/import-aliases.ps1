$aliases = Get-Content -Path ~/.zshrc_aliases
$aliases | ForEach-Object {
    $aliasName = ($_ -split "=")[0].Replace("alias ", "")
    $aliasValue = ($_ -split "=")[1]

    Set-Alias -Name $aliasName -Value $aliasValue
}