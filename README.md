# omarchy-audit

> 📖 [Español](README.es.md) · **English**

Interactive TUI to audit and clean up an [omarchy](https://omarchy.org) install.

![demo](demo.gif)

Pacseek and bauh let you uninstall packages, but they don't know what omarchy shipped versus what you added. **omarchy-audit reads omarchy's own package manifest** so it can tell you which packages came from the distro (don't touch) and which you installed yourself (probably safe to remove).

```
╭───────────────────────────────────────────────────╮
│  omarchy-audit  2026-05-20 18:00                  │
│                                                   │
│  Core omarchy    131 packages (don't touch)       │
│  Yours           55 packages (you installed)      │
│  Orphans         0 orphaned dependencies          │
│  Pacman cache    12.5 GiB on disk                 │
╰───────────────────────────────────────────────────╯
```

## What it does

- **📦 Your packages** — explicit installs that are NOT in the omarchy manifest. Multi-select to remove.
- **👻 Orphans** — orphaned dependencies (`pacman -Qtdq`).
- **🗑️ Pacman cache** — wraps `paccache` to drop old generations or fully purge files for uninstalled packages.
- **🌐 Web apps** — read-only inventory of browser shortcuts registered as local desktop launchers.
- **🔒 Core omarchy** — read-only listing, just to see what came with the distro.

Every destructive action runs `pacman -Rs --print` first and asks for confirmation. Pacman itself is the safety net: it refuses to remove anything still depended on.

## Install

Requires: `bash`, `pacman`, [`gum`](https://github.com/charmbracelet/gum), `expac`, `pacman-contrib` (for `paccache`).

```bash
sudo pacman -S gum expac pacman-contrib
git clone https://github.com/<you>/omarchy-audit.git
sudo install -m 755 omarchy-audit/bin/omarchy-audit /usr/local/bin/
```

Then:

```bash
omarchy-audit
```

## Languages

UI is bilingual (English / Spanish). Detection follows `$LANG` — Spanish locales (`es_*`) get Spanish, anything else gets English. Override with:

```bash
OMARCHY_AUDIT_LANG=es omarchy-audit
OMARCHY_AUDIT_LANG=en omarchy-audit
```

## Notes

- Reads `~/.local/share/omarchy/install/omarchy-base.packages` and `omarchy-other.packages` as the manifest of record.
- Override the install path with `OMARCHY_PATH=/custom/path omarchy-audit`.
- Dry-run by default — every removal is shown via `pacman -Rs --print` before any actual change.
- Pacman handles dependency safety. If a removal would break something, pacman refuses, the script reports it, you move on.

## License

MIT
