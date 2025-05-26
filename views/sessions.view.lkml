view: sessions {

  derived_table: {
    sql: with cte as (
  select visitId,
  date(max(event_ts)) as session_date,
any_value(customerId) as customerId, -- customer_id
any_value(userId) as userId, -- user_id
any_value(geo.region) as location,
any_value(eventhitcount) as eventhitcount,
count(*) as num_events,
min(event_ts) as begin_timestamp,
max(event_ts) as end_timestamp,
datetime_diff(max(event_ts) , min(event_ts),second) as session_duration,
array_agg(eventName) as events,
array_agg(distinct page.pageUrl) as pages
,any_value(session.source) as source
,any_value(session.medium) as medium
,any_value(session.campaign ) as campaign
,any_value(session.content ) as content
,any_value(session.firstTimeUser) as firstTimeUser
,any_value(session.firstPage) as firstPage
,any_value(device.browser) as browser
,any_value(device.browserversion) as browserversion
,any_value(device.deviceType) as deviceType
,any_value(device.os) as os
,any_value(device.osVersion) as osVersion
,any_value(device.screenHeight) as screenHeight
,any_value(device.screenWidth) as screenWidth
,any_value(geo.country) as country
,any_value(geo.region) as region
,any_value(geo.city) as city,
max_by(page.pageName,event_ts) as exit_page
from `uxlwqzc-cdip-sandbox-test.web_analytics.dynamicschema`
 where event_ts is not null
 group by 1)

 select
visitId,
session_date,
customerId,
userID,
location,
eventhitcount,
begin_timestamp,
end_timestamp,
timestamp_diff(end_timestamp, begin_timestamp, second) as session_duration,  --Avg session duration
search(events,'purchase') as purchase_flag,  -- conversion rate
0 as transaction_value,
case when session_duration > 25 or array_length(pages) > 1 then 1 else 0 end as engaged_session_flag  -- engagement/bounce rate
,source
,medium
,campaign
,content
,'' as channel_grouping_id,
firstTimeUser,
firstPage,
exit_page
,struct(browserversion,deviceType,os,osVersion,screenHeight,screenWidth,browser)
,struct(country,region,city)
from cte ;;
  }
  drill_fields: [visit_id]

  dimension: visit_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.visitId ;;
  }
  dimension: event_hit_count {
    type: number
    sql: ${TABLE}.eventhitcount ;;
  }
  dimension: session_id {
    type:  number
    sql: CASE
    WHEN ${event_hit_count} > 1 THEN ${visit_id}
    ELSE NULL
    END ;;
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


  measure: Visits {
    type: count_distinct
    sql: ${TABLE}.visitID ;;
  }
  measure: Users {
    type: count_distinct
    sql: ${TABLE}.userID ;;
  }
  measure: Sessions {
    type: count_distinct
    sql: ${TABLE}.visitId ;;
    filters: [event_hit_count: ">1"]
  }

  dimension: Bounce_Visit_Flag {
    type: yesno
    sql: (
      SELECT COUNT(eventhitcount)
      FROM web_analytics.sessions AS inner_sess
      WHERE inner_sess.visitId = ${TABLE}.visitId and session_date is not null and visitId is not null
    ) = 1 ;;
  }


  measure: Bounce_Sessions {
    type: count_distinct
    sql: ${TABLE}.visitId ;;
    filters: [Bounce_Visit_Flag: "yes"]
    ##filters: [ session_duration: "<15"]
  }
  measure: Bounce_Rate {
    type: number
    sql: CASE
        WHEN ${Sessions} = 0 THEN NULL
        ELSE SAFE_DIVIDE(${Bounce_Sessions}, ${Sessions})
      END ;;
    value_format_name: percent_2
    label: "Bounce Rate"
    description: "Percentage of sessions that resulted in a bounce (event_hit_count = 1 and session_duration < 15s)"
  }

  # measure: Bounces {
  #   type: number
  #   sql: count(${is_bounce});;
  # }


  measure: New_Users {
    type: count_distinct
      sql: ${TABLE}.userID ;;
      filters: [first_time_user: "yes"]
      label: "New Users"


  }
  measure: Returning_Users {
    type: count_distinct
    sql: ${TABLE}.userID ;;
    filters: [first_time_user: "no"]
    label: "Returning Users"


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
    filters: [visit_id: "-NULL",session_date: "last 7 days"]
  }
  measure: Daily_Active_Users {
    type: count_distinct
    sql: ${TABLE}.userID ;;
    filters: [visit_id: "-NULL",session_date:"today "]
  }
  measure: Weekly_Active_Users {
    type: count_distinct
    sql: ${TABLE}.userID ;;
    filters: [visit_id: "-NULL",session_date: "7 days ago for 7 days"]
  }
  measure: Monthly_Active_Users {
    type: count_distinct
    sql: ${TABLE}.userID ;;
    filters: [visit_id: "-NULL",session_date: "last 30 days"]
  }
  measure: User_Stickiness {
    type: number
    sql: round((${Daily_Active_Users}/NULLIF(${Monthly_Active_Users}, 0)),2) ;;
  }
  measure: Engaged_Sessions {
    type: count_distinct
    sql:  ${visit_id} ;;
    filters: [engaged_session_flag: "1"]
  }
  measure: Engaged_Sessions_Per_User {
    type: number
    sql: round((${Engaged_Sessions}/count(distinct ${TABLE}.userID)),2) ;;
  }
}
