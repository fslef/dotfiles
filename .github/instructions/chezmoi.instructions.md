---
description: 'Use when creating, editing, reviewing, or debugging chezmoi templates, data, scripts, externals, or Bitwarden integration in this repository'
applyTo: '.chezmoi*, home/**'
---

# chezmoi Repository Instructions

## Source Layout

- Read `.chezmoiroot` before choosing a source file. It points to `home` in this repository.
- Prefer the managed source under `home/`. Treat similarly named top-level files as separate bootstrap inputs unless their role is confirmed.
- Follow nearby source-state naming and preserve attribute order when combining `private_`, `executable_`, `dot_`, `symlink_`, and `.tmpl`.
- Use the official lowercase spelling `chezmoi` in prose and new names.

## Data

- Keep static structured data in `home/.chezmoidata/*.toml`. These files cannot be templates.
- Keep prompted or machine-dependent values in the `[data]` section of `home/.chezmoi.toml.tmpl`.
- Treat `.personal_computer`, `.work_computer`, `.dev_computer`, and `.docker_computer` as repository-defined data keys, not built-in chezmoi variables.
- Preserve the existing split between `aliases.toml`, `bitwarden.toml`, `constants.toml`, and `packages.toml`.
- Remember that `.chezmoidata` dictionaries merge in lexical file order while lists and scalar values are replaced.

## Templates

- Treat `{{-` and `-}}` as trimming all adjacent whitespace on their respective side. Verify rendered output instead of relying on generic blank-line rules.
- Use `.chezmoi.os`, `.chezmoi.arch`, `.chezmoi.homeDir`, and repository data keys rather than hardcoded platform paths when practical.
- Follow the closest working template before introducing a new whitespace or conditional pattern.
- Keep templates deterministic and ensure optional templates render only whitespace when the target should be absent.

## Bitwarden

- Store Bitwarden item identifiers centrally in `home/.chezmoidata/bitwarden.toml`. Item identifiers are references, not credentials.
- Retrieve values with chezmoi Bitwarden template functions. Use `bitwardenFields` for custom fields.
- Never hardcode, print, log, or repeat passwords, tokens, private keys, `BW_SESSION`, or complete Bitwarden item payloads.
- Apply `private_` to targets containing private material. This removes group and world permissions; do not describe it as an unconditional exact mode.
- Distinguish private material from public keys and item identifiers, while preserving existing stricter permissions unless a change is requested.

## Scripts

- Place action scripts under `home/.chezmoiscripts/` and keep every script idempotent.
- Use `run_` for every apply, `run_onchange_` for changed rendered content, and `run_once_` for each unique rendered content hash.
- Use `before_` and `after_` only when execution must occur outside normal target update ordering.
- Match the shebang to the syntax and follow the repository shell instructions, including documented exceptions to fail-fast behavior.
- Include a dependency checksum in a `run_onchange_` template when a different source file controls whether the script must run again.
- Do not add destructive cleanup, package removal, or live system changes beyond the user's request.

## Workflow And Validation

1. Resolve the active source root and inspect the nearest working template or script.
2. Classify each value as static data, dynamic machine data, public metadata, or secret material.
3. Make the smallest change that follows the existing repository pattern.
4. Validate the narrowest non-secret target first.

- Prefer `chezmoi doctor` and targeted non-secret template rendering for environment and syntax checks.
- Scope `chezmoi diff` and dry runs to known non-secret targets. A broad diff can expose rendered private material.
- Suppress rendered secret output during validation and never relay it in chat.
- Never run live `chezmoi apply`, `chezmoi update`, initialization, package installation, or generated scripts unless the user explicitly requests it.
- Report the files changed, checks run, and any validation intentionally skipped to protect secrets.