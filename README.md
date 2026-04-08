

## Problem
Query scanning 500,000 rows taking 
3.2 seconds to execute.

## Root Cause
1. Using EXTRACT() on date column
   prevents index usage
2. Missing indexes on filter columns
3. Full sequential table scan

## Solution
1. Rewrote date filter to use range
   (allows index scan)
2. Added composite index on
   (order_date, status)
3. Selected only needed columns

## Results
Before: 3,200ms (Seq Scan)
After:  45ms (Index Scan)
Improvement: 98.6% faster
