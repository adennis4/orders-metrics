window.cancellationGraph = (stat_array) ->

  dataset = stat_array

  margin = {top: 40, bottom: 40, left: 80, right: 80}
  width = 743 - margin.right - margin.left
  height = 500 - margin.top - margin.bottom

  x = d3.scale.linear().domain([0, dataset.length]).range([0, width])
  y = d3.scale.linear().domain([d3.min(dataset), d3.max(dataset)]).range([height, 0])

  xAxis = d3.svg.axis().scale(x).ticks(4)
  yAxisRight = d3.svg.axis().scale(y).ticks(4).orient("right")

  plotLineGraph = ->
    d3.svg.line()
    .x((d, i) -> x(i))
    .y((d) -> y(d))

  createSvgElement = ->
    d3.select("#main-graph")
    .append("svg:svg")
    .attr("width", width + margin.right + margin.left)
    .attr("height", height + margin.top + margin.bottom)
    .append("svg:g")
    .attr("transform", "translate(" + margin.left + "," + margin.top + ")")

  drawXAxis = ->
    graph.append("svg:g")
      .attr("class", "x axis")
      .attr("transform", "translate(0," + height + ")")
      .call(xAxis)

  drawYAxis = ->
    graph.append("svg:g")
      .attr("class", "y axis axisRight")
      .attr("transform", "translate(" + (width+5) + ",0)")
      .call(yAxisRight)

  drawLineGraph = ->
    graph.append("svg:path").attr("d", line1(dataset)).attr("class", "metric2")

  displayLegend = ->
    d3.select("#main-graph")
      .append("p")
      .text("Cancellations")
      .attr("id", "legend-cancellations")

  displayLegend()
  graph = createSvgElement()
  line1 = plotLineGraph()   
  drawXAxis()
  drawYAxis()
  drawLineGraph()