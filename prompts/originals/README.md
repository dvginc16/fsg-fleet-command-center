# Original prompts, as actually used in the demo

This folder holds the **verbatim** Prompt A and Prompt B from the recorded
demonstration — the exact text that was pasted, before anyone generalised it.

## Why keep them if `prompts/01` and `prompts/02` already exist?

They are different artefacts and both are worth having:

| | Originals (here) | Templates (`prompts/01`, `02`) |
| --- | --- | --- |
| Text | Exactly what was run | Generalised, with `[BLANKS]` |
| Numbers | The real demo values, hardcoded | Blanks for the user to fill |
| Proven? | Yes — this text produced the recorded result | Reconstructed from the dashboard's logic |
| Use for | Reproducing the demo exactly; auditing the templates | Real client work |

The originals are the **evidence**. The templates are the **product**. If a
template ever misbehaves, diff it against the original here to see what was
lost in generalising.

## Expected files

- `PROMPT-A-build.md` — build a brand-new Power BI dashboard
- `PROMPT-B-edit.md` — change an existing Power BI dashboard

## Status

⚠️ **Not yet populated.** These live on a local machine and are being pulled
in. Until the files above exist, `prompts/01` and `prompts/02` are
reconstructions that have not been diffed against the text that was actually
proven on screen.
