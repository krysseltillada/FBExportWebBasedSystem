$(document).ready(function () {
	
	var currentMonth = moment().month();
	
	var months = [
		formatMonth(currentMonth - 4),
		formatMonth(currentMonth - 3),
		formatMonth(currentMonth - 2),
		formatMonth(currentMonth - 1),
		formatMonth(currentMonth)
	];
	
	function getMonth(objNum, monthNum, obj){
		var mon = obj[Object.keys(obj)[objNum]];
		return mon != null ? formatMonth(Object.keys(mon)[monthNum] - 1) : "";
	}
	
	function getMonthValue(objNum, monthNum,obj){
		var mon = obj[Object.keys(obj)[objNum]];
		return mon != null ? mon[Object.keys(mon)[monthNum]] : 0;
	}
	
	function getGraphData(objNum, obj){
		return [ months[0] == getMonth(objNum, 0, obj) ? getMonthValue(objNum , 0, obj) : months[0] == getMonth(objNum, 1, obj) ? getMonthValue(objNum , 1, obj) : months[0] == getMonth(objNum, 2, obj) ? getMonthValue(objNum , 2, obj) : months[0] == getMonth(objNum, 3, obj) ? getMonthValue(objNum , 3, obj) : months[0] == getMonth(objNum, 4, obj) ? getMonthValue(objNum , 4, obj) : 0, 
        		months[1] == getMonth(objNum, 0, obj) ? getMonthValue(objNum , 0, obj) : months[1] == getMonth(objNum, 1, obj) ? getMonthValue(objNum , 1, obj) : months[1] == getMonth(objNum, 2, obj) ? getMonthValue(objNum , 2, obj) : months[1] == getMonth(objNum, 3, obj) ? getMonthValue(objNum , 3, obj) : months[1] == getMonth(objNum, 4, obj) ? getMonthValue(objNum , 4, obj) : 0,
                months[2] == getMonth(objNum, 0, obj) ? getMonthValue(objNum , 0, obj) : months[2] == getMonth(objNum, 1, obj) ? getMonthValue(objNum , 1, obj) : months[2] == getMonth(objNum, 2, obj) ? getMonthValue(objNum , 2, obj) : months[2] == getMonth(objNum, 3, obj) ? getMonthValue(objNum , 3, obj) : months[2] == getMonth(objNum, 4, obj) ? getMonthValue(objNum , 4, obj) : 0,
                months[3] == getMonth(objNum, 0, obj) ? getMonthValue(objNum , 0, obj) : months[3] == getMonth(objNum, 1, obj) ? getMonthValue(objNum , 1, obj) : months[3] == getMonth(objNum, 2, obj) ? getMonthValue(objNum , 2, obj) : months[3] == getMonth(objNum, 3, obj) ? getMonthValue(objNum , 3, obj) : months[3] == getMonth(objNum, 4, obj) ? getMonthValue(objNum , 4, obj) : 0,
                months[4] == getMonth(objNum, 0, obj) ? getMonthValue(objNum , 0, obj) : months[4] == getMonth(objNum, 1, obj) ? getMonthValue(objNum , 1, obj) : months[4] == getMonth(objNum, 2, obj) ? getMonthValue(objNum , 2, obj) : months[4] == getMonth(objNum, 3, obj) ? getMonthValue(objNum , 3, obj) : months[4] == getMonth(objNum, 4, obj) ? getMonthValue(objNum , 4, obj) : 0];
	}
	
	function formatMonth(month){
		return moment().month(month).format("MMMM");
	}
	
	var legendState = true;
    
    if ($(window).outerWidth() < 576) {
        legendState = false;
    }
	
	 var LINECHART = $('#lineCahrt');
	 //Line Chart

    // ------------------------------------------------------- //
    // Charts Gradients
    // ------------------------------------------------------ //
    var ctx1 = $("canvas").get(0).getContext("2d");
    var gradient1 = ctx1.createLinearGradient(150, 0, 150, 300);
    gradient1.addColorStop(0, 'rgba(133, 180, 242, 0.91)');
    gradient1.addColorStop(1, 'rgba(255, 119, 119, 0.94)');

    var gradient2 = ctx1.createLinearGradient(146.000, 0.000, 154.000, 300.000);
    gradient2.addColorStop(0, 'rgba(104, 179, 112, 0.85)');
    gradient2.addColorStop(1, 'rgba(76, 162, 205, 0.85)');

    
    var LINECHARTEXMPLE   = $('#lineChartExample');
    var lineChartExample = new Chart(LINECHARTEXMPLE, {
        type: 'line',
        options: {
            title : {
                display: true,
                text : "Montly page status"
            },
            
            legend: {labels:{fontColor:"#777", fontSize: 12}},
            scales: {
                xAxes: [{
                    display: true,
                    gridLines: {
                        color: '#eee'
                    }
                }],
                yAxes: [{
                    display: true,
                    gridLines: {
                        color: '#eee'
                    }
                }]
            },
        },
        data: {
            labels: ["January", "February", "March", "April", "May", "June", "July"],
            datasets: [
                {
                    label: "Visitors",
                    fill: true,
                    lineTension: 0.3,
                    backgroundColor: gradient1,
                    borderColor: gradient1,
                    borderCapStyle: 'butt',
                    borderDash: [],
                    borderDashOffset: 0.0,
                    borderJoinStyle: 'miter',
                    borderWidth: 1,
                    pointBorderColor: gradient1,
                    pointBackgroundColor: "#fff",
                    pointBorderWidth: 1,
                    pointHoverRadius: 5,
                    pointHoverBackgroundColor: gradient1,
                    pointHoverBorderColor: "rgba(220,220,220,1)",
                    pointHoverBorderWidth: 2,
                    pointRadius: 1,
                    pointHitRadius: 10,
                    data: [30, 50, 40, 61, 42, 35, 40],
                    spanGaps: false
                },
                {
                    label: "Page views",
                    fill: true,
                    lineTension: 0.3,
                    backgroundColor: gradient2,
                    borderColor: gradient2,
                    borderCapStyle: 'butt',
                    borderDash: [],
                    borderDashOffset: 0.0,
                    borderJoinStyle: 'miter',
                    borderWidth: 1,
                    pointBorderColor: gradient2,
                    pointBackgroundColor: "#fff",
                    pointBorderWidth: 1,
                    pointHoverRadius: 5,
                    pointHoverBackgroundColor: gradient2,
                    pointHoverBorderColor: "rgba(220,220,220,1)",
                    pointHoverBorderWidth: 2,
                    pointRadius: 1,
                    pointHitRadius: 10,
                    data: [50, 40, 50, 40, 45, 40, 30],
                    spanGaps: false
                }
            ]
        }
    });
    
    $.get( "/FBExportSystem/admin/dashboard/get-data", function( data ) {
    	
    	var obj = $.parseJSON(data);
    	
    	
    	var myLineChart = new Chart(LINECHART, {
            type: 'line',
            options: {
                title: {
                    display: true,
                    text : "Top Monthly Stocks"
                },
                scales: {
                    xAxes: [{
                        display: true,
                        gridLines: {
                            display: false
                        }
                    }],
                    yAxes: [{
                        display: true,
                        gridLines: {
                            display: false
                        }
                    }]
                },
                legend: {
                    display: legendState
                }
            },
            data: {
                labels: [months[0], months[1], months[2], months[3], months[4]],
                datasets: [
                    {
                        label: Object.keys(obj)[0] == null ? "" : Object.keys(obj)[0],
                        fill: true,
                        lineTension: 0,
                        backgroundColor: "transparent",
                        borderColor: '#f15765',
                        pointBorderColor: '#da4c59',
                        pointHoverBackgroundColor: '#da4c59',
                        borderCapStyle: 'butt',
                        borderDash: [],
                        borderDashOffset: 0.0,
                        borderJoinStyle: 'miter',
                        borderWidth: 1,
                        pointBackgroundColor: "#fff",
                        pointBorderWidth: 1,
                        pointHoverRadius: 5,
                        pointHoverBorderColor: "#fff",
                        pointHoverBorderWidth: 2,
                        pointRadius: 1,
                        pointHitRadius: 0,
                        data: getGraphData(0, obj),
                        spanGaps: false
                    },
                    {
                        label: Object.keys(obj)[1] == null ? "" : Object.keys(obj)[1],
                        fill: true,
                        lineTension: 0,
                        backgroundColor: "transparent",
                        borderColor: "#54e69d",
                        pointHoverBackgroundColor: "#44c384",
                        borderCapStyle: 'butt',
                        borderDash: [],
                        borderDashOffset: 0.0,
                        borderJoinStyle: 'miter',
                        borderWidth: 1,
                        pointBorderColor: "#44c384",
                        pointBackgroundColor: "#fff",
                        pointBorderWidth: 1,
                        pointHoverRadius: 5,
                        pointHoverBorderColor: "#fff",
                        pointHoverBorderWidth: 2,
                        pointRadius: 1,
                        pointHitRadius: 10,
                        data: getGraphData(1, obj),
                        spanGaps: false
                    },
                    {
                        label: Object.keys(obj)[2] == null ? "" : Object.keys(obj)[2],
                        fill: true,
                        lineTension: 0,
                        backgroundColor: "transparent",
                        borderColor: "#FFC36D",
                        pointHoverBackgroundColor: "#FFC36D",
                        borderCapStyle: 'butt',
                        borderDash: [],
                        borderDashOffset: 0.0,
                        borderJoinStyle: 'miter',
                        borderWidth: 1,
                        pointBorderColor: "#FFC36D",
                        pointBackgroundColor: "#fff",
                        pointBorderWidth: 1,
                        pointHoverRadius: 5,
                        pointHoverBorderColor: "#fff",
                        pointHoverBorderWidth: 2,
                        pointRadius: 1,
                        pointHitRadius: 10,
                        data: getGraphData(2, obj),                  
                        spanGaps: false
                    }
                ]
            }
        });
    	
    	
    });
});

