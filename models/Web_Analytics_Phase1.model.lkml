# Define the database connection to be used for this model.
connection: "cdip_sandbox_test"

# include all the views

include: "/views/**/*.view.lkml"
include: "/models/test.dashboard.lookml"


# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: Web_Analytics_Phase1_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: Web_Analytics_Phase1_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Web Analytics Phase1"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

explore: dynamicschema {
  join: dynamicschema__user_properties {
    view_label: "Dynamicschema: Userproperties"
    sql: LEFT JOIN UNNEST(${dynamicschema.user_properties}) as dynamicschema__user_properties ;;
    relationship: one_to_many
  }
  join: dynamicschema__event_properties {
    view_label: "Dynamicschema: Eventproperties"
    sql: LEFT JOIN UNNEST(${dynamicschema.event_properties}) as dynamicschema__event_properties ;;
    relationship: one_to_many
  }
  join: dynamicschema__consents__vendors {
    view_label: "Dynamicschema: Consents Vendors"
    sql: LEFT JOIN UNNEST(${dynamicschema.consents__vendors}) as dynamicschema__consents__vendors ;;
    relationship: one_to_many
  }
  join: dynamicschema__consents__purposes {
    view_label: "Dynamicschema: Consents Purposes"
    sql: LEFT JOIN UNNEST(${dynamicschema.consents__purposes}) as dynamicschema__consents__purposes ;;
    relationship: one_to_many
  }

  join: users {
    type: left_outer
    sql_on: ${dynamicschema.user_id} = ${users.user_id} ;;
    relationship: many_to_one
  }
}
explore: rtdynamicschema {}

explore: device {}

explore: geo {}

explore: time_dim {}

explore: events {
    join: events__event_properties {
      view_label: "Events: Event Properties"
      sql: LEFT JOIN UNNEST(${events.event_properties}) as events__event_properties ;;
      relationship: one_to_many
    }
}


explore: pages {}

explore: users {
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

explore: sessions {
  join: users {
    type: left_outer
    sql_on: ${sessions.user_id} = ${users.user_id} ;;
    relationship: many_to_one
    }

  # Join page on sessionID
  join: pages {
    type: left_outer
    sql_on: ${sessions.session_id} = ${pages.session_id} ;;
    relationship: one_to_many
  }

  # Join events on sessionID
  join: events {
    type: left_outer
    sql_on: ${sessions.session_id} = ${events.session_id} ;;
    relationship: one_to_many
  }

  # Join date dimension on session_date
  join: date_dim {
    type: left_outer
    sql_on: ${sessions.session_date} = ${date_dim.date_id} ;;
    relationship: many_to_one
  }

  # Join time dimension on begin_timestamp
  join: time_dim {
    type: left_outer
    sql_on: ${sessions.begin_timestamp_time} = ${time_dim.time_id} ;;
    relationship: many_to_one
  }

  join: firstsession {
    type: left_outer
    sql_on: ${sessions.user_id} = ${firstsession.user_id} ;;
    relationship: many_to_one
  }

}

explore: date_dim {}



explore: firstsession {}
