$.ajax({
	url: '/patients' + patient_id,
	method: 'get',
	dataType: 'json',
	data: 
	success: function(data){
		
	}

})



var h = 100
var w = 200;

patient_weight = []
patient_triglycerdes = []
patient_glycated_hemoglobin = []
patient_cholesterol = []
patient_systolic = []
patient_diastolic = []
patient_bmi = []

var line = d3.svg.line()
	.x(function(d){return d.})
	.y(function(d){return d.})
	.interpolate("linear");

var svg =
d3.select("body").append("svg").attr({
	width:w, height:h })

var viz = svg.append("path")
.attr({
	d: line(),
	"stroke": "purple",
	"stroke-width": 2,
	"fill": "none"
});