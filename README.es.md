# omarchy-audit

> 📖 **Español** · [English](README.md)

TUI interactiva para auditar y limpiar tu instalación de [omarchy](https://omarchy.org).

![demo](demo.gif)

Pacseek y bauh te dejan desinstalar paquetes, pero no saben qué viene de fábrica con omarchy y qué agregaste tú. **omarchy-audit lee el manifiesto de paquetes propio de omarchy**, así te dice exactamente cuáles son del sistema (no tocar) y cuáles instalaste tú (probablemente puedes eliminarlos).

```
╭───────────────────────────────────────────────╮
│  omarchy-audit  2026-05-20 18:00              │
│                                               │
│  Core omarchy    131 paquetes (no tocar)      │
│  Tuyos           55 paquetes (instalaste tú)  │
│  Huérfanos       0 dependencias sin uso       │
│  Cache pacman    12,5 GiB en disco            │
╰───────────────────────────────────────────────╯
```

## Qué hace

- **📦 Tus paquetes** — instalaciones explícitas que NO están en el manifiesto de omarchy. Selección múltiple para remover.
- **👻 Huérfanos** — dependencias huérfanas (`pacman -Qtdq`).
- **🗑️ Cache pacman** — usa `paccache` para botar generaciones viejas o purgar archivos de paquetes ya desinstalados.
- **🔒 Core omarchy** — listado solo lectura, para ver qué vino con la distro.

Toda acción destructiva muestra primero `pacman -Rs --print` y pide confirmación. Pacman mismo es la red de seguridad: rechaza remover cualquier cosa de la que aún dependa otro paquete.

## Instalación

Requiere: `bash`, `pacman`, [`gum`](https://github.com/charmbracelet/gum), `expac`, `pacman-contrib` (para `paccache`).

```bash
sudo pacman -S gum expac pacman-contrib
git clone https://github.com/<tú>/omarchy-audit.git
sudo install -m 755 omarchy-audit/bin/omarchy-audit /usr/local/bin/
```

Luego:

```bash
omarchy-audit
```

## Idiomas

La UI es bilingüe (inglés / español). La detección sigue `$LANG` — locales en español (`es_*`) muestran español, el resto inglés. Forzar con:

```bash
OMARCHY_AUDIT_LANG=es omarchy-audit
OMARCHY_AUDIT_LANG=en omarchy-audit
```

## Notas

- Lee `~/.local/share/omarchy/install/omarchy-base.packages` y `omarchy-other.packages` como manifiesto de referencia.
- Sobrescribe la ruta con `OMARCHY_PATH=/ruta/custom omarchy-audit`.
- Dry-run por defecto — cada eliminación se muestra vía `pacman -Rs --print` antes de cualquier cambio real.
- Pacman maneja la seguridad de dependencias. Si algo se rompería, pacman rechaza, el script reporta, tú decides el siguiente paso.

## Licencia

MIT
