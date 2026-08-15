---
description: 'Documentation formatting guidelines for the repository README and files under docs'
applyTo: 'README.md, docs/**/*.md'
---

# Markdown Documentation Guidelines

## Structure

- Use one H1 for the document title unless an external publishing system generates it.
- Use H2 and H3 headings in hierarchical order; avoid deeper levels when restructuring is clearer.
- Keep paragraphs concise and separate sections with a single blank line.
- Use `-` for unordered lists and `1.` for ordered lists.

## Content

- Use fenced code blocks with a language identifier.
- Use descriptive link text and verify links when tooling is available.
- Add meaningful alt text to images.
- Use tables only when they make structured comparisons easier to scan.
- Prefer lines around 80 characters, but do not damage links, tables, or code to enforce this limit.

## Metadata

- Preserve existing YAML frontmatter when present.
- Do not invent blog or publishing metadata unless the target system explicitly requires it.

## Validation

- Run the repository's Markdown formatter or linter when one is configured.
- Keep changes focused and avoid reformatting unrelated documentation.
