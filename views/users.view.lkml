# The name of this view in Looker is "Users"
view: users {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `web_analytics.users` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Average Session Duration" in Explore.

  dimension: average_session_duration {
    type: number
    sql: ${TABLE}.average_session_duration ;;
  }

  dimension: customer_id {
    type: string
    sql: ${TABLE}.customerId ;;
  }

  dimension: engagement_time_sec {
    type: number
    sql: ${TABLE}.engagement_time_sec ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: first_visit {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.first_visit_date ;;
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

  dimension: user_id {
    type: string
    sql: ${TABLE}.userId ;;
  }
  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: user_properties {
    hidden: yes
    sql: ${TABLE}.user_properties ;;
  }
  measure: count {
    type: count
  }
  measure: Users {
    type: number
    sql: count(${TABLE}.userID) ;;
  }
  measure: LoggedIn_Users {
    type: number
    sql: count(${TABLE}.customerID) ;;
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

}

# The name of this view in Looker is "Users User Properties"
view: users__user_properties {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Key" in Explore.

  dimension: key {
    type: string
    sql: key ;;
  }
  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

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
