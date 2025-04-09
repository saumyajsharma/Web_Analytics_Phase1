# The name of this view in Looker is "Sessions"
view: sessions {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `web_analytics.sessions` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: begin_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.begin_timestamp ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Campaign" in Explore.

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

  dimension_group: end_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.end_timestamp ;;
  }

  dimension: engaged_session_flag {
    type: number
    sql: ${TABLE}.engaged_session_flag ;;
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

  dimension: session_id {
    type: string
    sql: ${TABLE}.sessionID ;;
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
    sql: ${TABLE}.userId ;;
  }
  measure: count {
    type: count
  }
  measure: Sessions {
    type: number
    sql: count(${TABLE}.sessionID);;
  }
  measure: Unique_Sessions {
    type: count_distinct
    sql: ${TABLE}.sessionID;;
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
