#!/bin/bash

# Install required tools
if [[ "$OSTYPE" == "darwin"* ]]; then
    brew install tomlq
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    if ! command -v tomlq &> /dev/null; then
        echo "Installing tomlq..."
        curl -L https://github.com/toml-lang/toml/releases/download/v0.5.1/tomlq-linux-x86_64 -o /usr/local/bin/tomlq
        chmod +x /usr/local/bin/tomlq
    fi
fi

# Create alias loading function
cat > ~/.local/bin/load-aliases << 'EOL'
#!/bin/bash

# Function to load aliases from TOML file
load_aliases() {
    local toml_file="$HOME/.chezmoidata/aliases.toml"
    local env_type="${CHEZMOI_ENV_TYPE:-common}"

    if [ ! -f "$toml_file" ]; then
        echo "Aliases file not found: $toml_file"
        return 1
    fi

    # Load aliases
    if command -v tomlq &> /dev/null; then
        # Process common aliases first
        echo "Loading common aliases..."
        tomlq -r ".aliases.common | to_entries | .[] | \"alias \(.key)=\(.value)\"" "$toml_file" 2>/dev/null | while read -r alias; do
            eval "$alias"
        done

        # Process environment-specific aliases
        if [ "$env_type" != "common" ]; then
            echo "Loading $env_type aliases..."
            tomlq -r ".aliases.$env_type | to_entries | .[] | \"alias \(.key)=\(.value)\"" "$toml_file" 2>/dev/null | while read -r alias; do
                eval "$alias"
            done
        fi
    else
        echo "tomlq is not installed. Please install it to use aliases."
    fi
}
EOL

chmod +x ~/.local/bin/load-aliases

# Add to shell configs
for shell in bash zsh; do
    if [ -f "$HOME/.${shell}rc" ]; then
        if ! grep -q "load-aliases" "$HOME/.${shell}rc"; then
            echo "source ~/.local/bin/load-aliases" >> "$HOME/.${shell}rc"
            echo "load_aliases" >> "$HOME/.${shell}rc"
        fi
    fi
done