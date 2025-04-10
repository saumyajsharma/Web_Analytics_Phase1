# The name of this view in Looker is "Device"
view: device {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `web_analytics.device` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Browserversion" in Explore.

  dimension: browserversion {
    type: string
    sql: ${TABLE}.browserversion ;;
  }

  dimension: device_id {
    type: string
    sql: ${TABLE}.deviceID ;;
  }

  dimension: device_type {
    type: string
    sql: ${TABLE}.deviceType ;;
  }

  dimension: os {
    type: string
    sql: ${TABLE}.os ;;
  }

  dimension: os_version {
    type: string
    sql: ${TABLE}.osVersion ;;
  }

  dimension: screen_height {
    type: number
    sql: ${TABLE}.screenHeight ;;
  }

  dimension: screen_width {
    type: number
    sql: ${TABLE}.screenWidth ;;
  }
  dimension: screen_resolution {
    type: number
    sql: CONCAT(${TABLE}.screenHeight,'*', ${TABLE}.screenWidth) ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.userID ;;
  }
  dimension: browser {
    type: string
    sql: ${TABLE}.browser ;;
  }
  measure: count {
    type: count
  }
}
