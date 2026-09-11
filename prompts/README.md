# FSG Prompt Manual

A prompt library for building and changing fleet analytics dashboards with Claude Code.

**Everything lives in this folder, in this repo.** Not in Downloads. Not in a chat
history. If a prompt is worth reusing, it is committed here or it does not exist.

---

## 1. How to use this folder

Every prompt is a markdown file with **blanks in `[SQUARE BRACKETS]`**.

1. Open the file for the job you are doing (use the picker in section 3).
2. Copy the whole thing.
3. Replace every `[BLANK]` with your real value.
4. Paste into a new Claude Code chat.
5. Delete any optional block you don't need.

If you leave a blank unfilled, Claude will ask you for it rather than invent it.
That is deliberate — an invented fleet size produces an invented premium.

### Filling blanks: the rules

| Rule | Why |
| --- | --- |
| Never leave a number blank and hope | Made-up numbers look exactly like real ones in a chart |
| Write units into the value (`4,200 vehicles`, `AED 18,500`) | Removes an entire class of silent error |
| If you don't know a value, write `UNKNOWN — ask me` | Turns a wrong answer into a question |
| Keep the verification block | It is the only reason to trust the output |

---

## 2. Do prompt manuals exist? (yes)

You asked. They do, and they are a normal thing to have:

- **Prompt library** — the most common name. A folder of reusable, parameterised
  prompts. Anthropic publishes a public one; most teams keep a private one.
- **Prompt playbook / runbook** — same idea, framed around "when X happens, run
  prompt Y." Closer to what you described.
- **Prompt catalogue** — the enterprise name, usually with owners and versions.

What they all share, and what makes them work:

1. **Parameterised, not narrative.** Blanks, not stories.
2. **A picker at the front.** "Use this one when…" — section 3 below.
3. **Versioned in source control.** So the team uses the same text.
4. **Each prompt states its own output contract.** What you get back, so you can
   tell success from failure without reading the whole reply.

This file is that. Nothing exotic.

---

## 3. Which prompt do I use?

| If you want to… | Use | Time |
| --- | --- | --- |
| Build a dashboard from nothing, no existing file | [`01-build-dashboard.md`](01-build-dashboard.md) | ~10 min |
| Change something in a dashboard that already exists | [`02-edit-dashboard.md`](02-edit-dashboard.md) | ~3 min |
| Add or reprice a single coverage or endorsement | [`03-add-coverage.md`](03-add-coverage.md) | ~5 min |
| Prove the numbers on screen match the source data | [`04-verify-numbers.md`](04-verify-numbers.md) | ~5 min |

### The one rule that matters

**Building and editing are different prompts. Do not use the build prompt to edit.**

A build prompt tells Claude to create a data model and lay out a report. Point it
at a file that already exists and it will rebuild the model — which means every
number moves, including the ones you weren't touching. The edit prompt exists
specifically to say *change this one thing, leave the model alone*.

Symptom you got it wrong: you asked to recolour a chart and the totals changed.

---

## 4. Where the outputs go

| Thing | Lives at | Not at |
| --- | --- | --- |
| Prompts | `prompts/` in this repo | A chat window |
| The dashboard | `index.html` in this repo | Downloads |
| Demo video, PDFs | Shared drive, linked from `prompts/ASSETS.md` | Downloads |

Downloads is where files go to be forgotten. Anything you want next month goes
in the repo or the drive, and gets linked from here.

---

## 5. Adding a prompt

When a prompt works twice, it belongs here. Copy the shape of an existing file:

```
# Title
**Use this when:** one sentence.
**You will need:** the blanks, listed up front.
---
[the prompt body, with [BLANKS]]
---
**You should get back:** the output contract.
```

Then commit it. That is the whole process.
