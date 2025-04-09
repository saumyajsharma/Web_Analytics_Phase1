# The name of this view in Looker is "Pages"
view: pages {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `web_analytics.pages` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Environment" in Explore.

  dimension: environment {
    type: string
    sql: ${TABLE}.environment ;;
  }

  dimension: landing_page {
    type: string
    sql:   CASE WHEN ${TABLE}.pageviewID = (SELECT MIN(pageviewID) FROM pages WHERE sessionID = ${TABLE}.sessionID)
    THEN ${TABLE}.pageUrl
    ELSE NULL
    END ;;
  }

  dimension: page_content_type {
    type: string
    sql: ${TABLE}.pageContentType ;;
  }

  dimension: page_hostname {
    type: string
    sql: ${TABLE}.pageHostname ;;
  }

  dimension: page_language {
    type: string
    sql: ${TABLE}.pageLanguage ;;
  }

  dimension: page_load_time {
    type: string
    sql: ${TABLE}.pageLoadTime ;;
  }

  dimension: page_name {
    type: string
    sql: ${TABLE}.pageName ;;
  }

  dimension: page_path {
    type: string
    sql: ${TABLE}.pagePath ;;
  }

  dimension: page_referrer {
    type: string
    sql: ${TABLE}.pageReferrer ;;
  }

  dimension: page_title {
    type: string
    sql: ${TABLE}.pageTitle ;;
  }

  dimension: page_url {
    type: string
    sql: ${TABLE}.pageUrl ;;
  }

  dimension: pageview_id {
    type: string
    sql: ${TABLE}.pageviewID ;;
  }

  dimension: scroll_depth {
    type: string
    sql: ${TABLE}.scrollDepth ;;
  }

  dimension: session_id {
    type: string
    sql: ${TABLE}.sessionID ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.userID ;;
  }
  measure: first_page_view {
    type: min
    sql: ${TABLE}.pageviewID ;;
  }
  measure: count {
    type: count
    drill_fields: [page_hostname, page_name]
  }
}
