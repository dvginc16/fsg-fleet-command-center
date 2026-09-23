# 04 — Verify the numbers against the source data

**Use this when:** a dashboard exists and you need to be able to say, out loud,
in front of people, that the numbers are right.

**You will need:** the dashboard path and the source data path. Nothing else.

**Run this before every client meeting.** It is the cheapest prompt in the folder
and it is the one that keeps you out of trouble.

---

## The prompt — copy from here

```
I want you to independently verify every number in a Power BI dashboard against
its source data. Do not change the dashboard. Read only.

  Dashboard        [FULL PATH TO .pbix FILE]
  Source data      [FULL PATH TO CSV OR EXCEL FILE]

## Method

1. Open the dashboard and list every figure that appears on screen — every KPI
   card, every visual total, every subtotal in the premium build-up. Do not
   skip a page.

2. For each figure, recompute it independently from the raw source file. Do not
   read the dashboard's own measure and repeat it back — that proves nothing.
   Compute it from the underlying rows.

3. Produce one table:

     | Figure | Page | Dashboard value | Independent value | Match |

4. State the result as "[N] of [N] matched".

5. For anything that does not match:
     - show both values and the difference
     - say which one you believe is correct, and why
     - do NOT fix it in this run — just report it

## Rules

- Read only. Do not save, do not modify, do not re-import.
- Do not modify the source data file.
- Rounding: treat values as matching only if they agree to
  [NUMBER — e.g. 2] decimal places. Say so if a mismatch is rounding alone.

[ OPTIONAL — delete if not needed ]
Also check these specific relationships hold:
  - [RELATIONSHIP — e.g. "Total combined premium = fleet premium + endorsement"]
  - [RELATIONSHIP — e.g. "Claims frequency = total claims / (fleet size x years)"]
Show the arithmetic for each.
```

## Copy to here

---

**You should get back:**

A single table and a score. That is all you need.

**Reading the result:**

| Result | What it means | What to do |
| --- | --- | --- |
| N of N matched | Safe to present | Go |
| A mismatch that is rounding only | Cosmetic | Note it, present anyway |
| A mismatch in a real value | The dashboard is wrong, or the data is | Fix before presenting |
| No table produced | Nothing was verified | Run it again properly |

The last row is the common one. "It all looks correct" is not verification.
Insist on the table.
