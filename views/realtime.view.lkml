view: realtime {
  sql_table_name: `uxlwqzc-cdip-sandbox-test.web_analytics.realtime` ;;

  dimension: browser {
    type: string
    sql: ${TABLE}.Browser ;;
  }
  dimension: campaign {
    type: string
    sql: ${TABLE}.Campaign ;;
  }
  dimension: city {
    type: string
    sql: ${TABLE}.City ;;
  }
  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.Country ;;
  }
  dimension: customer_id {
    type: string
    sql: ${TABLE}.CustomerID ;;
  }
  dimension: device_type {
    type: string
    sql: ${TABLE}.`Device type` ;;
  }
  dimension: event_category {
    type: string
    sql: ${TABLE}.`Event category` ;;
  }
  dimension: event_id {
    type: string
    sql: ${TABLE}.`Event id` ;;
  }
  dimension: event_name {
    type: string
    sql: ${TABLE}.`Event name` ;;
  }
  dimension_group: events_ts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.Events_ts ;;
  }
  dimension: firsttimeuser {
    type: yesno
    sql: ${TABLE}.Firsttimeuser ;;
  }
  dimension: hostname {
    type: string
    sql: ${TABLE}.Hostname ;;
  }
  dimension: is_consented {
    type: yesno
    sql: ${TABLE}.isConsented ;;
  }
  dimension: language {
    type: string
    sql: ${TABLE}.Language ;;
  }
  dimension: medium {
    type: string
    sql: ${TABLE}.Medium ;;
  }
  dimension: operating_system {
    type: string
    sql: ${TABLE}.`Operating system` ;;
  }
  dimension_group: page_load {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.Page_load_time ;;
  }
  dimension: page_title {
    type: string
    sql: ${TABLE}.`Page title` ;;
  }
  dimension: page_url {
    type: string
    sql: ${TABLE}.`page URL` ;;
  }
  dimension: region {
    type: string
    sql: ${TABLE}.Region ;;
  }
  dimension: session_id {
    type: string
    sql: ${TABLE}.SessionID ;;
  }
  dimension: source {
    type: string
    sql: ${TABLE}.Source ;;
  }
  dimension: user_id {
    type: string
    sql: ${TABLE}.UserID ;;
  }
  dimension: visit_id {
    type: string
    sql: ${TABLE}.VisitID ;;
  }
  measure: count {
    type: count
    drill_fields: [event_name, page_url, hostname, sessions.session_id, users.user_id, page_title]
  }
  measure: Visits {
    type: number
    sql: count(${TABLE}.visitId);;
  }
  measure: LoggedIn_Users {
    type: count_distinct
    sql: ${TABLE}.customerID ;;
  }
  measure: Users {
    type: count_distinct
    sql: ${TABLE}.userID ;;
  }
  measure: Event_Count {
    type: count
    sql: ${TABLE}.eventID;;
  }
  measure: pageview_count {
    type: number
    sql: count((${TABLE}.pageUrl)) ;;
  }
}
