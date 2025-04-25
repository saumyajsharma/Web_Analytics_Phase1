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
