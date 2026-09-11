# 03 — Add or reprice a coverage / endorsement

**Use this when:** the pricing basis changes — a new peril, a new endorsement, or
a revised loading — and the premium build-up needs to follow it through.

**You will need:** the coverage name, its own claims history, and how it should
be priced relative to the main fleet cover.

**This is a narrower case of `02-edit-dashboard.md`.** Use that one if you are
only moving a visual around. Use this one when money changes.

---

## The prompt — copy from here

```
I want to add or reprice a coverage in an existing Power BI dashboard, and have
the premium build-up follow it through correctly.

## The file

  Dashboard        [FULL PATH TO .pbix FILE]
  Source data      [FULL PATH TO CSV OR EXCEL FILE]

Make a _BEFORE_ copy first, as [SAME NAME]_BEFORE_[YYYY-MM-DD].pbix, and tell
me the path.

## The coverage

  Name                    [COVERAGE OR ENDORSEMENT NAME]
  Type                    [ CHOOSE: new coverage / reprice of existing ]
  Applies to              [ CHOOSE: whole fleet / vehicle class [CLASS] /
                            model years [RANGE] / makes [LIST] ]

  Its claims history      [NUMBER] claims over [START YEAR]–[END YEAR]
  Total claims cost       [CURRENCY + AMOUNT]
  Exposure basis          [NUMBER] vehicles × [NUMBER] years

  Price it as             [ CHOOSE ONE — delete the rest ]
                          - a separate endorsement, shown as its own premium line
                          - a percentage loading of [PERCENT] % on the technical
                            premium
                          - a flat amount of [CURRENCY + AMOUNT] per vehicle

[ OPTIONAL — delete if not applicable ]
  Apply the same escalation as the main cover ([PERCENT] % YoY).
  Apply the same target loss ratio ([PERCENT] %).

## What must change

  1. The premium build-up page gains (or updates) a step for this coverage,
     with its formula shown like the existing steps.
  2. The combined premium total includes it.
  3. The executive summary shows it as its own KPI card, separate from the
     main fleet premium.

## What must NOT change

  - The main fleet premium calculation.
  - Any claims-experience figure that is not this coverage.
  - The source data file.

If pricing this properly requires changing something in the "must not change"
list, stop and explain why before doing it.

## Verification — do not skip this

1. Show the full premium build-up as a table, step by step, before and after,
   so I can see exactly which lines moved.
2. Confirm the new total equals the sum of its parts. Show the arithmetic.
3. Re-verify every other KPI against the raw source file and report
   "[N] of [N] matched".
4. Confirm the main fleet premium is unchanged, and state its value before
   and after.
```

## Copy to here

---

**You should get back:**

1. A before/after premium build-up table.
2. Arithmetic showing the total is the sum of its parts.
3. An explicit statement that the main fleet premium did not move.

The third one is the point. A new endorsement that silently changed the base
premium is the failure this prompt exists to catch.
