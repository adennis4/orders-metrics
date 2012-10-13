margin =
  top: 10
  right: 10
  bottom: 100
  left: 80

margin2 =
  top: 430
  right: 10
  bottom: 20
  left: 80

width = 960 - margin.left - margin.right
height = 500 - margin.top - margin.bottom
height2 = 500 - margin2.top - margin2.bottom

formatDate = d3.time.format("%d %b %Y")

x = d3.time.scale().range([0, width])
x2 = d3.time.scale().range([0, width])

y = d3.scale.linear().range([height, 0])
y2 = d3.scale.linear().range([height2, 0])

xAxis = d3.svg.axis().scale(x).orient("bottom")
xAxis2 = d3.svg.axis().scale(x2).orient("bottom")
yAxis = d3.svg.axis().scale(y).orient("left")

brush = d3.svg.brush().x(x2).on("brush", brush)

area = d3.svg.area().interpolate("monotone")
  .x((d) -> x d.date)
  .y0(height)
  .y1((d) -> y d.count)

area2 = d3.svg.area().interpolate("monotone")
  .x((d) -> x2 d.date)
  .y0(height2)
  .y1((d) -> y2 d.count)

svg = d3.select("#main-graph")
  .append("svg")
  .attr("width", width + margin.left + margin.right)
  .attr("height", height + margin.top + margin.bottom)

svg.append("defs")
   .append("clipPath")
   .attr("id", "clip")
   .append("rect")
   .attr("width", width)
   .attr("height", height)

focus = svg.append("g")
  .attr("transform", "translate(" + margin.left + "," + margin.top + ")")

context = svg.append("g")
  .attr("transform", "translate(" + margin2.left + "," + margin2.top + ")")

d3.csv "../bookings.csv", (data) ->
  data.forEach (d) ->
    d.date = formatDate.parse(d.date)
    d.count = d.count

  x.domain d3.extent(data.map((d) -> d.date))
  y.domain [0, d3.max(data.map((d) -> d.count))]
  x2.domain x.domain()
  y2.domain y.domain()

  focus.append("path")
    .data([data])
    .attr("class", "bookings")
    .attr("clip-path", "url(#clip)")
    .attr "d", area

  focus.append("g")
    .attr("class", "x axis")
    .attr("transform", "translate(0," + height + ")")
    .call xAxis
  
  focus.append("g")
    .attr("class", "y axis")
    .call yAxis
  
  context.append("path")
    .data([data])
    .attr("class", "bookings")
    .attr "d", area2
  
  context.append("g")
    .attr("class", "x axis")
      .attr("transform", "translate(0," + height2 + ")")
      .call xAxis2
  
  context.append("g")
    .attr("class", "x brush")
    .call(brush)
    .selectAll("rect")
    .attr("y", -6)
    .attr "height", height2 + 7

`function brush() {
  x.domain(brush.empty() ? x2.domain() : brush.extent());
  focus.select("path").attr("d", area);
  focus.select(".x.axis").call(xAxis);
}
`

