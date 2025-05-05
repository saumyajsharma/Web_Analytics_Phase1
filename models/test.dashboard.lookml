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
    body_text: "<div style=\"width: 100%; background-color: #f8f9fa; border-right: 1px solid #e0e0e0; font-family: Arial, sans-serif;\">...</div>" # (Unchanged, navigation menu)
    row: 0
    col: 0
    width: 6
    height: 13
  - title: Campaign Data
    name: Campaign Data
    model: Web_Analytics_Phase1
    explore: sessions
    type: my_custom_d3_viz # Changed to D3.js visualization
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
    type: my_custom_d3_viz # Changed to D3.js visualization (e.g., Sankey diagram)
    fields: [sessions.campaign, users.Users, sessions.Sessions, sessions.New_Users, sessions.Avg_Session_Duration_min_secs]
    sorts: [users.Users desc]
    limit: 500
    row: 8
    col: 6
    width: 18
    height: 5
  - title: Goal Conversion for Each Campaign
    name: Goal Conversion for Each Campaign
    model: Web_Analytics_Phase1
    explore: sessions
    type: my_custom_d3_viz # Changed to D3.js visualization (e.g., stacked bar chart)
    fields: [sessions.campaign, sessions.purchase_flag, sessions.Users]
    pivots: [sessions.purchase_flag]
    sorts: [sessions.campaign]
    limit: 500
    row: 13
    col: 0
    width: 12
    height: 6
  - title: New vs Returning User for Campaigns
    name: New vs Returning User for Campaigns
    model: Web_Analytics_Phase1
    explore: sessions
    type: my_custom_d3_viz # Changed to D3.js visualization
    fields: [sessions.campaign, sessions.New_Users, sessions.Returning_Users]
    sorts: [sessions.campaign]
    limit: 500
    row: 13
    col: 12
    width: 12
    height: 6
  - title: Geographical Campaign Data
    name: Geographical Campaign Data
    model: Web_Analytics_Phase1
    explore: sessions
    type: my_custom_d3_viz # Changed to D3.js choropleth map
    fields: [sessions.geo__country, sessions.campaign, sessions.Users, sessions.Sessions]
    sorts: [sessions.Users desc]
    limit: 500
    row: 19
    col: 0
    width: 24
    height: 9
