# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

window.bookingGraph = (stat_array) ->

  dataset = stat_array || []
  dataset2 = []
  
  margin = {top: 40, bottom: 40, left: 80, right: 80}
  width = 743 - margin.right - margin.left
  height = 500 - margin.top - margin.bottom

  x = d3.scale.linear().domain([0, dataset.length]).range([0, width])
  y1 = d3.scale.linear().domain([d3.min(dataset), d3.max(dataset)]).range([height, 0])
  y2 = d3.scale.linear().domain([d3.min(dataset2), d3.max(dataset2)]).range([height, 0])

  line1 = d3.svg.line()
    .x((d, i) -> x(i))
    .y((d) -> y1(d))

  line2 = d3.svg.line()
    .x((d, i) -> x(i))
    .y((d) -> y2(d))

  graph = d3.select("#main-graph")
    .append("svg:svg")
    .attr("width", width + margin.right + margin.left)
    .attr("height", height + margin.top + margin.bottom)
    .append("svg:g")
    .attr("transform", "translate(" + margin.left + "," + margin.top + ")")

  xAxis = d3.svg.axis().scale(x)

  graph.append("svg:g")
    .attr("class", "x axis")
    .attr("transform", "translate(0," + height + ")")
    .call(xAxis)

  yAxisLeft = d3.svg.axis().scale(y1).ticks(4).orient("left")

  graph.append("svg:g")
    .attr("class", "y axis axisLeft")
    .attr("transform", "translate(-15,0)")
    .call(yAxisLeft)

  yAxisRight = d3.svg.axis().scale(y2).ticks(4).orient("right")

  graph.append("svg:g")
    .attr("class", "y axis axisRight")
    .attr("transform", "translate(" + (width+15) + ",0)")
    .call(yAxisRight)

  graph.append("svg:path").attr("d", line1(dataset)).attr("class", "metric1")
  graph.append("svg:path").attr("d", line2(dataset2)).attr("class", "metric2")