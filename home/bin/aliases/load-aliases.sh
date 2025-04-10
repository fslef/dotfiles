#!/bin/zsh

# Define the path to the aliases.toml file
ALIASES_FILE="$HOME/.local/share/chezmoi/home/.chezmoidata/aliases.toml"

# Function to parse a basic TOML section and get key-value pairs
parse_toml_section() {
    local section="$1"
    local in_section=0

    while IFS= read -r line || [[ -n "$line" ]]; do
        # Skip comments and empty lines
        [[ "$line" =~ ^[[:space:]]*# || "$line" =~ ^[[:space:]]*$ ]] && continue

        # Check if we're entering the requested section
        if [[ "$line" =~ \[aliases\.$section\] ]]; then
            in_section=1
            continue
        fi

        # Check if we're exiting the section
        if [[ $in_section -eq 1 && "$line" =~ \[.*\] ]]; then
            break
        fi

        # Extract key-value pairs from the current section
        if [[ $in_section -eq 1 && "$line" =~ ^[[:space:]]*([a-zA-Z0-9_-]+)[[:space:]]*=[[:space:]]*\"(.*)\"[[:space:]]*$ ]]; then
            local key="${BASH_REMATCH[1]}"
            local value="${BASH_REMATCH[2]}"
            # Create the alias
            create_alias "$key" "$value"
        fi
    done < "$ALIASES_FILE"
}

# Function to create an alias or function based on the command
create_alias() {
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

# Load aliases based on environment type
load_aliases() {
    echo "Loading aliases from $ALIASES_FILE..."

    # Always load common aliases
    echo "Loading common aliases..."
    parse_toml_section "common"

    # Check environment variables and load specific aliases
    if [[ -n "$PERSONAL_COMPUTER" ]]; then
        echo "Loading personal computer aliases..."
        parse_toml_section "personal_computer"
    fi

    if [[ -n "$WORK_COMPUTER" ]]; then
        echo "Loading work computer aliases..."
        parse_toml_section "work_computer"
    fi

    if [[ -n "$DEV_COMPUTER" ]]; then
        echo "Loading development computer aliases..."
        parse_toml_section "dev_computer"
    fi

    if [[ -n "$DOCKER_COMPUTER" ]]; then
        echo "Loading docker computer aliases..."
        parse_toml_section "docker_computer"
    fi

    echo "Aliases loaded successfully"
}

# Load aliases immediately
load_aliases