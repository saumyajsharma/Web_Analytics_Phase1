# The name of this view in Looker is "Date Dim"
view: date_dim {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `web_analytics.date_dim` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Date ID" in Explore.

  dimension: date_id {
    type: string
    sql: ${TABLE}.dateID ;;
  }

  dimension: day {
    type: number
    sql: ${TABLE}.day ;;
  }

  dimension: month {
    type: number
    sql: ${TABLE}.month ;;
  }

  dimension: quarter {
    type: number
    sql: ${TABLE}.quarter ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.YEAR ;;
  }
  measure: count {
    type: count
  }
}
