mainMargin =
  top: 30
  right: 10
  bottom: 80
  left: 80

brushMargin =
  top: 450
  right: 10
  bottom: 0
  left: 80

graphWidth = 960 - mainMargin.left - mainMargin.right
mainHeight = 500 - mainMargin.top - mainMargin.bottom
brushHeight = 500 - brushMargin.top - brushMargin.bottom

formatDate = d3.time.format("%d %b %Y")

x = d3.time.scale().range([0, graphWidth])
x2 = d3.time.scale().range([0, graphWidth])

y = d3.scale.linear().range([mainHeight, 0])
y2 = d3.scale.linear().range([brushHeight, 0])

xAxisMain = d3.svg.axis().scale(x).orient("bottom")
xAxisBrush = d3.svg.axis().scale(x2).orient("bottom")
yAxis = d3.svg.axis().scale(y).orient("left")

brush = d3.svg.brush().x(x2).on("brush", brush)

area = d3.svg.area()
  .x((d) -> x d.date)
  .y0(mainHeight)
  .y1((d) -> y d.count)

area2 = d3.svg.area()
  .x((d) -> x2 d.date)
  .y0(brushHeight)
  .y1((d) -> y2 d.count)

svg = d3.select("#main-graph")
  .append("svg")
  .attr("width", graphWidth + mainMargin.left + mainMargin.right)
  .attr("height", mainHeight + mainMargin.top + mainMargin.bottom)

svg.append("defs")
   .append("clipPath")
   .attr("id", "clip")
   .append("rect")
   .attr("width", graphWidth)
   .attr("height", mainHeight)

graphMain = svg.append("g")
  .attr("transform", "translate(" + mainMargin.left + "," + mainMargin.top + ")")

graphBrush = svg.append("g")
  .attr("transform", "translate(" + brushMargin.left + "," + brushMargin.top + ")")

d3.csv "../cancellations.csv", (data) ->
  data.forEach (d) ->
    d.date = formatDate.parse(d.date)
    d.count = d.count

  setDomain(data)
  drawMainGraph(data)
  drawBrushGraph(data)

setDomain = (data) ->
  x.domain d3.extent(data.map((d) -> d.date))
  y.domain [0, d3.max(data.map((d) -> d.count))]
  x2.domain x.domain()
  y2.domain y.domain()

drawMainGraph = (data) ->
  graphMain.append("path")
    .data([data])
    .attr("class", "cancellations")
    .attr("clip-path", "url(#clip)")
    .attr "d", area

  graphMain.append("g")
    .attr("class", "x axis")
    .attr("transform", "translate(0," + mainHeight + ")")
    .call xAxisMain
  
  graphMain.append("g")
    .attr("class", "y axis")
    .call yAxis

drawBrushGraph = (data) ->
  graphBrush.append("path")
    .data([data])
    .attr("class", "cancellations")
    .attr "d", area2
  
  graphBrush.append("g")
    .attr("class", "x axis")
      .attr("transform", "translate(0," + brushHeight + ")")
      .call xAxisBrush
  
  graphBrush.append("g")
    .attr("class", "x brush")
    .call(brush)
    .selectAll("rect")
    .attr("y", -6)
    .attr "height", brushHeight + 7

`function brush() {
  x.domain(brush.empty() ? x2.domain() : brush.extent());
  graphMain.select("path").attr("d", area);
  graphMain.select(".x.axis").call(xAxisMain);
}
`
