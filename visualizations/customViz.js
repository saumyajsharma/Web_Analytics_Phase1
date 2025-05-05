looker.plugins.visualizations.add({
  id: "my_custom_d3_viz",
  label: "Interactive D3.js Chart",
  options: {}, // Simplified: No options to avoid parsing issues
  create: function(element, config) {
    // Load D3.js
    if (!document.querySelector('script[src="https://d3js.org/d3.v7.min.js"]')) {
      const script = document.createElement("script");
      script.src = "https://d3js.org/d3.v7.min.js";
      script.async = false;
      script.onload = () => {
        console.log("D3.js loaded");
        element.innerHTML = '<div id="viz-container" style="width: 100%; height: 100%;"></div>';
      };
      script.onerror = () => {
        console.error("Failed to load D3.js");
        element.innerHTML = "<p>Error: Failed to load D3.js</p>";
      };
      document.head.appendChild(script);
    } else {
      element.innerHTML = '<div id="viz-container" style="width: 100%; height: 100%;"></div>';
    }
  },
  updateAsync: function(data, element, config, queryResponse, details, done) {
    // Check if D3.js is loaded
    if (!window.d3) {
      console.error("D3.js not loaded");
      element.innerHTML = "<p>Error: D3.js not loaded</p>";
      done();
      return;
    }

    // Clear previous content
    const container = d3.select(element).select("#viz-container");
    container.selectAll("*").remove();

    // Validate data and queryResponse
    if (!data || !queryResponse || !queryResponse.fields) {
      console.error("Invalid data or queryResponse");
      element.innerHTML = "<p>Error: No data available</p>";
      done();
      return;
    }

    // Extract dimensions and measures
    const dimensions = queryResponse.fields.dimensions.map(d => d.name);
    const measures = queryResponse.fields.measures.map(m => m.name);

    // Log fields for debugging
    console.log("Dimensions:", dimensions);
    console.log("Measures:", measures);

    // Check required fields
    if (!dimensions.includes("sessions.campaign") || !measures.includes("users.Users")) {
      console.error("Required fields missing: sessions.campaign, users.Users");
      element.innerHTML = "<p>Error: Required fields not found</p>";
      done();
      return;
    }

    // Process data
    const processedData = data.map(row => ({
      campaign: row["sessions.campaign"].value,
      users: row["users.Users"].value
    }));

    // Log processed data for debugging
    console.log("Processed Data:", processedData);

    // SVG setup
    const width = element.clientWidth;
    const height = element.clientHeight;
    const margin = { top: 20, right: 20, bottom: 70, left: 60 };
    const innerWidth = width - margin.left - margin.right;
    const innerHeight = height - margin.top - margin.bottom;

    const svg = container
      .append("svg")
      .attr("width", width)
      .attr("height", height)
      .append("g")
      .attr("transform", `translate(${margin.left},${margin.top})`);

    // Scales
    const x = d3.scaleBand()
      .domain(processedData.map(d => d.campaign))
      .range([0, innerWidth])
      .padding(0.1);

    const y = d3.scaleLinear()
      .domain([0, d3.max(processedData, d => d.users)])
      .nice()
      .range([innerHeight, 0]);

    // Bars
    svg.selectAll(".bar")
      .data(processedData)
      .enter()
      .append("rect")
      .attr("class", "bar")
      .attr("x", d => x(d.campaign))
      .attr("y", d => y(d.users))
      .attr("width", x.bandwidth())
      .attr("height", d => innerHeight - y(d.users))
      .attr("fill", "#1f77b4")
      .on("mouseover", function(event, d) {
        d3.select(this).attr("fill", "#ff7f0e");
        svg.append("text")
          .attr("class", "tooltip")
          .attr("x", x(d.campaign) + x.bandwidth() / 2)
          .attr("y", y(d.users) - 10)
          .attr("text-anchor", "middle")
          .text(d.users);
      })
      .on("mouseout", function() {
        d3.select(this).attr("fill", "#1f77b4");
        svg.select(".tooltip").remove();
      });

    // Axes
    svg.append("g")
      .attr("transform", `translate(0,${innerHeight})`)
      .call(d3.axisBottom(x))
      .selectAll("text")
      .attr("transform", "rotate(-45)")
      .attr("text-anchor", "end");

    svg.append("g")
      .call(d3.axisLeft(y));

    // Labels
    svg.append("text")
      .attr("x", innerWidth / 2)
      .attr("y", innerHeight + margin.bottom - 10)
      .attr("text-anchor", "middle")
      .text("Campaign");

    svg.append("text")
      .attr("x", -innerHeight / 2)
      .attr("y", -margin.left + 20)
      .attr("transform", "rotate(-90)")
      .attr("text-anchor", "middle")
      .text("Users");

    done();
  }
});
