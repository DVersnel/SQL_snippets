WITH RECURSIVE property_ids AS (
    #Anchor 
    SELECT 
        id,
        TRIM(SUBSTRING_INDEX(properties, ',', 1)) AS first_id,
        SUBSTRING(properties, LOCATE(',', properties) + 1) AS remaining_ids,
        LOCATE(',', properties) AS has_comma
    FROM mhl_detaildefs
    WHERE properties IS NOT NULL AND properties != ''

    UNION ALL

    #Recursive 
    SELECT 
        id,
        TRIM(SUBSTRING_INDEX(remaining_ids, ',', 1)) AS first_id,
        IF(LOCATE(',', remaining_ids) > 0, SUBSTRING(remaining_ids, LOCATE(',', remaining_ids) + 1), '') AS remaining_ids,
        LOCATE(',', remaining_ids) AS has_comma
    FROM property_ids
    #Stop condition

    WHERE has_comma > 0 OR remaining_ids != ''
)

select * from property_ids
order by id;
