view: sessions {

  derived_table: {
    sql: WITH cte AS (
  SELECT
    visitId,
    COUNT(eventhitcount) AS ct
  FROM `uxlwqzc-cdip-sandbox-test.web_analytics.dynamicschema`
  WHERE event_ts IS NOT NULL
  GROUP BY visitId
),
visits AS (
  SELECT
    CASE WHEN cte.ct > 1 THEN cte.visitId ELSE NULL END AS sessionId,
    sess.session_date, sess.customerId, sess.userId, sess.location,
    sess.begin_timestamp, sess.end_timestamp, sess.session_duration,
    sess.purchase_flag, sess.total_transaction_value,
    sess.engaged_session_flag, sess.source, sess.medium,
    sess.campaign, sess.content, sess.channel_grouping_id,
    sess.firsttimeUser, sess.firstPage, sess.exit_page,
    sess.device.browserversion, sess.device.deviceType,
    sess.device.os, sess.device.osVersion,
    sess.device.screenHeight, sess.device.screenwidth,
    sess.device.browser,
    sess.geo.country, sess.geo.region, sess.geo.city
  FROM `uxlwqzc-cdip-sandbox-test.web_analytics.sessions` AS sess
  LEFT JOIN cte ON cte.visitId = sess.visitId
  WHERE sess.session_date IS NOT NULL
)
SELECT *
FROM visits
WHERE sessionId IS NOT NULL ;;
  }
  drill_fields: [session_id]

  dimension: session_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.sessionId ;;
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
  dimension: landing_page {
    type: string
    sql: ${TABLE}.firstPage ;;

  }
  dimension: first_time_user {
    type: "yesno"
    sql: ${TABLE}.firstTimeUser ;;
    group_label: "Session"
    group_item_label: "First Time User"
  }
  dimension: device__browser {
    type: string
    sql: ${TABLE}.browser ;;
    group_label: "Device"
    group_item_label: "Browser"
  }
  dimension: device__browserversion {
    type: string
    sql: ${TABLE}.browserversion ;;
    group_label: "Device"
    group_item_label: "Browserversion"
  }
  dimension: device__device_type {
    type: string
    sql: ${TABLE}.deviceType ;;
    group_label: "Device"
    group_item_label: "Device Type"
  }
  dimension: device__os {
    type: string
    sql: ${TABLE}.os ;;
    group_label: "Device"
    group_item_label: "OS"
  }
  dimension: device__os_version {
    type: string
    sql: ${TABLE}.osVersion ;;
    group_label: "Device"
    group_item_label: "OS Version"
  }
  dimension: device__screen_height {
    type: number
    sql: ${TABLE}.screenHeight ;;
    group_label: "Device"
    group_item_label: "Screen Height"
  }
  dimension: device__screen_width {
    type: number
    sql: ${TABLE}.screenWidth ;;
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
    sql: ${TABLE}.city ;;
    group_label: "Geo"
    group_item_label: "City"
  }
  dimension: geo__country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
    group_label: "Geo"
    group_item_label: "Country"
  }
  dimension: geo__region {
    type: string
    sql: ${TABLE}.region ;;
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
  measure: Users {
    type: count_distinct
    sql: ${TABLE}.userID ;;
  }
  measure: New_Users {
    type: count
    filters: [first_time_user: "yes"]
  }
  measure: Returning_Users {
    type: count
    filters: [first_time_user: "No"]
  }

  measure: Avg_Session_Duration {
    type: number
    sql: round((sum(${session_duration})/${Sessions})/60,2) ;;
  }
  measure: Avg_Session_Duration_min_secs {
    type: string
    sql:  CONCAT(
          FLOOR(AVG(${TABLE}.session_duration) / 60), ' min ',
          CAST(MOD(CAST(AVG(${TABLE}.session_duration) AS INT64), 60) AS STRING), ' sec'
        ) ;;
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
    sql: round((${Engaged_Sessions}/count(distinct ${TABLE}.userID)),2) ;;
  }
}
