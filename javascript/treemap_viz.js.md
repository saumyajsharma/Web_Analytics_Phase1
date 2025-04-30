looker.plugins.visualizations.add({
  id: "custom_treemap",
  label: "Treemap",
  options: {
    colorScheme: {
      type: "string",
      label: "Color Scheme",
      default: "schemeCategory10",
      display: "select",
      values: [
        { "Category 10": "schemeCategory10" },
        { "Tableau 10": "schemeTableau10" }
      ]
    },
    fontSize: {
      type: "number",
      label: "Font Size",
      default: 12
    }
  },
  create: function(element, config) {
    // Load D3.js via CDN
    const d3Script = document.createElement("script");
    d3Script.src = "https://d3js.org/d3.v7.min.js";
    document.head.appendChild(d3Script);

    // Create SVG container
    element.innerHTML = `<svg width="100%" height="400"></svg>`;
  },
  updateAsync: function(data, element, config, queryResponse, details, done) {
    // Ensure D3 is loaded
    if (!window.d3) {
      setTimeout(() => this.updateAsync(data, element, config, queryResponse, details, done), 100);
      return;
    }

    const svg = d3.select(element).select("svg");
    svg.selectAll("*").remove(); // Clear previous content

    // Set dimensions
    const width = element.clientWidth;
    const height = 400;
    svg.attr("width", width).attr("height", height);

    // Process data for Treemap
    const rootData = {
      name: "Sessions",
      children: data.map(row => ({
        name: row[queryResponse.fields.dimensions[0].name].value, // default_channel_grouping
        value: row[queryResponse.fields.measures[0].name].value // sessions.Sessions
      })).filter(d => d.value > 0)
    };

    // Create Treemap layout
    const treemap = d3.treemap()
      .size([width, height])
      .padding(1)
      .round(true);

    // Create hierarchy
    const root = d3.hierarchy(rootData)
      .sum(d => d.value)
      .sort((a, b) => b.value - a.value);

    treemap(root);

    // Add cells
    const cell = svg.selectAll("g")
      .data(root.leaves())
      .enter()
      .append("g")
      .attr("transform", d => `translate(${d.x0},${d.y0})`);

    // Add rectangles
    cell.append("rect")
      .attr("width", d => d.x1 - d.x0)
      .attr("height", d => d.y1 - d.y0)
      .attr("fill", d => d3[config.colorScheme] ? d3[config.colorScheme][root.leaves().indexOf(d) % 10] : "#69b3a2");

    // Add text labels
    cell.append("text")
      .attr("x", 5)
      .attr("y", 15)
      .attr("font-size", config.fontSize)
      .attr("fill", "#fff")
      .text(d => d.data.name)
      .each(function(d) {
        const text = d3.select(this);
        const rectWidth = d.x1 - d.x0;
        const rectHeight = d.y1 - d.y0;
        if (text.node().getBBox().width > rectWidth - 10 || text.node().getBBox().height > rectHeight - 10) {
          text.remove(); // Remove text if it doesn't fit
        }
      });

    done();
  }
});
