# 02 — Change an existing dashboard

**Use this when:** the `.pbix` already exists and you want one thing different.

**You will need:** the file path, and a clear statement of the one change.

**Why this is a separate prompt:** the build prompt rebuilds the data model. Run
it against an existing file and every number shifts, including the ones you were
not touching. This prompt says the opposite: change one thing, touch nothing else,
and prove nothing else moved.

---

## The prompt — copy from here

```
I want you to make one specific change to a Power BI dashboard that already
exists, and prove you changed nothing else.

## The file

  Dashboard        [FULL PATH TO .pbix FILE]
  Source data      [FULL PATH TO CSV OR EXCEL FILE]

Before you change anything:
  1. Make a copy of the .pbix saved as [SAME NAME]_BEFORE_[YYYY-MM-DD].pbix in
     the same folder. Tell me the path.
  2. Open the dashboard and list every page, every visual, and every measure so
     I can confirm you are looking at the right file.

## The change

[ STATE THE ONE CHANGE — be specific about which visual, on which page ]

Examples of the right level of detail:
  - "On the Claims Experience page, change the claims-by-year visual from a
     line chart to a clustered column chart. Keep the same measure and the
     same axis."
  - "On the Executive Summary page, add a KPI card showing [MEASURE NAME],
     placed to the right of [EXISTING CARD NAME]."
  - "Change the Own Damage loading from [OLD PERCENT] % to [NEW PERCENT] % and
     let every downstream premium figure recalculate."

[ OPTIONAL — delete if the change is cosmetic only ]
This change is expected to move these figures, and only these:
  - [FIGURE NAME] — because [REASON]
  - [FIGURE NAME] — because [REASON]
Everything else must be unchanged.

## Rules

- Change only what I asked for. If doing it properly requires a second change,
  stop and tell me before making it.
- Do not rebuild the data model. Do not re-import the source. Do not rename
  existing measures.
- Do not modify the source data file.
- Do not modify the _BEFORE_ copy.

## Verification — do not skip this

After making the change:

1. Confirm the change is present, and describe what it looks like now.
2. Compare the edited file against the _BEFORE_ copy and report:
     - which visuals changed
     - which measures changed
     - whether the data model is byte-identical
3. List every KPI and total, and confirm each still matches the raw source
   file. State it as "[N] of [N] matched".
4. If anything moved that I did not expect, say so explicitly and loudly. Do
   not quietly accept it.

Tell me the path of the edited file and the path of the _BEFORE_ copy.
```

## Copy to here

---

**You should get back:**

1. The `_BEFORE_` backup path.
2. A statement that the data model is unchanged (or a clear list of what moved
   and why).
3. "N of N matched" again.

If it says the data model changed and you asked for a colour change, stop and
roll back to the `_BEFORE_` copy.
