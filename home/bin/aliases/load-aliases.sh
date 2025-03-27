#!/bin/zsh

# Function to load aliases from Chezmoi data
load_aliases() {
    echo "Loading aliases from Chezmoi data..."

    # Function to create an alias or function based on the command
    set_shell_command() {
        local name="$1"
        local command="$2"

        if [[ "$command" =~ " " ]]; then
            eval "${name}() { $command; }"
            echo "Set function: $name = $command"
        else
            alias "$name=$command"
            echo "Set alias: $name = $command"
        fi
    }

    # Load common aliases
    {{ range $key, $value := .aliases.common }}
    set_shell_command "{{ $key }}" "{{ $value }}"
    {{ end }}

    # Load environment-specific aliases
    {{ if .personal_computer }}
    {{ range $key, $value := .aliases.personal_computer }}
    set_shell_command "{{ $key }}" "{{ $value }}"
    {{ end }}
    {{ end }}

    {{ if .work_computer }}
    {{ range $key, $value := .aliases.work_computer }}
    set_shell_command "{{ $key }}" "{{ $value }}"
    {{ end }}
    {{ end }}

    {{ if .dev_computer }}
    {{ range $key, $value := .aliases.dev_computer }}
    set_shell_command "{{ $key }}" "{{ $value }}"
    {{ end }}
    {{ end }}

    {{ if .docker_computer }}
    {{ range $key, $value := .aliases.docker_computer }}
    set_shell_command "{{ $key }}" "{{ $value }}"
    {{ end }}
    {{ end }}

    echo "Aliases loaded successfully"
}

# Load aliases immediately
load_aliases