# looker.plugins.visualizations.add({
#   id: "custom_sankey",
#   label: "Sankey Diagram",
#   options: {
#     colorScheme: {
#       type: "string",
#       label: "Color Scheme",
#       default: "schemeCategory10",
#       display: "select",
#       values: [
#         { "Category 10": "schemeCategory10" },
#         { "Tableau 10": "schemeTableau10" }
#       ]
#     },
#     nodeWidth: {
#       type: "number",
#       label: "Node Width",
#       default: 15
#     },
#     nodePadding: {
#       type: "number",
#       label: "Node Padding",
#       default: 10
#     }
#   },
#   create: function(element, config) {
#     // Load D3.js and D3-sankey via CDN
#     const d3Script = document.createElement("script");
#     d3Script.src = "https://d3js.org/d3.v7.min.js";
#     document.head.appendChild(d3Script);

#     const sankeyScript = document.createElement("script");
#     sankeyScript.src = "https://cdn.jsdelivr.net/npm/d3-sankey@0.12.3/dist/d3-sankey.min.js";
#     document.head.appendChild(sankeyScript);

#     // Create SVG container
#     element.innerHTML = `<svg width="100%" height="400"></svg>`;
#   },
#   updateAsync: function(data, element, config, queryResponse, details, done) {
#     // Ensure D3 and D3-sankey are loaded
#     if (!window.d3 || !window.d3.sankey) {
#       setTimeout(() => this.updateAsync(data, element, config, queryResponse, details, done), 100);
#       return;
#     }

#     const svg = d3.select(element).select("svg");
#     svg.selectAll("*").remove(); // Clear previous content

#     // Set dimensions
#     const width = element.clientWidth;
#     const height = 400;
#     svg.attr("width", width).attr("height", height);

#     // Process data for Sankey
#     const nodes = [];
#     const links = [];
#     const nodeSet = new Set();

#     // Extract data from Looker query response
#     data.forEach(row => {
#       const source = row[queryResponse.fields.dimensions[0].name].value; // default_channel_grouping
#       const target = "Engaged Sessions"; // Simplified target
#       const value = row[queryResponse.fields.measures[1].name].value; // sessions.Engaged_Sessions

#       if (source && value) {
#         nodeSet.add(source);
#         nodeSet.add(target);
#         links.push({ source, target, value });
#       }
#     });

#     // Create node array
#     nodes.push(...Array.from(nodeSet).map(name => ({ name })));

#     // Initialize Sankey
#     const sankey = d3.sankey()
#       .nodeWidth(config.nodeWidth)
#       .nodePadding(config.nodePadding)
#       .extent([[1, 1], [width - 1, height - 6]]);

#     // Compute Sankey layout
#     const graph = sankey({
#       nodes: nodes.map(d => ({ ...d })),
#       links: links.map(d => ({ ...d }))
#     });

#     // Add links
#     svg.append("g")
#       .selectAll("path")
#       .data(graph.links)
#       .enter()
#       .append("path")
#       .attr("d", d3.sankeyLinkHorizontal())
#       .attr("fill", "none")
#       .attr("stroke", "#000")
#       .attr("stroke-opacity", 0.2)
#       .attr("stroke-width", d => Math.max(1, d.width));

#     // Add nodes
#     svg.append("g")
#       .selectAll("rect")
#       .data(graph.nodes)
#       .enter()
#       .append("rect")
#       .attr("x", d => d.x0)
#       .attr("y", d => d.y0)
#       .attr("height", d => d.y1 - d.y0)
#       .attr("width", d => d.x1 - d.x0)
#       .attr("fill", d => d3[config.colorScheme] ? d3[config.colorScheme][nodes.indexOf(d) % 10] : "#69b3a2");

#     // Add node labels
#     svg.append("g")
#       .selectAll("text")
#       .data(graph.nodes)
#       .enter()
#       .append("text")
#       .attr("x", d => d.x0 - 6)
#       .attr("y", d => (d.y1 + d.y0) / 2)
#       .attr("dy", "0.35em")
#       .attr("text-anchor", "end")
#       .text(d => d.name)
#       .filter(d => d.x0 < width / 2)
#       .attr("x", d => d.x1 + 6)
#       .attr("text-anchor", "start");

#     done();
#   }
# });
