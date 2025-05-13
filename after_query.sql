SELECT 
  Jobs.id,
  Jobs.name,
  Jobs.media_id,
  Jobs.job_category_id,
  Jobs.job_type_id,
  Jobs.description,
  Jobs.detail,
  Jobs.location,
  Jobs.salary_statistic_group,
  Jobs.salary_range_remarks,
  Jobs.restriction,
  Jobs.remarks,
  Jobs.sort_order
FROM
  Jobs
INNER JOIN job_categories JobCategories 
  ON JobCategories.id = Jobs.job_category_id 
  AND JobCategories.deleted IS NULL
INNER JOIN job_types JobTypes 
  ON JobTypes.id = Jobs.job_type_id 
  AND JobTypes.deleted IS NULL
WHERE
  (
    MATCH(
      Jobs.name,
      Jobs.description,
      Jobs.detail,
      Jobs.business_skill,
      Jobs.knowledge,
      Jobs.location,
      Jobs.activity,
      Jobs.salary_statistic_group,
      Jobs.salary_range_remarks,
      Jobs.restriction,
      Jobs.remarks
    ) AGAINST ('キャビンアテンダント' IN BOOLEAN MODE)
    OR JobCategories.name LIKE '%キャビンアテンダント%'
    OR JobTypes.name LIKE '%キャビンアテンダント%'
  )
  AND Jobs.publish_status = 1
  AND Jobs.deleted IS NULL
ORDER BY
  Jobs.sort_order DESC,
  Jobs.id DESC
LIMIT 50 OFFSET 0;
