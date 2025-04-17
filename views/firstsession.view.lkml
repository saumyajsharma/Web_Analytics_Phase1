view: firstsession {
  derived_table: {
    sql: WITH cte AS (
           SELECT
             userId,
             source,
             medium,
             campaign,
             ROW_NUMBER() OVER(PARTITION BY userId ORDER BY begin_timestamp ASC) AS rnk
           FROM `uxlwqzc-cdip-sandbox-test.web_analytics.sessions`
         )
         SELECT userId, source, medium, campaign
         FROM cte
         WHERE rnk = 1 ;;

  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.userId ;;
    primary_key: yes
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: medium {
    type: string
    sql: ${TABLE}.medium ;;
  }

  dimension: campaign {
    type: string
    sql: ${TABLE}.campaign ;;
  }
  dimension: Primary_Default_Channel_Group {
    type: string
    sql: CASE
      WHEN LOWER(${source}) IN ('google', 'bing', 'yahoo') AND ${medium} = 'organic' THEN 'Organic Search'
      WHEN LOWER(${source}) IN ('google', 'bing') AND ${medium} = 'cpc' THEN 'Paid Search'
      WHEN LOWER(${source}) IN ('facebook', 'instagram', 'linkedin', 'twitter', 'tiktok') THEN 'Social'
      WHEN LOWER(${source}) = 'direct' OR ${source} IS NULL THEN 'Direct'
      WHEN LOWER(${medium}) = 'email' THEN 'Email'
      WHEN LOWER(${medium}) = 'affiliate' THEN 'Affiliate'
      WHEN LOWER(${medium}) = 'referral' THEN 'Referral'
      ELSE 'Other'
    END ;;
  }
  measure: Users {
    type: number
    sql: count(distinct ${TABLE}.userId);;
  }
}
