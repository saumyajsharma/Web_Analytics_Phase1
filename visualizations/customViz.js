looker.plugins.visualizations.add({
  id: "my_custom_d3_viz",
  label: "Interactive D3.js Chart",
  options: {},
  create: function(element, config) {
    // Load D3.js from CDN
    const script = document.createElement("script");
    script.src = "https://d3js.org/d3.v7.min.js";
    script.onload = () => {
      element.innerHTML = `<div id="viz-container" style="width: 100%; height: 400px;"></div>`;
    };
    document.head.appendChild(script);
  },
  updateAsync: function(data, element, config, queryResponse, details, done) {
    // Ensure D3.js is loaded
    if (!window.d3) {
      console.error("D3.js not loaded");
      done();
      return;
    }

    // Example: Simple D3.js bar chart
    const container = d3.select(element).select("#viz-container");
    container.selectAll("*").remove(); // Clear previous content

    // Sample data (replace with queryResponse data)
    const sampleData = data.map(row => ({
      label: row[queryResponse.fields.dimensions[0].name].value,
      value: row[queryResponse.fields.measures[0].name].value
    }));

    // Set up SVG
    const width = element.clientWidth;
    const height = 400;
    const svg = container
      .append("svg")
      .attr("width", width)
      .attr("height", height);

    // Simple bar chart
    const barWidth = width / sampleData.length;
    svg
      .selectAll("rect")
      .data(sampleData)
      .enter()
      .append("rect")
      .attr("x", (d, i) => i * barWidth)
      .attr("y", d => height - d.value)
      .attr("width", barWidth - 5)
      .attr("height", d => d.value)
      .attr("fill", "steelblue");

    done();
  }
});
