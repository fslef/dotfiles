#!/usr/bin/env bash

set -eufo pipefail

# Display start message in cyan
echo
echo -e "\033[0;36m---------------------------\033[0m"
echo -e "\033[0;36mSTARTING DOCK CONFIGURATION\033[0m"
echo -e "\033[0;36m----------------------------\033[0m"
echo

trap 'killall Dock' EXIT

declare -a remove_labels=(
{{ range .dock.icons.common.to_remove -}}
{{ . | quote }}
{{ end -}}
{{ if .personal_computer }}
{{ range .dock.icons.personal_computer.to_remove -}}
{{ . | quote }}
{{ end -}}
{{ end }}
{{ if .work_computer }}
{{ range .dock.icons.work_computer.to_remove -}}
{{ . | quote }}
{{ end -}}
{{ end }}
{{ if .dev_computer }}
{{ range .dock.icons.dev_computer.to_remove -}}
{{ . | quote }}
{{ end -}}
{{ end }}
{{ if .docker_computer }}
{{ range .dock.icons.docker_computer.to_remove -}}
{{ . | quote }}
{{ end -}}
{{ end }}
)

for label in "${remove_labels[@]}"; do
	dockutil --no-restart --remove "${label}" || true
done

# Display end message in cyan
echo
echo -e "\033[0;36m----------------------------\033[0m"
echo -e "\033[0;36mDOCK CONFIGURATION COMPLETED\033[0m"
echo -e "\033[0;36m-----------------------------\033[0m"
echo
