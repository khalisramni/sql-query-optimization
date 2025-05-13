# SQL Query Optimization Test

## ⏱ Time Spent
**Total Time:** Approximately 2 hours  
- Analysis and bottleneck identification: 30 mins  
- Query rewrite and index planning: 30 mins  
- Testing and validation (theoretical): 30 mins  
- Documentation & GitHub prep: 30 mins

---

## 🧠 Problem Summary

- The original SQL query took ~8 seconds to execute.
- It included:
  - Excessive `LEFT JOIN` operations
  - Multiple `LIKE '%keyword%'` conditions across multiple joined tables
  - `GROUP BY` on `Jobs.id` which is redundant
  - No use of indexing for sorting or filtering
  - Unoptimized `ORDER BY`, and fetching unnecessary columns

---

## ✅ Improvements Made

### 1. **Reduced Joins**
- Removed unnecessary `LEFT JOIN`s unless required by the search logic.
- Focused the query on the `Jobs`, `JobCategories`, and `JobTypes` tables only.

### 2. **Replaced LIKE with FULLTEXT Search**
- Created `FULLTEXT` index on searchable fields of `Jobs` table.
- Used `MATCH ... AGAINST` for faster searching.

### 3. **Optimized Sorting**
- Added a composite index on `(sort_order DESC, id DESC)` to make `ORDER BY` efficient.

### 4. **Simplified the Query**
- Removed redundant `GROUP BY` since `Jobs.id` is already unique in the result.
- Selected only necessary fields for the search result (not all columns).

---

## 📂 Files Included

- `before_query.sql`: The original slow query (as provided)
- `after_query.sql`: The improved version of the query
- `indexes_to_create.sql`: Indexes recommended for performance optimization

---

## 📌 Note

The `after_query.sql` uses MySQL's `FULLTEXT` search. To run it successfully:
- MySQL must be using `InnoDB` or `MyISAM`
- Fields must be `TEXT`, `VARCHAR`, or `CHAR`
- Use `ALTER TABLE` commands from `indexes_to_create.sql` first
