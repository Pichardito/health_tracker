$(function(){
		//make ajax call 
		$.ajax({
	url: '/getting-visualization/' + patient_id 
	method: 'get',
	dataType: 'json',
	data: 
	success: function(data){
			generateGraph(data);
	}

})
	// take data and make d3 visualization

	var margin = {top: 20, right: 80, bottom: 30, left: 50},
    width = 960 - margin.left - margin.right,
    height = 500 - margin.top - margin.bottom;

var parseDate = d3.time.format("%Y%m%d").parse;

var x = d3.time.scale()
    .range([0, width]);

var y = d3.scale.linear()
    .range([height, 0]);

var color = d3.scale.category10();

var xAxis = d3.svg.axis()
    .scale(x)
    .orient("bottom");

var yAxis = d3.svg.axis()
    .scale(y)
    .orient("left");

var line = d3.svg.line()
    .interpolate("basis")
    .x(function(d) { return x(d.date); })
    .y(function(d) { return y(d.units); });

var svg = d3.select("body").append("svg")
    .attr("width", width + margin.left + margin.right)
    .attr("height", height + margin.top + margin.bottom)
  .append("g")
    .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

d3.json("data.json", function(error, data) {
  color.domain(d3.keys(data[0]).filter(function(key) { return key !== "date"; }));

  data.forEach(function(d) {
    d.date = parseDate(d.date);
  });

  var healthData = color.domain().map(function(name) {
    return {
      name: name,
      values: data.map(function(d) {
        return {date: d.date, units: +d[name]};
      })
    };
  });

  x.domain(d3.extent(data, function(d) { return d.date; }));

  y.domain([
    d3.min(healthData, function(c) { return d3.min(c.values, function(v) { return v.units; }); }),
    d3.max(healthData, function(c) { return d3.max(c.values, function(v) { return v.units; }); })
  ]);

  svg.append("g")
      .attr("class", "x axis")
      .attr("transform", "translate(0," + height + ")")
      .call(xAxis);

  svg.append("g")
      .attr("class", "y axis")
      .call(yAxis)
    .append("text")
      .attr("transform", "rotate(-90)")
      .attr("y", 6)
      .attr("dy", ".71em")
      .style("text-anchor", "end")
      .text("Temperature (ºF)");

  var health = svg.selectAll(".health")
      .data(healthData)
    .enter().append("g")
      .attr("class", "health");

  health.append("path")
      .attr("class", "line")
      .attr("d", function(d) { return line(d.values); })
      .style("stroke", function(d) { return color(d.name); });

  health.append("text")
      .datum(function(d) { return {name: d.name, value: d.values[d.values.length - 1]}; })
      .attr("transform", function(d) { return "translate(" + x(d.value.date) + "," + y(d.value.units) + ")"; })
      .attr("x", 3)
      .attr("dy", ".35em")
      .text(function(d) { return d.name; });
});


// var h = 100
// var w = 200;

// patient_weight = []
// patient_triglycerdes = []
// patient_glycated_hemoglobin = []
// patient_cholesterol = []
// patient_systolic = []
// patient_diastolic = []
// patient_bmi = []

// var line = d3.svg.line()
// .x(function(d){return d.})
// .y(function(d){return d.})
// .interpolate("linear");

// var svg =
// d3.select("body").append("svg").attr({
// width:w, height:h })

// var viz = svg.append("path")
// .attr({
// d: line(),
// "stroke": "purple",
// "stroke-width": 2,
// "fill": "none"
});