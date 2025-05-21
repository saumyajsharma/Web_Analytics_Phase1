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
    sql: ${TABLE}.Device_type` ;;
  }
  dimension: event_category {
    type: string
    sql: ${TABLE}.Event_category ;;
  }
  dimension: event_id {
    type: string
    sql: ${TABLE}.Event_id ;;
  }
  dimension: event_name {
    type: string
    sql: ${TABLE}.Event_name ;;
  }
  dimension_group: event_ts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.Event_ts ;;
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
    sql: ${TABLE}.Operating_system ;;
  }
  dimension_group: page_load {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.Page_load_time ;;
  }
  dimension: page_title {
    type: string
    sql: ${TABLE}.Page_title ;;
  }
  dimension: page_url {
    type: string
    sql: ${TABLE}.Page_URL ;;
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
  measure: Visits {
    type: number
    sql: count(${TABLE}.visitId);;
  }
  measure: LoggedIn_Users {
    type: number
    sql: count(distinct ${TABLE}.customerID) ;;
  }
  measure: Users {
    type: number
    sql: count(distinct ${TABLE}.userID) ;;
  }
  measure: Event_Count {
    type: number
    sql: count(${event_id});;
  }
  measure: pageview_count {
    type: number
    sql: count((${TABLE}.page_Url)) ;;
  }
}
