---
description: "Prompt for generating an AGENTS.md file for a repository"
agent: "agent"
---

# Create high‑quality AGENTS.md file

You are a code agent. Your task is to create a complete, accurate AGENTS.md at the root of this repository that follows the public guidance at https://agents.md/.

AGENTS.md is an open format designed to provide coding agents with the context and instructions they need to work effectively on a project.

## What is AGENTS.md?

AGENTS.md is a Markdown file that serves as a "README for agents" - a dedicated, predictable place to provide context and instructions to help AI coding agents work on your project. It complements README.md by containing detailed technical context that coding agents need but might clutter a human-focused README.

## Key Principles

- **Agent-focused**: Contains detailed technical instructions for automated tools
- **Complements README.md**: Doesn't replace human documentation but adds agent-specific context
- **Standardized location**: Placed at repository root (or subproject roots for monorepos)
- **Open format**: Uses standard Markdown with flexible structure
- **Ecosystem compatibility**: Works across 20+ different AI coding tools and agents

## File Structure and Content Guidelines

### 1. Required Setup

- Create the file as `AGENTS.md` in the repository root
- Use standard Markdown formatting
- No required fields - flexible structure based on project needs

### 2. Essential Sections to Include

#### Project Overview

- Brief description of what the project does
- Architecture overview if complex
- Key technologies and frameworks used

#### Setup Commands

- Installation instructions
- Environment setup steps
- Dependency management commands
- Database setup if applicable

#### Development Workflow

- How to start development server
- Build commands
- Watch/hot-reload setup
- Package manager specifics (npm, pnpm, yarn, etc.)

#### Testing Instructions

- How to run tests (unit, integration, e2e)
- Test file locations and naming conventions
- Coverage requirements
- Specific test patterns or frameworks used
- How to run subset of tests or focus on specific areas

#### Code Style Guidelines

- Language-specific conventions
- Linting and formatting rules
- File organization patterns
- Naming conventions
- Import/export patterns

#### Build and Deployment

- Build commands and outputs
- Environment configurations
- Deployment steps and requirements
- CI/CD pipeline information

### 3. Optional but Recommended Sections

#### Security Considerations

- Security testing requirements
- Secrets management
- Authentication patterns
- Permission models

#### Pull Request Guidelines

- Title format requirements
- Required checks before submission
- Review process
- Commit message conventions

#### Debugging and Troubleshooting

- Common issues and solutions
- Logging patterns
- Debug configuration
- Performance considerations

## Implementation Steps

1. **Analyze the project structure** to understand:

   - Programming languages and frameworks used
   - Package managers and build tools
   - Testing frameworks
   - Project architecture (monorepo, single package, etc.)

2. **Identify key workflows** by examining:

   - package.json scripts
   - Makefile or other build files
   - CI/CD configuration files
   - Documentation files

3. **Create comprehensive sections** covering:

   - All essential setup and development commands
   - Testing strategies and commands
   - Code style and conventions
   - Build and deployment processes

4. **Include specific, actionable commands** that agents can execute directly

5. **Test the instructions** by ensuring all commands work as documented

6. **Keep it focused** on what agents need to know, not general project information

## Best Practices

- **Be specific**: Include exact commands, not vague descriptions
- **Use code blocks**: Wrap commands in backticks for clarity
- **Include context**: Explain why certain steps are needed
- **Stay current**: Update as the project evolves
- **Test commands**: Ensure all listed commands actually work

## Final Notes

- AGENTS.md works with 20+ AI coding tools including Cursor, Aider, Gemini CLI, and many others
- The format is intentionally flexible - adapt it to your project's needs
- Focus on actionable instructions that help agents understand and work with your codebase
- This is living documentation - update it as your project evolves

When creating the AGENTS.md file, prioritize clarity, completeness, and actionability. The goal is to give any coding agent enough context to effectively contribute to the project without requiring additional human guidance.
