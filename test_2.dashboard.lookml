- dashboard: test_2
  title: Test 2
  layout: newspaper
  preferred_viewer: dashboards-next
  tile_size: 100

  filters:

  elements:
    - name: hello_world
      type: looker_column

    - name: fancy_logged_in_users_tile
      title: "👥 Logged-In Users"
      model: Web_Analytics_Phase1
      explore: sessions
      type: single_value
      fields: [users.LoggedIn_Users]
      limit: 500
      column_limit: 50

      # Display settings
      show_single_value_title: true
      single_value_title: "Total Logged-In Users Today"
      show_value_labels: true
      show_comparison: false
      show_comparison_label: false

      # Styling
      custom_color_enabled: true
      enable_conditional_formatting: true
      conditional_formatting_include_totals: true
      conditional_formatting_include_nulls: false
      color_application:
        collection_id: "1bc1f1d8-7461-4bfd-8c3b-424b924287b5"
        palette_id: "dd87bc4e-d86f-47b1-b0fd-44110dc0b469"
        options:
          steps: 5

      # Value formatting
      series_colors:
        users.LoggedIn_Users: "#2E86AB"
      value_format: "#,##0"  # Adds commas to large numbers

      # Hide unnecessary visual elements
      x_axis_gridlines: false
      y_axis_gridlines: false
      show_view_names: false
      show_y_axis_labels: false
      show_y_axis_ticks: false
      show_x_axis_label: false
      show_x_axis_ticks: false
      x_axis_zoom: false
      y_axis_zoom: false

      # Additional cleanup
      legend_position: none
      show_null_points: false
      interpolation: none
      label_density: 0
      y_axis_combined: true
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      defaults_version: 1
