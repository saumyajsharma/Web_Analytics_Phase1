# The name of this view in Looker is "Time Dim"
view: time_dim {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `web_analytics.time_dim` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Hour" in Explore.

  dimension: hour {
    type: number
    sql: ${TABLE}.hour ;;
  }

  dimension: minute {
    type: number
    sql: ${TABLE}.minute ;;
  }

  dimension: second {
    type: number
    sql: ${TABLE}.second ;;
  }

  dimension: time_id {
    type: string
    sql: ${TABLE}.timeID ;;
  }
  measure: count {
    type: count
  }
}
