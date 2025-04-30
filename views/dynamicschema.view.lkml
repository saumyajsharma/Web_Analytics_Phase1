# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view

view: dynamicschema {
  derived_table: {
    sql: SELECT * FROM `web_analytics.dynamicschema` WHERE event_ts IS NOT NULL ;;
  }

  dimension: consents__purposes {
    hidden: yes
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
    hidden: yes
    sql: ${TABLE}.consents.vendors ;;
    group_label: "Consents"
    group_item_label: "Vendors"
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
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.event_ts ;;
  }
  dimension: ga_client_id {
    type: string
    sql: ${TABLE}.gaClientId ;;
  }
  dimension: geo__city {
    type: string
    sql: ${TABLE}.geo.city ;;
    group_label: "Geo"
    group_item_label: "City"
  }
  dimension: geo__country {
    type: string
    map_layer_name: countries
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
  dimension_group: ingestion_ts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.ingestion_ts ;;
  }
  dimension: page__environment {
    type: string
    sql: ${TABLE}.page.environment ;;
    group_label: "Page"
    group_item_label: "Environment"
  }
  dimension: page__page_content_type {
    type: string
    sql: ${TABLE}.page.pageContentType ;;
    group_label: "Page"
    group_item_label: "Page Content Type"
  }
  dimension: page__page_hostname {
    type: string
    sql: ${TABLE}.page.pageHostname ;;
    group_label: "Page"
    group_item_label: "Page Hostname"
  }
  dimension: page__page_language {
    type: string
    sql: ${TABLE}.page.pageLanguage ;;
    group_label: "Page"
    group_item_label: "Page Language"
  }
  dimension: page__page_load_time {
    type: string
    sql: ${TABLE}.page.pageLoadTime ;;
    group_label: "Page"
    group_item_label: "Page Load Time"
  }
  dimension: page__page_name {
    type: string
    sql: ${TABLE}.page.pageName ;;
    group_label: "Page"
    group_item_label: "Page Name"
  }
  dimension: page__page_path {
    type: string
    sql: ${TABLE}.page.pagePath ;;
    group_label: "Page"
    group_item_label: "Page Path"
  }
  dimension: page__page_referrer {
    type: string
    sql: ${TABLE}.page.pageReferrer ;;
    group_label: "Page"
    group_item_label: "Page Referrer"
  }
  dimension: page__page_title {
    type: string
    sql: ${TABLE}.page.pageTitle ;;
    group_label: "Page"
    group_item_label: "Page Title"
  }
  dimension: page__page_url {
    type: string
    sql: ${TABLE}.page.pageUrl ;;
    group_label: "Page"
    group_item_label: "Page URL"
  }
  dimension: rd_user_id {
    type: string
    sql: ${TABLE}.rdUserId ;;
  }
  dimension: session__campaign {
    type: string
    sql: ${TABLE}.session.campaign ;;
    group_label: "Session"
    group_item_label: "Campaign"
  }
  dimension: session__content {
    type: string
    sql: ${TABLE}.session.content ;;
    group_label: "Session"
    group_item_label: "Content"
  }
  dimension: session__first_time_user {
    type: string
    sql: ${TABLE}.session.firstTimeUser ;;
    group_label: "Session"
    group_item_label: "First Time User"
  }
  dimension: session__medium {
    type: string
    sql: ${TABLE}.session.medium ;;
    group_label: "Session"
    group_item_label: "Medium"
  }
  dimension: session__source {
    type: string
    sql: ${TABLE}.session.source ;;
    group_label: "Session"
    group_item_label: "Source"
  }
  dimension_group: session__start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.session.startTime ;;
  }
  dimension: session_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.sessionId ;;
  }
  dimension: user_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.userId ;;
  }
  dimension: user_properties {
    hidden: yes
    sql: ${TABLE}.userProperties ;;
  }
  measure: count {
    type: count
    drill_fields: [event_name, page__page_name, page__page_hostname, sessions.session_id, users.user_id]
  }
  measure: Sessions {
    type: number
    sql: count(${TABLE}.sessionID);;
  }
  measure: Users {
    type: number
    sql: count(${TABLE}.userID);;
  }
  measure: Event_Count {
    type: count_distinct
    sql: ${TABLE}.eventID;;
  }
  measure: pageview_count {
    type: number
    sql: count(distinct(${TABLE}.pageUrl)) ;;
  }
  measure: Avg_Page_Load_Time {
    type: number
    sql: round(avg(cast(${TABLE}.page.pageLoadTime as decimal))/60,2) ;;
  }


}

view: dynamicschema__user_properties {

  dimension: dynamicschema__user_properties {
    type: string
    hidden: yes
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
    hidden: yes
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
  measure: Users {
    type: number
    sql: count(${TABLE}.userID) ;;
  }
  measure: LoggedIn_Users {
    type: count_distinct
    sql: ${TABLE}.customerID ;;
  }
  measure: Unique_Users {
    type: count_distinct
    sql: ${TABLE}.userID ;;
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
