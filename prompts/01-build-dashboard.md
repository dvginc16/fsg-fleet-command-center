# 01 — Build a new dashboard from nothing

**Use this when:** there is no dashboard yet. You have a data file (or you want
one generated), and you want a working Power BI report at the end.

**You will need:** fleet size, the claims history years, average severity, and
the loading percentages. All listed as blanks below.

**Do not use this to change an existing dashboard** — use `02-edit-dashboard.md`.
This prompt rebuilds the data model, which moves every number in the report.

---

## The prompt — copy from here

```
I want you to build a Power BI dashboard on this machine, end to end, and then
prove the numbers are right. Work in steps and stop for my confirmation between
each step.

## The data

[ CHOOSE ONE — delete the other ]

OPTION A — I have the data:
The source file is at [FULL PATH TO CSV OR EXCEL FILE].
Read it first and tell me what columns and how many rows you found before you
build anything. Do not assume the schema.

OPTION B — invent representative data:
Generate a realistic CSV first and save it to [FOLDER PATH] before building
anything. It must cover [NUMBER] vehicles over the period [START YEAR] to
[END YEAR], with these columns:
  - Vehicle ID
  - Make                  (e.g. [MAKE — e.g. Toyota, Mitsubishi, Isuzu])
  - Model                 (e.g. [MODEL — e.g. Hilux, Canter, D-Max])
  - Model year            (range [EARLIEST YEAR] to [LATEST YEAR])
  - Vehicle class         ([CLASSES — e.g. Light Commercial, Heavy Goods, Bus, Plant])
  - Chassis / VIN
  - Engine or manufacturing number
  - Registration date
  - Odometer at period end
  - Claim count in period
  - Claim amount in period ([CURRENCY — e.g. AED])
  - Claim type            ([TYPES — e.g. Own Damage, Third Party, Theft, Fire])
Show me the first 10 rows and the row count before moving on.

## The pricing basis

Use these values. Do not substitute your own.

  Fleet size                    [NUMBER] vehicles
  Exposure window               [NUMBER] years ([START YEAR]–[END YEAR])
  Claims frequency (lambda)     [VALUE, or "calculate it from the data"]
  Average severity (mu)         [CURRENCY + AMOUNT] per claim
  Year-on-year escalation       [PERCENT] %
  Own damage loading            [PERCENT] %
  Target loss ratio (TLR)       [PERCENT] %
  Currency                      [CURRENCY]

[ OPTIONAL — delete if no special peril ]
  Special peril                 [PERIL NAME]
  Its own claim history         [NUMBER] claims over [YEARS]
  Priced separately as an endorsement, shown as its own line.

## What to build

A Power BI (.pbix) file saved to [FOLDER PATH], named [FILE NAME].pbix, with
these pages:

  1. Executive summary — the headline KPI cards: fleet size, claims frequency,
     average severity, technical premium, total premium, target loss ratio.
  2. Claims experience — claims by year, by [BREAKDOWN — e.g. vehicle class],
     and the frequency trend.
  3. Premium build-up — each step of the calculation as its own visible row, so
     a reader can follow frequency → severity → pure premium → loadings →
     technical premium → fleet premium. Show the formula for each step.
  4. Fleet composition — the mix by [DIMENSION — e.g. make, class, model year].

[ OPTIONAL — delete if not wanted ]
  5. Sensitivity — how total premium moves as TLR varies from [LOW] % to
     [HIGH] %.

## Rules

- Every number on screen must be a DAX measure over the source data. No values
  typed into a text box. If a number cannot be derived from the data, tell me
  instead of hardcoding it.
- Name each measure for what it is (Claims Frequency, Pure Premium, Technical
  Premium), not Measure1.
- Keep the source file unmodified. Read from it, never write to it.
- Tell me the exact file path of everything you save.

## Verification — do not skip this

When the dashboard is built, verify it before telling me you are done:

1. List every KPI and every visual total in the report.
2. For each one, compute the same figure independently from the raw source file.
3. Show me a comparison table: measure name, dashboard value, independently
   computed value, match yes/no.
4. State the score as "[N] of [N] matched". If anything does not match, fix it
   and re-run the comparison. Do not report success on a partial match.

Start with the data step and stop for my confirmation.
```

## Copy to here

---

**You should get back:**

1. The data schema and row count, before any building.
2. A `.pbix` file at the path you named.
3. A comparison table ending in "N of N matched".

If you did not get the comparison table, the dashboard is not verified — ask for
it before you show the thing to anyone.
