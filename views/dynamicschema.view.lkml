view: dynamicschema {
  derived_table: {
    sql: SELECT * FROM `web_analytics.dynamicschema`  WHERE ingestion_ts IS NOT NULL ;;
  }

  dimension: consents__purposes {
    sql: ${TABLE}.consents.purposes ;;
    group_label: "Consents"
    group_item_label: "Purposes"
  }
  dimension: consents__status {
    type: string
    sql: ${TABLE}.consents.status ;;
    group_label: "Consents"
    group_item_label: "Status"
  }
  dimension: consents__vendors {

    sql: ${TABLE}.consents.vendors ;;
    group_label: "Consents"
    group_item_label: "Vendors"
  }
  dimension: customer_id {
    type: string
    sql: ${TABLE}.customerId ;;
  }
  dimension:  Browser {
    type: string
    sql: ${TABLE}.device.browser ;;
    group_label: "Device"
    group_item_label: "Browser"
  }
  dimension: Browser_Version {
    type: string
    sql: ${TABLE}.device.browserversion ;;
    group_label: "Device"
    group_item_label: "Browserversion"
  }
  dimension: Device_Type {
    type: string
    sql: ${TABLE}.device.deviceType ;;
    group_label: "Device"
    group_item_label: "Device Type"
  }
  dimension: OS{
    type: string
    sql: ${TABLE}.device.os ;;
    group_label: "Device"
    group_item_label: "OS"
  }
  dimension: OS_Version {
    type: string
    sql: ${TABLE}.device.osVersion ;;
    group_label: "Device"
    group_item_label: "OS Version"
  }
  dimension: Screen_Height {
    type: number
    sql: ${TABLE}.device.screenHeight ;;
    group_label: "Device"
    group_item_label: "Screen Height"
  }
  dimension: Screen_Width {
    type: number
    sql: ${TABLE}.device.screenWidth ;;
    group_label: "Device"
    group_item_label: "Screen Width"
  }
  dimension: event_category {
    type: string
    sql: ${TABLE}.eventCategory ;;
  }
  dimension: event_hit_count {
    type: number
    sql: ${TABLE}.eventHitCount ;;
  }
  dimension: event_id {
    type: string
    sql: ${TABLE}.eventId ;;
  }
  dimension: event_name {
    type: string
    sql: ${TABLE}.eventName ;;
  }
  dimension: event_properties {
    hidden: yes
    sql: ${TABLE}.eventProperties ;;
  }
  dimension_group: event_ts {
    type: time
    timeframes: [raw, time, date, week, month, quarter,  year, day_of_month, hour_of_day, minute]
    sql: ${TABLE}.event_ts ;;
  }
  dimension_group: event_ts_ist {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year, day_of_month, hour_of_day, minute]
    sql: TIMESTAMP_ADD(${TABLE}.event_ts, INTERVAL 330 MINUTE) ;;
    convert_tz: no
  }
  dimension: event_day {
    type: date
    sql: ${event_ts_date} ;;
    description: "The date of the event in YYYY-MM-DD format"
  }
  dimension: event_hour {
    type: number
    sql: ${event_ts_hour_of_day} ;;
    description: "The hour of the event (0-23)"
  }
  dimension: event_minute {
    type: number
    sql: ${event_ts_minute} ;;
    description: "The minute of the event (0-59)"
  }
  dimension: ga_client_id {
    type: string
    sql: ${TABLE}.gaClientId ;;
  }
  dimension: City {
    type: string
    sql: ${TABLE}.geo.city ;;
    group_label: "Geo"
    group_item_label: "City"
  }
  dimension: Country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.geo.country ;;
    group_label: "Geo"
    group_item_label: "Country"
  }
  dimension: Region {
    type: string
    sql: ${TABLE}.geo.region ;;
    group_label: "Geo"
    group_item_label: "Region"
  }
  dimension: Location {
    type: string
    sql: ${TABLE}.location ;;
  }
  dimension_group: ingestion_ts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.ingestion_ts ;;
  }
  dimension: environment {
    type: string
    sql: ${TABLE}.page.environment ;;
    group_label: "Page"
    group_item_label: "Environment"
  }
  dimension: page_content_type {
    type: string
    sql: ${TABLE}.page.pageContentType ;;
    group_label: "Page"
    group_item_label: "Page Content Type"
  }
  dimension: page_hostname {
    type: string
    sql: ${TABLE}.page.pageHostname ;;
    group_label: "Page"
    group_item_label: "Page Hostname"
  }
  dimension: page_language {
    type: string
    sql: ${TABLE}.page.pageLanguage ;;
    group_label: "Page"
    group_item_label: "Page Language"
  }
  dimension: page_load_time {
    type: string
    sql: ${TABLE}.page.pageLoadTime ;;
    group_label: "Page"
    group_item_label: "Page Load Time"
  }
  dimension: page_name {
    type: string
    sql: ${TABLE}.page.pageName ;;
    group_label: "Page"
    group_item_label: "Page Name"
  }
  dimension: page_path {
    type: string
    sql: ${TABLE}.page.pagePath ;;
    group_label: "Page"
    group_item_label: "Page Path"
  }
  dimension: page_referrer {
    type: string
    sql: ${TABLE}.page.pageReferrer ;;
    group_label: "Page"
    group_item_label: "Page Referrer"
  }
  dimension: page_title {
    type: string
    sql: ${TABLE}.page.pageTitle ;;
    group_label: "Page"
    group_item_label: "Page Title"
  }
  dimension: page_url {
    type: string
    sql: ${TABLE}.page.pageUrl ;;
    group_label: "Page"
    group_item_label: "Page URL"
  }
  dimension: page_properties {
    sql: ${TABLE}.pageProperties ;;
  }
  dimension: rd_user_id {
    type: string
    sql: ${TABLE}.rdUserId ;;
  }
  dimension: campaign {
    type: string
    sql: ${TABLE}.session.campaign ;;
    group_label: "Session"
    group_item_label: "Campaign"
  }
  dimension: content {
    type: string
    sql: ${TABLE}.session.content ;;
    group_label: "Session"
    group_item_label: "Content"
  }
  dimension: landing_page {
    type: string
    sql: ${TABLE}.session.firstPage ;;

  }
  dimension: first_time_user {
    type: "yesno"
    sql: ${TABLE}.session.firstTimeUser ;;
    group_label: "Session"
    group_item_label: "First Time User"
  }
  dimension: medium {
    type: string
    sql: ${TABLE}.session.medium ;;
    group_label: "Session"
    group_item_label: "Medium"
  }
  dimension: source {
    type: string
    sql: ${TABLE}.session.source ;;
    group_label: "Session"
    group_item_label: "Source"
  }
  dimension_group: start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.session.startTime ;;
  }


  dimension: user_id {
    type: string
    sql: ${TABLE}.userId ;;
  }
  dimension: user_properties {

    sql: ${TABLE}.userProperties ;;
  }
  dimension: visit_id {
    type: string
    sql: ${TABLE}.visitId ;;
  }
  measure: count {
    type: count
    drill_fields: [event_name, page_name, page_hostname, sessions.session_id, users.user_id]
  }
  measure: Visits {
    type: number
    sql: count(${TABLE}.visitId);;
  }

  measure: Sessions {
    type: count_distinct
    sql: ${TABLE}.visitId ;;
    filters: [event_hit_count: ">1"]
  }
  measure: Total_Users {
    type: number
    sql: count(${TABLE}.userID) ;;
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
    type: count_distinct
    sql: ${TABLE}.eventID;;
  }
  measure: PageView_Count {
    type: count
    filters: [event_name: "Page View"]
  }
  measure: Avg_Page_Load_Time {
    type: number
    sql: round(avg(cast(${TABLE}.page.pageLoadTime as decimal))/60,2) ;;
  }
  dimension: Bounce_Visit_Flag {
    type: yesno
    sql: (
      SELECT COUNT(eventhitcount)
      FROM web_analytics.dynamicschema AS inner_sess
      WHERE inner_sess.visitId = ${TABLE}.visitId and ingestion_ts is not null and visitId is not null
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
    sql: SAFE_DIVIDE(${Bounce_Sessions}, ${Visits}) ;;
    value_format_name: percent_2
    label: "Bounce Rate"

  }
  # measure: bounces {
  #   type: count_distinct
  #   sql: CASE
  #         WHEN (
  #           SELECT COUNT(*)
  #           FROM `uxlwqzc-cdip-sandbox-test.web_analytics.dynamicschema` AS sub
  #           WHERE sub.visitId = ${TABLE}.visitId
  #           AND sub.event_ts IS NOT NULL
  #         ) = 1
  #         THEN ${TABLE}.visitId
  #         ELSE NULL
  #       END ;;
  #   filters: [
  #     event_ts_date : "NOT NULL"
  #   ]
  #   description: "Count of visits with exactly one event (bounces)."
  # }
  # measure: entries {
  #   type: count_distinct
  #   sql: ${visit_id} ;;
  #   filters: [
  #     event_name: "page_view",
  #     event_hit_count: "1",
  #     event_ts_date : "NOT NULL"
  #   ]
  #   group_label: "Entries Metrics"
  #   description: "Count of visits where the first event is a page view."
  # }
  # measure: bounce_rate {
  #   type: number
  #   sql: SAFE_DIVIDE(${bounces}, ${entries}) ;;
  #   value_format_name: percent_2
  #   description: "Bounce rate calculated as Bounces divided by Entries, expressed as a percentage."
  # }
}

view: dynamicschema__page_properties {

  dimension: dynamicschema__page_properties {
    type: string
    sql: dynamicschema__page_properties ;;
  }
  dimension: custom_event {
    type: string
    sql: key ;;
  }
  dimension: custom_value {
    type: string
    sql: value ;;
  }

}

view: dynamicschema__user_properties {

  dimension: dynamicschema__user_properties {
    type: string

    sql: dynamicschema__user_properties ;;
  }
  dimension: key {
    type: string
    sql: key ;;
  }
  dimension: value {
    type: string
    sql: value ;;
  }
}

view: dynamicschema__event_properties {

  dimension: dynamicschema__event_properties {
    type: string

    sql: dynamicschema__event_properties ;;
  }
  dimension: key {
    type: string
    sql: key ;;
  }
  dimension: value {
    type: string
    sql: value ;;
  }
}

view: dynamicschema__consents__vendors {
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }
  dimension: is_consented {
    type: yesno
    sql: ${TABLE}.isConsented ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
  dimension: consents__vendors__name {
    type: string
    sql: ${TABLE}.consents.vendors[SAFE_OFFSET(0)].name ;;
  }
}

view: dynamicschema__consents__purposes {
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }
  dimension: is_consented {
    type: yesno
    sql: ${TABLE}.isConsented ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
}
