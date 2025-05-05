- dashboard: web_analytics_phase1_campaign_performance
  title: Web Analytics Phase1 Campaign Performance
  layout: newspaper
  description: ''
  preferred_slug: ah9lnOj5hn8m4VYOfDT1Lm
  elements:
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div style=\"width: 100%; background-color: #f8f9fa; border-right: 1px solid #e0e0e0; font-family: Arial, sans-serif;\">...</div>" # Unchanged
    row: 0
    col: 0
    width: 6
    height: 13
  - title: Campaign Data
    name: Campaign Data
    model: Web_Analytics_Phase1
    explore: sessions
    type: my_custom_d3_viz # Use D3.js bar chart
    fields: [sessions.campaign, users.Users, sessions.Sessions, sessions.Engaged_Sessions]
    sorts: [users.Users desc]
    limit: 500
    row: 0
    col: 6
    width: 18
    height: 8
  - title: Campaign Engagement
    name: Campaign Engagement
    model: Web_Analytics_Phase1
    explore: sessions
    type: looker_grid # Reverted to original
    fields: [sessions.campaign, users.Users, sessions.Sessions, sessions.New_Users, sessions.Avg_Session_Duration_min_secs]
    sorts: [users.Users desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: d754397b-2c05-4470-bbbb-05eb4c2b15cd
      palette_id: b0768e0d-03b8-4c12-9e30-9ada6affc357
      options:
        steps: 5
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      users.Users:
        is_active: false
    row: 8
    col: 6
    width: 18
    height: 5
  - title: Goal Conversion for Each Campaign
    name: Goal Conversion for Each Campaign
    model: Web_Analytics_Phase1
    explore: sessions
    type: looker_grid # Reverted to original
    fields: [sessions.campaign, sessions.purchase_flag, sessions.Users]
    pivots: [sessions.purchase_flag]
    fill_fields: [sessions.purchase_flag]
    sorts: [sessions.purchase_flag, sessions.campaign]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: d754397b-2c05-4470-bbbb-05eb4c2b15cd
      palette_id: b0768e0d-03b8-4c12-9e30-9ada6affc357
      options:
        steps: 5
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      users.Users:
        is_active: false
    row: 13
    col: 0
    width: 12
    height: 6
  - title: New vs Returning User for Campaigns
    name: New vs Returning User for Campaigns
    model: Web_Analytics_Phase1
    explore: sessions
    type: looker_column # Reverted to original
    fields: [sessions.campaign, sessions.New_Users, sessions.Returning_Users]
    sorts: [sessions.campaign]
    limit: 500
    column_limit: 50
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
    ordering: desc
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5
      palette_id: dd87bc4e-d86f-47b1-b0fd-44110dc0b469
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    hide_legend: false
    row: 13
    col: 12
    width: 12
    height: 6
  - title: Geographical Campaign Data
    name: Geographical Campaign Data
    model: Web_Analytics_Phase1
    explore: sessions
    type: looker_google_map # Reverted to original
    fields: [sessions.geo__country, sessions.campaign, sessions.Users, sessions.Sessions]
    sorts: [sessions.Users desc]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    defaults_version: 0
    row: 19
    col: 0
    width: 24
    height: 9
