view: sessions {
  sql_table_name: `uxlwqzc-cdip-sandbox-test.web_analytics.sessions` ;;
  drill_fields: [session_id]

  dimension: session_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.sessionID ;;
  }
  dimension_group: begin_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.begin_timestamp ;;
  }
  dimension: campaign {
    type: string
    sql: ${TABLE}.campaign ;;
  }
  dimension: channel_grouping_id {
    type: string
    sql: ${TABLE}.channel_grouping_id ;;
  }
  dimension: content {
    type: string
    sql: ${TABLE}.content ;;
  }
  dimension: customer_id {
    type: string
    sql: ${TABLE}.customerId ;;
  }
  dimension: device__browser {
    type: string
    sql: ${TABLE}.device.browser ;;
    group_label: "Device"
    group_item_label: "Browser"
  }
  dimension: device__browserversion {
    type: string
    sql: ${TABLE}.device.browserversion ;;
    group_label: "Device"
    group_item_label: "Browserversion"
  }
  dimension: device__device_type {
    type: string
    sql: ${TABLE}.device.deviceType ;;
    group_label: "Device"
    group_item_label: "Device Type"
  }
  dimension: device__os {
    type: string
    sql: ${TABLE}.device.os ;;
    group_label: "Device"
    group_item_label: "OS"
  }
  dimension: device__os_version {
    type: string
    sql: ${TABLE}.device.osVersion ;;
    group_label: "Device"
    group_item_label: "OS Version"
  }
  dimension: device__screen_height {
    type: number
    sql: ${TABLE}.device.screenHeight ;;
    group_label: "Device"
    group_item_label: "Screen Height"
  }
  dimension: device__screen_width {
    type: number
    sql: ${TABLE}.device.screenWidth ;;
    group_label: "Device"
    group_item_label: "Screen Width"
  }
  dimension_group: end_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.end_timestamp ;;
  }
  dimension: engaged_session_flag {
    type: number
    sql: ${TABLE}.engaged_session_flag ;;
  }
  dimension: exit_page {
    type: string
    sql: ${TABLE}.exit_page ;;
  }
  dimension: geo__city {
    type: string
    sql: ${TABLE}.geo.city ;;
    group_label: "Geo"
    group_item_label: "City"
  }
  dimension: geo__country {
    type: string
    sql: ${TABLE}.geo.country ;;
    group_label: "Geo"
    group_item_label: "Country"
  }
  dimension: geo__region {
    type: string
    sql: ${TABLE}.geo.region ;;
    group_label: "Geo"
    group_item_label: "Region"
  }
  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }
  dimension: medium {
    type: string
    sql: ${TABLE}.medium ;;
  }
  dimension: new_user_flag {
    type: yesno
    sql: ${TABLE}.new_user_flag ;;
  }
  dimension: purchase_flag {
    type: yesno
    sql: ${TABLE}.purchase_flag ;;
  }
  dimension_group: session {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.session_date ;;
  }
  dimension: session_duration {
    type: number
    sql: ${TABLE}.session_duration ;;
  }
  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }
  dimension: total_transaction_value {
    type: number
    sql: ${TABLE}.total_transaction_value ;;
  }
  dimension: user_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.userId ;;
  }
  measure: count {
    type: count
    drill_fields: [session_id, users.user_id, dynamicschema.count]
  }
  measure: Sessions {
    type: number
    sql: count(${TABLE}.sessionID);;
  }
  measure: New_Users {
    type: count
    filters: [new_user_flag: "Yes"]
  }
  measure: Returning_Users {
    type: count
    filters: [new_user_flag: "No"]
  }

  measure: Avg_Session_Duration {
    type: number
    sql: round((sum(${session_duration})/${Sessions})/60,2) ;;
  }
  measure: Sessions_Per_User{
    type: number
    sql: round((${Sessions}/count( distinct ${TABLE}.userID)),2) ;;
  }
  measure: Active_Users {
    type: count_distinct
    sql: ${TABLE}.userID ;;
    filters: [session_id: "-NULL",session_date: "last 7 days"]
  }
  measure: Daily_Active_Users {
    type: count_distinct
    sql: ${TABLE}.userID ;;
    filters: [session_id: "-NULL",session_date:"1 day ago for 1 day"]
  }
  measure: Weekly_Active_Users {
    type: count_distinct
    sql: ${TABLE}.userID ;;
    filters: [session_id: "-NULL",session_date: "7 days ago for 7 days"]
  }
  measure: Monthly_Active_Users {
    type: count_distinct
    sql: ${TABLE}.userID ;;
    filters: [session_id: "-NULL",session_date: "30 days ago for 30 days"]
  }
  measure: User_Stickiness {
    type: number
    sql: round((${Daily_Active_Users}/NULLIF(${Monthly_Active_Users}, 0)),2) ;;
  }
  measure: Engaged_Sessions {
    type: count
    filters: [engaged_session_flag: "1"]
  }
  measure: Engaged_Sessions_Per_User {
    type: number
    sql: round((${Engaged_Sessions}/count( distinct ${TABLE}.userID)),2) ;;
  }
}
