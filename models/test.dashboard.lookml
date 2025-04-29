- dashboard: test
  title: "🚀 Test Dashboard"
  layout: newspaper
  preferred_viewer: dashboards-next
  tile_size: 100

  elements:
    - name: fancy_logged_in_users_tile
      title: "👥 Logged-In Users"
      model: Web_Analytics_Phase1
      explore: sessions
      type: single_value
      fields: [users.LoggedIn_Users]

    - name: add_a_unique_name_1745817817
      title: Untitled Visualization
      model: Web_Analytics_Phase1
      explore: sessions
      type: looker_line
      fields: [sessions.Active_Users, users.LoggedIn_Users, sessions.session_week, new_users]
      fill_fields: [sessions.session_week]
      sorts: [sessions.session_week desc]
      limit: 500
      column_limit: 50
      dynamic_fields:
      - category: measure
        expression: "${users.new_user_flag} = yes"
        label: New users
        value_format:
        value_format_name:
        based_on: users.Unique_Users
        filter_expression: "${users.new_user_flag} = yes"
        _kind_hint: measure
        measure: new_users
        type: count_distinct
        _type_hint: number
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      y_axis_scale_mode: linear
      x_axis_reversed: false
      y_axis_reversed: false
      plot_size_by_field: false
      trellis: ''
      stacking: ''
      limit_displayed_rows: false
      legend_position: center
      point_style: none
      show_value_labels: true
      label_density: 25
      x_axis_scale: auto
      y_axis_combined: true
      show_null_points: true
      interpolation: linear
      color_application:
        collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5
        palette_id: dd87bc4e-d86f-47b1-b0fd-44110dc0b469
        options:
          steps: 5
      x_axis_zoom: true
      y_axis_zoom: true
      series_colors: {}
      hidden_pivots: {}
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      defaults_version: 1
