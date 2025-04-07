# The name of this view in Looker is "Events"
view: events {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `web_analytics.events` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Event Category" in Explore.

  dimension: event_category {
    type: string
    sql: ${TABLE}.event_category ;;
  }

  dimension: event_id {
    type: string
    sql: ${TABLE}.eventID ;;
  }

  dimension: event_name {
    type: string
    sql: ${TABLE}.event_name ;;
  }
  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: event_properties {
    hidden: yes
    sql: ${TABLE}.event_properties ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: event_ts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.event_ts ;;
  }

  dimension: session_id {
    type: string
    sql: ${TABLE}.sessionID ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.userID ;;
  }
  measure: count {
    type: count
    drill_fields: [event_name]
  }
}

# The name of this view in Looker is "Events Event Properties"
view: events__event_properties {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: events__event_properties {
    type: string
    hidden: yes
    sql: events__event_properties ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Key" in Explore.

  dimension: key {
    type: string
    sql: key ;;
  }

  dimension: value {
    type: string
    sql: value ;;
  }
}
