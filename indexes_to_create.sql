-- Fulltext index for searching relevant fields
ALTER TABLE Jobs ADD FULLTEXT (
  name,
  description,
  detail,
  business_skill,
  knowledge,
  location,
  activity,
  salary_statistic_group,
  salary_range_remarks,
  restriction,
  remarks
);

-- Index to improve ORDER BY clause
CREATE INDEX idx_sort_order_id ON Jobs (sort_order DESC, id DESC);

-- Ensure foreign key joins use indexes
CREATE INDEX idx_job_category_id ON Jobs (job_category_id);
CREATE INDEX idx_job_type_id ON Jobs (job_type_id);
