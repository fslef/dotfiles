# Function to load aliases from TOML file
function Import-Aliases {
    $tomlFile = Join-Path $env:HOME ".chezmoidata" "aliases.toml"

    if (-not (Test-Path $tomlFile)) {
        Write-Error "Failed to import aliases: Aliases file not found at: $tomlFile"
        return
    }

    # Read the TOML file
    $content = Get-Content $tomlFile -Raw

    # Function to parse TOML section
    function Parse-TomlSection {
        param (
            [string]$content,
            [string]$section
        )

        $pattern = "\[$section\]\s*\n((?:[^\n]+\n)*)"
        if ($content -match $pattern) {
            $sectionContent = $matches[1]
            $sectionContent -split "`n" | ForEach-Object {
                if ($_ -match '^([^=]+)=(.*)$') {
                    $name = $matches[1].Trim()
                    $value = $matches[2].Trim()
                    Set-Alias -Name $name -Value $value -Scope Global -Force
                }
            }
        }
    }

    # Load common aliases
    Parse-TomlSection -content $content -section "aliases.common"

    # Load environment-specific aliases based on computer type
    $computerType = $env:COMPUTER_TYPE
    switch ($computerType) {
        "personal" { Parse-TomlSection -content $content -section "aliases.personal_computer" }
        "work" { Parse-TomlSection -content $content -section "aliases.work_computer" }
        "dev" { Parse-TomlSection -content $content -section "aliases.dev_computer" }
        "docker" { Parse-TomlSection -content $content -section "aliases.docker_computer" }
    }
}

# Load aliases immediately
Import-Aliases