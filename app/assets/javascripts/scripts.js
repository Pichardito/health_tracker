
	// take data and make d3 visualization
function generateGraph(patient_id){
  //container id
  $.ajax({
    url:"/getting-visualization/"+patient_id,
    success:function(data){
        modifyResult(data);
     }
  });

var modifyResult = function(objData){
  var xAxisData =[];
  var seriesData =[{
            name: 'weight',
            data: []
        },{
            name: 'bmi',
            data: []
        },{
            name: 'cholesterol',
            data: []
        },{
            name: 'glycated_hemoglobin',
            data: []
        },{
            name: 'systolic',
            data: []
        },{
            name: 'diastolic',
            data: []
        },
            {name: 'triglycerides',
            data: []
        }];
  for(var i =0;i<objData.length;i++){
    xAxisData.push(objData[i]["created_at"])
    for(var k=0;k<seriesData.length;k++){
      seriesData[k].data.push(objData[i][seriesData[k].name]);
      }
  }


$('#chartContainer').highcharts({
        title: {
            text: 'Patient Checkup',
            x: -20 //center
        },
        xAxis: {
            categories: xAxisData
        },
        yAxis: {
            title: {
                text: 'Units'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        series: seriesData
    });
}}
// }
//   //making ajax call and get the data

// }
