# MEMO-YOSHI 📝

**[日本語版はこちら](README.ja.md)**

> Claude Code への付箋。思いついたことを何でも書いておく場所。

## What is this?

A sticky note for Claude Code. Write memos in a Markdown file, and Claude reads, organizes, and acts on them.

**The problem:** You think of something while Claude is processing, or while you're away from your desk. By the time you can tell Claude, you've forgotten.

**The solution:** A Markdown file that's always open. Write anything — URLs, ideas, TODOs, complaints. Claude picks it up when you're ready.

## Quick Start

```bash
git clone https://github.com/aliksir/memo-yoshi.git
bash memo-yoshi/install.sh
```

Two files installed:
- `~/.claude/MEMO-YOSHI.md` — your memo file
- `~/.claude/commands/memo.md` — the Claude Code skill

## Usage

| Command | What it does |
|---------|-------------|
| `/memo` | Opens MEMO-YOSHI.md in your default editor |
| `/memo read` | Reads memos into the current Claude session |
| `/memo tidy` | Organizes messy memos into categories (URLs, TODOs, Ideas) |
| `/memo add check Node version` | Appends a timestamped memo |
| `/memo act` | Analyzes memos and takes action (opens URLs, runs checks, etc.) |
| `/memo done` | Marks completed items with `終わりヨシッ！` (skipped by read/act) |

Anything after `/memo` that isn't a subcommand is treated as a memo to add:

```
/memo remember to update the API docs
/memo https://interesting-article.com/read-later
/memo bug: login page breaks on Safari
```

## How `/memo act` works

Act scans your memos and executes safe actions automatically:

| Memo content | Action |
|-------------|--------|
| URL | Opens in browser |
| "check ..." / "confirm ..." | Runs the check, writes result back |
| "research ..." / "look into ..." | Searches the web, writes findings back |
| "fix ..." / "implement ..." | **Does NOT auto-execute.** Asks for confirmation first |
| File path | Checks if file exists, summarizes content |

Results are written next to each memo with a timestamp:

```markdown
- https://example.com → ✅ Opened (2026-03-14 12:00)
- check Node version → ✅ v22.5.0 (2026-03-14 12:01)
- fix the login bug → ⏳ Recognized as request. Execute?
```

## Auto-read on session start (optional)

If you want Claude to automatically read your memos at the start of each session, add this to your CLAUDE.md or `/takeover` workflow:

```markdown
## Session Start
- Read `~/.claude/MEMO-YOSHI.md` if it exists
```

## Rules

- **Memos are never deleted automatically.** `/memo tidy` organizes, it doesn't remove.
- **`/memo act` never runs destructive operations.** Implementation requests require your confirmation.
- **`終わりヨシッ！` items are skipped.** `/memo read` and `/memo act` ignore completed items unless you explicitly ask to include them.
- Works with any text editor. No special app needed.

## Requirements

- Claude Code (any plan)
- A text editor (you already have one)

## License

MIT
