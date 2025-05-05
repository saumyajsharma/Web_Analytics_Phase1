- dashboard: web_analytics_phase1_campaign_performance
  title: Web Analytics Phase1 Campaign Performance
  layout: newspaper
  description: ''
  preferred_slug: ah9lnOj5hn8m4VYOfDT1Lm
  elements:
  - title: New vs Returning User for Campaigns
    name: New vs Returning User for Campaigns
    model: Web_Analytics_Phase1
    explore: sessions
    type: my_custom_d3_viz
    fields: [sessions.campaign, sessions.New_Users, sessions.Returning_Users]
    sorts: [sessions.campaign]
    limit: 500
    row: 13
    col: 12
    width: 12
    height: 6
