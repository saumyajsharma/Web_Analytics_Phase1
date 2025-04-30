- dashboard: web_analytics_phase1_traffic_acquisition
  title: Web_Analytics_phase1_traffic_acquisition
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: msl0CMCb2tBuwa253fwN0P
  elements:
  - title: 'Session acquisition: Primary channel group'
    name: 'Session acquisition: Primary channel group'
    model: Web_Analytics_Phase1
    explore: sessions
    type: looker_grid
    fields: [default_channel_grouping, sessions.Sessions, sessions.Engaged_Sessions,
      avg_engagement_time_per_session_in_sec, sessions.Sessions_Per_User]
    sorts: [sessions.Sessions desc 0]
    limit: 8
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
    - category: dimension
      expression: "${sessions.medium}"
      label: Default channel grouping
      value_format:
      value_format_name:
      dimension: default_channel_grouping
      _kind_hint: dimension
      _type_hint: string
    - category: table_calculation
      expression: "${sessions.Engaged_Sessions}/${sessions.Sessions}"
      label: Engagement rate
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: engagement_rate
      _type_hint: number
    - category: measure
      expression: "${sessions.engaged_session_flag} = 1"
      label: Avg engagement time per session (in sec)
      value_format: '0'
      value_format_name: __custom
      based_on: sessions.session_duration
      filter_expression: "${sessions.engaged_session_flag} = 1"
      _kind_hint: measure
      measure: avg_engagement_time_per_session_in_sec
      type: average
      _type_hint: number
    - category: measure
      label: Event count
      based_on: events.count
      _kind_hint: measure
      measure: event_count
      type: count_distinct
      _type_hint: number
    - category: measure
      label: Filtered sessions.Sessions_Per_User
      value_format: 0.##
      value_format_name: __custom
      based_on: sessions.Sessions_Per_User
      _kind_hint: measure
      measure: filtered_sessionssessions_per_user
      type: count_distinct
      _type_hint: number
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5
      palette_id: dd87bc4e-d86f-47b1-b0fd-44110dc0b469
      options:
        steps: 5
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels: {}
    series_cell_visualizations:
      sessions.Sessions:
        is_active: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    header_font_color: "#1E0030"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5,
          palette_id: 46a4b248-19f7-4e71-9cf0-59fcc2c3039e, options: {steps: 5}},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    arm_length: 25
    arm_weight: 50
    spinner_length: 100
    spinner_weight: 50
    angle: 90
    cutout: 50
    range_x: 1
    range_y: 1
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: normal
    hide_legend: false
    legend_position: center
    point_style: none
    series_colors: {}
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    hidden_pivots: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: []
    hidden_points_if_no: []
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    truncate_column_names: false
    listen:
      Location: sessions.location
      Begin Timestamp Date: sessions.begin_timestamp_date
    row: 14
    col: 0
    width: 24
    height: 5
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div style=\"width: 100%; background-color: #f8f9fa; border-right:\
      \ 1px solid #e0e0e0; font-family: Arial, sans-serif;\">\n  <h3 style=\"font-size:\
      \ 14px; color: #333; margin: 0 0 6px 12px; font-weight: 600;\">Analytics</h3>\n\
      \  <div style=\"display: flex; flex-direction: column; gap: 10px;\">\n    <!--\
      \ Home -->\n    <a href=\"https://accenture360.cloud.looker.com/dashboards/339?region={{\
      \ _filters['region'] | url_encode }}\" \n       style=\"padding: 6px 12px; text-decoration:\
      \ none; color: #333; font-size: 14px; border-radius: 4px; display: block; transition:\
      \ background-color 0.3s;\">\n      Home\n    </a>\n    <!-- Acquisition with\
      \ Submenu -->\n    <div style=\"margin: 0;\">\n      <a href=\"https://accenture360.cloud.looker.com/dashboards/349?region={{\
      \ _filters['region'] | url_encode }}\" \n         style=\"padding: 6px 12px;\
      \ text-decoration: none; color: #333; font-size: 14px; border-radius: 4px; display:\
      \ block; transition: background-color 0.3s;\">\n        Acquisition\n      </a>\n\
      \      <div style=\"padding-left: 20px; margin-top: 4px; display: flex; flex-direction:\
      \ column; gap: 4px;\">\n        <a href=\"https://accenture360.cloud.looker.com/dashboards/349?region={{\
      \ _filters['region'] | url_encode }}\" \n           style=\"padding: 6px 12px;\
      \ text-decoration: none; color: #666; font-size: 14px; display: block; border-radius:\
      \ 4px; transition: background-color 0.3s;\">\n          Overview\n        </a>\n\
      \        <a href=\"https://accenture360.cloud.looker.com/dashboards/351?region={{\
      \ _filters['region'] | url_encode }}\" \n           style=\"padding: 6px 12px;\
      \ text-decoration: none; color: #666; font-size: 14px; display: block; border-radius:\
      \ 4px; transition: background-color 0.3s;\">\n          User Acquisition\n \
      \       </a>\n        <a href=\"https://accenture360.cloud.looker.com/dashboards/350?region={{\
      \ _filters['region'] | url_encode }}\" \n           style=\"padding: 6px 12px;\
      \ text-decoration: none; color: #666; font-size: 14px; display: block; border-radius:\
      \ 4px; transition: background-color 0.3s;\">\n          Traffic Acquisition\n\
      \        </a>\n      </div>\n    </div>\n    <!-- Engagement with Submenu -->\n\
      \    <div style=\"margin: 0;\">\n      <a href=\"https://accenture360.cloud.looker.com/dashboards/340?region={{\
      \ _filters['region'] | url_encode }}\" \n         style=\"padding: 6px 12px;\
      \ text-decoration: none; color: #333; font-size: 14px; border-radius: 4px; display:\
      \ block; transition: background-color 0.3s;\">\n        Engagement\n      </a>\n\
      \      <div style=\"padding-left: 20px; margin-top: 4px; display: flex; flex-direction:\
      \ column; gap: 4px;\">\n        <a href=\"https://accenture360.cloud.looker.com/dashboards/340?region={{\
      \ _filters['region'] | url_encode }}\" \n           style=\"padding: 6px 12px;\
      \ text-decoration: none; color: #666; font-size: 14px; display: block; border-radius:\
      \ 4px; transition: background-color 0.3s;\">\n          Overview\n        </a>\n\
      \        <a href=\"https://accenture360.cloud.looker.com/dashboards/341?region={{\
      \ _filters['region'] | url_encode }}\" \n           style=\"padding: 6px 12px;\
      \ text-decoration: none; color: #666; font-size: 14px; display: block; border-radius:\
      \ 4px; transition: background-color 0.3s;\">\n          Pages\n        </a>\n\
      \t\t <a href=\"https://accenture360.cloud.looker.com/dashboards/352?region={{\
      \ _filters['region'] | url_encode }}\" \n           style=\"padding: 6px 12px;\
      \ text-decoration: none; color: #666; font-size: 14px; display: block; border-radius:\
      \ 4px; transition: background-color 0.3s;\">\n          Events\n        </a>\n\
      \      </div>\n    </div>\n    <!-- Demographics with Submenu -->\n    <div\
      \ style=\"margin: 0;\">\n      <a href=\"https://accenture360.cloud.looker.com/dashboards/325?region={{\
      \ _filters['region'] | url_encode }}\" \n         style=\"padding: 6px 12px;\
      \ text-decoration: none; color: #333; font-size: 14px; border-radius: 4px; display:\
      \ block; transition: background-color 0.3s;\">\n        Demographics\n     \
      \ </a>\n      <div style=\"padding-left: 20px; margin-top: 4px; display: flex;\
      \ flex-direction: column; gap: 4px;\">\n        <a href=\"https://accenture360.cloud.looker.com/dashboards/333?region={{\
      \ _filters['region'] | url_encode }}\" \n           style=\"padding: 6px 12px;\
      \ text-decoration: none; color: #666; font-size: 14px; display: block; border-radius:\
      \ 4px; transition: background-color 0.3s;\">\n          User Geography\n   \
      \     </a>\n        <a href=\"https://accenture360.cloud.looker.com/dashboards/334?region={{\
      \ _filters['region'] | url_encode }}\" \n           style=\"padding: 6px 12px;\
      \ text-decoration: none; color: #666; font-size: 14px; display: block; border-radius:\
      \ 4px; transition: background-color 0.3s;\">\n          User Interests\n   \
      \     </a>\n      </div>\n    </div>\n    <!-- Real-time with Submenu -->\n\
      \    <div style=\"margin: 0;\">\n      <a href=\"https://accenture360.cloud.looker.com/dashboards/325?region={{\
      \ _filters['region'] | url_encode }}\" \n         style=\"padding: 6px 12px;\
      \ text-decoration: none; color: #333; font-size: 14px; border-radius: 4px; display:\
      \ block; transition: background-color 0.3s;\">\n        Real-time\n      </a>\n\
      \      <div style=\"padding-left: 20px; margin-top: 4px; display: flex; flex-direction:\
      \ column; gap: 4px;\">\n        <a href=\"https://accenture360.cloud.looker.com/dashboards/333?region={{\
      \ _filters['region'] | url_encode }}\" \n           style=\"padding: 6px 12px;\
      \ text-decoration: none; color: #666; font-size: 14px; display: block; border-radius:\
      \ 4px; transition: background-color 0.3s;\">\n          Active Users\n     \
      \   </a>\n        <a href=\"https://accenture360.cloud.looker.com/dashboards/334?region={{\
      \ _filters['region'] | url_encode }}\" \n           style=\"padding: 6px 12px;\
      \ text-decoration: none; color: #666; font-size: 14px; display: block; border-radius:\
      \ 4px; transition: background-color 0.3s;\">\n          Live Traffic\n     \
      \   </a>\n      </div>\n    </div>\n    <!-- Technology with Submenu -->\n \
      \   <div style=\"margin: 0;\">\n      <a href=\"https://accenture360.cloud.looker.com/dashboards/342?region={{\
      \ _filters['region'] | url_encode }}\" \n         style=\"padding: 6px 12px;\
      \ text-decoration: none; color: #333; font-size: 14px; border-radius: 4px; display:\
      \ block; transition: background-color 0.3s;\">\n        Technology\n      </a>\n\
      \      <div style=\"padding-left: 20px; margin-top: 4px; display: flex; flex-direction:\
      \ column; gap: 4px;\">\n        <a href=\"https://accenture360.cloud.looker.com/dashboards/342?region={{\
      \ _filters['region'] | url_encode }}\" \n           style=\"padding: 6px 12px;\
      \ text-decoration: none; color: #666; font-size: 14px; display: block; border-radius:\
      \ 4px; transition: background-color 0.3s;\">\n          Device Overview\n  \
      \      </a>\n        <a href=\"https://accenture360.cloud.looker.com/dashboards/343?region={{\
      \ _filters['region'] | url_encode }}\" \n           style=\"padding: 6px 12px;\
      \ text-decoration: none; color: #666; font-size: 14px; display: block; border-radius:\
      \ 4px; transition: background-color 0.3s;\">\n          Browser & OS\n     \
      \   </a>\n      </div>\n    </div>\n    <!-- Campaigns with Submenu -->\n  \
      \  <div style=\"margin: 0;\">\n      <a href=\"https://accenture360.cloud.looker.com/dashboards/346?region={{\
      \ _filters['region'] | url_encode }}\" \n         style=\"padding: 6px 12px;\
      \ text-decoration: none; color: #333; font-size: 14px; border-radius: 4px; display:\
      \ block; transition: background-color 0.3s;\">\n        Campaigns\n      </a>\n\
      \      <div style=\"padding-left: 20px; margin-top: 4px; display: flex; flex-direction:\
      \ column; gap: 4px;\">\n        <a href=\"https://accenture360.cloud.looker.com/dashboards/346?region={{\
      \ _filters['region'] | url_encode }}\" \n           style=\"padding: 6px 12px;\
      \ text-decoration: none; color: #666; font-size: 14px; display: block; border-radius:\
      \ 4px; transition: background-color 0.3s;\">\n          Campaign Performance\n\
      \        </a>\n      </div>\n    </div>\n  </div>\n</div>\n\n<style>\n  a:hover\
      \ {\n    background-color: #e9ecef;\n  }\n</style>"
    row: 1
    col: 0
    width: 6
    height: 13
  - title: 'Session acquisition: Primary channel group'
    name: 'Session acquisition: Primary channel group (2)'
    model: Web_Analytics_Phase1
    explore: sessions
    type: looker_line
    fields: [sessions.begin_timestamp_week, default_channel_grouping, sessions.Sessions]
    pivots: [default_channel_grouping]
    fill_fields: [sessions.begin_timestamp_week]
    sorts: [default_channel_grouping desc, sessions.Sessions desc 0]
    limit: 50
    column_limit: 5
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
    - category: dimension
      expression: "${sessions.medium}"
      label: Default channel grouping
      value_format:
      value_format_name:
      dimension: default_channel_grouping
      _kind_hint: dimension
      _type_hint: string
    - category: measure
      expression: "${sessions.engaged_session_flag} = 1"
      label: Avg engagement time per session (in sec)
      value_format: '0'
      value_format_name: __custom
      based_on: sessions.session_duration
      filter_expression: "${sessions.engaged_session_flag} = 1"
      _kind_hint: measure
      measure: avg_engagement_time_per_session_in_sec
      type: average
      _type_hint: number
    - category: measure
      label: Event count
      based_on: events.count
      _kind_hint: measure
      measure: event_count
      type: count_distinct
      _type_hint: number
    - category: measure
      label: Filtered sessions.Sessions_Per_User
      value_format: 0.##
      value_format_name: __custom
      based_on: sessions.Sessions_Per_User
      _kind_hint: measure
      measure: filtered_sessionssessions_per_user
      type: count_distinct
      _type_hint: number
    - category: table_calculation
      expression: "${sessions.Engaged_Sessions}/${sessions.Sessions}"
      label: Engagement rate
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: engagement_rate
      _type_hint: number
      is_disabled: true
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: legacy
      palette_id: looker_classic
      options:
        steps: 5
        reverse: false
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    hide_legend: false
    series_colors: {}
    series_labels: {}
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    truncate_header: false
    size_to_fit: true
    minimum_column_width: 75
    series_cell_visualizations:
      sessions.Sessions:
        is_active: true
    table_theme: editable
    enable_conditional_formatting: true
    header_font_color: "#1E0030"
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5,
          palette_id: 46a4b248-19f7-4e71-9cf0-59fcc2c3039e, options: {steps: 5}},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hide_totals: false
    hide_row_totals: false
    arm_length: 25
    arm_weight: 50
    spinner_length: 100
    spinner_weight: 50
    angle: 90
    cutout: 50
    range_x: 1
    range_y: 1
    hidden_pivots: {}
    ordering: none
    show_null_labels: false
    defaults_version: 1
    hidden_fields: []
    hidden_points_if_no: []
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    truncate_column_names: false
    listen:
      Location: sessions.location
      Begin Timestamp Date: sessions.begin_timestamp_date
    row: 1
    col: 6
    width: 18
    height: 13
  - name: "\U0001f4c8 Traffic Acquisition report \U0001f4c8"
    type: text
    title_text: "\U0001f4c8 Traffic Acquisition report \U0001f4c8"
    subtitle_text: ''
    body_text: ''
    row: 0
    col: 0
    width: 24
    height: 1
  - title: Traffic Acquisition by Geography
    name: Traffic Acquisition by Geography
    model: Web_Analytics_Phase1
    explore: geo
    type: looker_google_map
    fields: [geo.country, geo.count]
    sorts: [geo.count desc 0]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    map_plot_mode: points
    heatmap_gridlines: true
    heatmap_gridlines_empty: false
    heatmap_opacity: 1
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: streets
    map_position: fit_data
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    defaults_version: 0
    map: auto
    map_projection: ''
    quantize_colors: false
    show_value_labels: true
    font_size: 12
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    listen: {}
    row: 19
    col: 0
    width: 24
    height: 8
  - title: 'Session Flow: Sankey Diagram'
    name: 'Session Flow: Sankey Diagram'
    model: Web_Analytics_Phase1
    explore: sessions
    type: custom_sankey
    fields: [default_channel_grouping, sessions.Sessions, sessions.Engaged_Sessions]
    sorts: [sessions.Sessions desc 0]
    limit: 50
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
    - category: dimension
      expression: "${sessions.medium}"
      label: Default channel grouping
      value_format:
      value_format_name:
      dimension: default_channel_grouping
      _kind_hint: dimension
      _type_hint: string
    - category: measure
      expression: "${sessions.engaged_session_flag} = 1"
      label: Avg engagement time per session (in sec)
      value_format: '0'
      value_format_name: __custom
      based_on: sessions.session_duration
      filter_expression: "${sessions.engaged_session_flag} = 1"
      _kind_hint: measure
      measure: avg_engagement_time_per_session_in_sec
      type: average
      _type_hint: number
    - category: measure
      label: Event count
      based_on: events.count
      _kind_hint: measure
      measure: event_count
      type: count_distinct
      _type_hint: number
    - category: measure
      label: Filtered sessions.Sessions_Per_User
      value_format: 0.##
      value_format_name: __custom
      based_on: sessions.Sessions_Per_User
      _kind_hint: measure
      measure: filtered_sessionssessions_per_user
      type: count_distinct
      _type_hint: number
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: legacy
      palette_id: looker_classic
      options:
        steps: 5
        reverse: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels: {}
    series_cell_visualizations:
      sessions.Sessions:
        is_active: true
    header_font_color: "#1E0030"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5,
          palette_id: 46a4b248-19f7-4e71-9cf0-59fcc2c3039e, options: {steps: 5}},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: []
    hidden_points_if_no: []
    listen:
      Location: sessions.location
      Begin Timestamp Date: sessions.begin_timestamp_date
    row: 27
    col: 0
    width: 12
    height: 8
  - title: 'Session Distribution: Treemap'
    name: 'Session Distribution: Treemap'
    model: Web_Analytics_Phase1
    explore: sessions
    type: custom_treemap
    fields: [default_channel_grouping, sessions.Sessions]
    sorts: [sessions.Sessions desc 0]
    limit: 50
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
    - category: dimension
      expression: "${sessions.medium}"
      label: Default channel grouping
      value_format:
      value_format_name:
      dimension: default_channel_grouping
      _kind_hint: dimension
      _type_hint: string
    - category: measure
      expression: "${sessions.engaged_session_flag} = 1"
      label: Avg engagement time per session (in sec)
      value_format: '0'
      value_format_name: __custom
      based_on: sessions.session_duration
      filter_expression: "${sessions.engaged_session_flag} = 1"
      _kind_hint: measure
      measure: avg_engagement_time_per_session_in_sec
      type: average
      _type_hint: number
    - category: measure
      label: Event count
      based_on: events.count
      _kind_hint: measure
      measure: event_count
      type: count_distinct
      _type_hint: number
    - category: measure
      label: Filtered sessions.Sessions_Per_User
      value_format: 0.##
      value_format_name: __custom
      based_on: sessions.Sessions_Per_User
      _kind_hint: measure
      measure: filtered_sessionssessions_per_user
      type: count_distinct
      _type_hint: number
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: legacy
      palette_id: looker_classic
      options:
        steps: 5
        reverse: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels: {}
    series_cell_visualizations:
      sessions.Sessions:
        is_active: true
    header_font_color: "#1E0030"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5,
          palette_id: 46a4b248-19f7-4e71-9cf0-59fcc2c3039e, options: {steps: 5}},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: []
    hidden_points_if_no: []
    listen:
      Location: sessions.location
      Begin Timestamp Date: sessions.begin_timestamp_date
    row: 27
    col: 12
    width: 12
    height: 8
  filters:
  - name: Location
    title: Location
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: Web_Analytics_Phase1
    explore: sessions
    listens_to_filters: []
    field: sessions.location
  - name: Begin Timestamp Date
    title: Begin Timestamp Date
    type: field_filter
    default_value: this year to second
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: Web_Analytics_Phase1
    explore: sessions
    listens_to_filters: []
    field: sessions.begin_timestamp_date
