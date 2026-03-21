## ETL Decisions

### Decision 1 — Date Format Standardization
Problem: The dataset contained inconsistent date formats such as DD-MM-YYYY and MM/DD/YYYY.
Resolution: All dates were converted into a standard YYYY-MM-DD format before loading into the dim_date table.

### Decision 2 — Category Standardization
Problem: Product categories were inconsistent (e.g., "electronics", "ELECTRONICS").
Resolution: All category values were standardized into proper case such as "Electronics", "Clothing", and "Groceries".

### Decision 3 — Handling Missing Values
Problem: Some rows had NULL or missing values in important columns like store or product.
Resolution: Missing values were either replaced with "Unknown" or such rows were removed to maintain data quality.