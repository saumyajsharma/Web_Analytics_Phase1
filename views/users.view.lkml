# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
explore: users {
  hidden: yes
    join: users__geo {
      view_label: "Users: Geo"
      sql: LEFT JOIN UNNEST(${users.geo}) as users__geo ;;
      relationship: one_to_many
    }
    join: users__device {
      view_label: "Users: Device"
      sql: LEFT JOIN UNNEST(${users.device}) as users__device ;;
      relationship: one_to_many
    }
    join: users__user_properties {
      view_label: "Users: User Properties"
      sql: LEFT JOIN UNNEST(${users.user_properties}) as users__user_properties ;;
      relationship: one_to_many
    }
}
view: users {
  sql_table_name: `uxlwqzc-cdip-sandbox-test.web_analytics.users` ;;
  drill_fields: [user_id]

  dimension: user_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.userId ;;
  }
  dimension: average_session_duration {
    type: number
    sql: ${TABLE}.average_session_duration ;;
  }
  dimension: customer_id {
    type: string
    sql: ${TABLE}.customerId ;;
  }
  dimension: device {
    hidden: yes
    sql: ${TABLE}.device ;;
  }
  dimension: engagement_time_sec {
    type: number
    sql: ${TABLE}.engagement_time_sec ;;
  }
  dimension_group: first_visit {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.first_visit_date ;;
  }
  dimension: geo {
    hidden: yes
    sql: ${TABLE}.geo ;;
  }
  dimension_group: last_activity {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.last_activity_date ;;
  }
  dimension: new_user_flag {
    type: yesno
    sql: ${TABLE}.new_user_flag ;;
  }
  dimension: num_engaged_sessions {
    type: number
    sql: ${TABLE}.num_engaged_sessions ;;
  }
  dimension: num_sessions {
    type: number
    sql: ${TABLE}.num_sessions ;;
  }
  dimension: since_last_visit {
    type: number
    sql: ${TABLE}.since_last_visit ;;
  }
  dimension: total_transaction_value {
    type: number
    sql: ${TABLE}.total_transaction_value ;;
  }
  dimension: user_properties {
    hidden: yes
    sql: ${TABLE}.user_properties ;;
  }
  measure: count {
    type: count
    drill_fields: [user_id, dynamicschema.count, sessions.count]
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
  measure: New_Users {
    type: count
    filters: [new_user_flag: "yes"]
  }
  measure: Returning_Users {
    type: count
    filters: [new_user_flag: "no"]
  }
  measure: Avg_Engagement_Time {
    type: number
    sql: round(avg(${TABLE}.engagement_time_sec),2) ;;
  }
}

view: users__geo {

  dimension: city {
    type: string
    sql: city ;;
  }
  dimension: country {
    type: string
    map_layer_name: countries
    sql: country ;;
  }
  dimension: region {
    type: string
    sql: region ;;
  }
  dimension: users__geo {
    type: string
    hidden: yes
    sql: users__geo ;;
  }
}

view: users__device {

  dimension: browser {
    type: string
    sql: browser ;;
  }
  dimension: browserversion {
    type: string
    sql: browserversion ;;
  }
  dimension: device_type {
    type: string
    sql: deviceType ;;
  }
  dimension: os {
    type: string
    sql: os ;;
  }
  dimension: os_version {
    type: string
    sql: osVersion ;;
  }
  dimension: screen_height {
    type: number
    sql: screenHeight ;;
  }
  dimension: screen_width {
    type: number
    sql: screenWidth ;;
  }
  dimension: users__device {
    type: string
    hidden: yes
    sql: users__device ;;
  }
}

view: users__user_properties {

  dimension: key {
    type: string
    sql: key ;;
  }
  dimension: users__user_properties {
    type: string
    hidden: yes
    sql: users__user_properties ;;
  }
  dimension: value {
    type: string
    sql: value ;;
  }
}
