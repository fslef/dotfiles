[CmdletBinding()]
param(
    [Parameter(Mandatory = $false)]
    [ValidateNotNullOrEmpty()]
    [string]$AliasesPath = "~/.chezmoidata/aliases.toml"
)

<#
.SYNOPSIS
    Imports aliases from TOML configuration into PowerShell.

.DESCRIPTION
    This script reads aliases from a TOML configuration file and creates corresponding
    PowerShell aliases and functions. It supports different environments (common, personal_computer,
    work_computer, dev_computer, docker_computer) and creates aliases based on the current environment.

.PARAMETER AliasesPath
    Path to the aliases TOML file. Defaults to ~/.chezmoidata/aliases.toml.

.EXAMPLE
    .\import-aliases.ps1

.EXAMPLE
    .\import-aliases.ps1 -AliasesPath "C:\Users\username\.chezmoidata\aliases.toml"
#>

try {
    Write-Verbose "Reading aliases from $AliasesPath"
    if (-not (Test-Path $AliasesPath)) {
        throw "Aliases file not found at: $AliasesPath"
    }

    # Import TOML file
    $tomlContent = Get-Content -Path $AliasesPath -Raw
    $aliases = $tomlContent | ConvertFrom-Toml

    # Function to process aliases for a specific environment
    function Process-EnvironmentAliases {
        param (
            [hashtable]$Aliases,
            [string]$Environment
        )

        $section = "aliases.$Environment"
        if ($Aliases.ContainsKey($section)) {
            Write-Verbose "Processing $section aliases"
            $Aliases[$section].GetEnumerator() | ForEach-Object {
                $name = $_.Key
                $value = $_.Value

                if ($value -match "cd\s+") {
                    $path = $value -replace "cd\s+", ""
                    Set-Item -Path "Function:$name" -Value { Set-Location -Path $using:path }
                    Write-Verbose "Created function for cd alias: $name"
                }
                else {
                    Set-Alias -Name $name -Value $value
                    Write-Verbose "Created alias: $name"
                }
            }
        }
    }

    # Process common aliases first
    Process-EnvironmentAliases -Aliases $aliases -Environment "common"

    # Process environment-specific aliases based on chezmoi variables
    $envType = $env:CHEZMOI_ENV_TYPE
    if ($envType) {
        Process-EnvironmentAliases -Aliases $aliases -Environment $envType.ToLower()
    }
}
catch {
    Write-Error "Failed to import aliases: $_"
    exit 1
}