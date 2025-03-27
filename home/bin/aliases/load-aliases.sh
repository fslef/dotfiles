#!/bin/zsh

# Load aliases from Chezmoi data
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
    for key in ${(k)aliases[common]}; do
        set_shell_command "$key" "$aliases[common][$key]"
    done

    # Load environment-specific aliases
    if [[ -n "$personal_computer" ]]; then
        for key in ${(k)aliases[personal_computer]}; do
            set_shell_command "$key" "$aliases[personal_computer][$key]"
        done
    fi

    if [[ -n "$work_computer" ]]; then
        for key in ${(k)aliases[work_computer]}; do
            set_shell_command "$key" "$aliases[work_computer][$key]"
        done
    fi

    if [[ -n "$dev_computer" ]]; then
        for key in ${(k)aliases[dev_computer]}; do
            set_shell_command "$key" "$aliases[dev_computer][$key]"
        done
    fi

    if [[ -n "$docker_computer" ]]; then
        for key in ${(k)aliases[docker_computer]}; do
            set_shell_command "$key" "$aliases[docker_computer][$key]"
        done
    fi

    echo "Aliases loaded successfully"
}

# Load aliases immediately
load_aliases