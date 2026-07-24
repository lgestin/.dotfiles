# Dotfiles

Personal dotfiles managed with GNU stow. **This repo is public** — never commit
secrets or machine/employer-identifying data.

## Never commit
- Credentials: API keys, tokens, passwords, private keys.
- Identifying data: internal hostnames and IPs, employer-specific absolute
  paths, private project names.
- Machine-specific absolute paths — prefer `$HOME` over `/Users/<user>`.

## Where secrets go instead
- Shell: git-ignored `~/.zprofile.local` / `~/.zshenv.local`, sourced by the
  tracked rc files. See the Shells section of the README.
- Zed: the local settings file (`zed_local/.config/zed/settings.json`) is
  git-ignored because it holds machine-specific ssh connections; the real file
  lives untracked in `~/.config/zed`.
- `*.local`, `*.env`, `*.secret*`, and `fish_variables` are git-ignored.

## Before committing
Scan staged changes for credentials and your own internal hostnames/paths:

```sh
git diff --cached | grep -inE 'api[_-]?key|token|secret|password|BEGIN .*PRIVATE|ghp_|AKIA|sk-[A-Za-z0-9]{20}'
```

Any hit → move it to a `*.local` file (or git-ignore the source) and re-scan.

## Commits
- Atomic: one logical change per commit; don't bundle unrelated edits.
- No churn: squash work-in-progress and later fixups into the commit they
  belong to before pushing — the history should read as if done right once.
- Prefix the subject with the change type, matching the existing log:
  `[feat]`, `[fix]`, `[refactor]`, `[chore]`, `[docs]`.
