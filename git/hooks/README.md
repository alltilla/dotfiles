# Global git hooks

`core.hooksPath` points every repository on this machine at this directory.
Every hook here does one thing: hand control to the repository's own hook of
the same name.

## Passthroughs

A global `core.hooksPath` replaces each repository's own hooks directory
outright, so every hook name here hands control to the repository's own hook of
the same name via `chain-local-hook`, preserving its arguments, stdin and exit
code.

Three hook names are deliberately absent, because for them git does not treat
"hook present but doing nothing" as equivalent to "no hook":

| hook | why |
| --- | --- |
| `push-to-checkout` | its presence alone means the default checkout is overridden |
| `proc-receive` | must speak the pkt-line protocol once `receive.procReceiveRefs` is set |
| `fsmonitor-watchman` | reached through `core.fsmonitor` as a literal path; empty output would claim nothing changed |

A repository that needs one of those must keep it in its own hooks directory and
set its own `core.hooksPath`.

## Uninstall

    git config --global --unset core.hooksPath
