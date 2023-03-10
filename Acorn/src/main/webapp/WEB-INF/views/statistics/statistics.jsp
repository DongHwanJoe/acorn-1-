<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/index.css">
<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.2.1/chart.umd.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>
<script src="https://cdn.jsdelivr.net/npm/dayjs@1/dayjs.min.js"></script>
<title>statistics.jsp</title>
<style>
.category_bar>.row{
	padding :0 20%;
	height : 50px;
	align-content : center;
	background-color : #ffd9d9;
}
.category_bar>.row>a{
	flex : 1;
	text-decoration : none;
	color : black;
	font-weight : bold;
	text-align : center;
}
.container{
	width : 75%;
}
.statistics_top{
	display: flex;
    justify-content: center;
    height: 150px;
    align-items: center;
    font-size: 15px;
   	border : 1px solid #cecece;
   	border-top : none;
}
.uv_count{
	display : flex;
	width : 30%;
	height : 100px;
	margin-right : 50px;
	padding : 0 20px;
}
.pv_count{
	display : flex;
	width : 30%;
	height : 100px;
	margin-left : 50px;
	padding : 0 20px;
}
.pv_count>span>a{
	text-decoration : none;
}
.uv_table, .pv_table{
	width : 100%;
}
.uvt_cont, .pvt_cont{
	text-align:left;
}
.uvt_val, .pvt_val{
	text-align:right;
}
.statistics{
	width : 100%;
	height : 100%;	
	margin : auto;
}
.statistics_mid>.row{
    place-content: center;
}
.statistics_topic{
    display: contents;
}
.statistics_topic>a>img{
	width : 250px;
	height : 250px;
	border : 1px solid #cecece;
	border-radius : 10px;
}
.statistics_topic>a{
	margin : 5%;
}
.statistics_bot{
	width : 600px;
	display:flex;
	margin : auto;
}
.chart{
	width : 100%;
	margin : auto;
	position : relative;
}
canvas{
	display: block;
	border : 1px solid #cecece;
	border-radius : 10px;
	padding : 50px;
	margin : auto;
}
select{
	position: absolute;
    font-size: 12px;
	left: 46%;
    top: 3%;
}
option{
	font-size: 12px;
}
</style>
</head>
<body>
	<jsp:include page="../../views/include/navbar.jsp">
		<jsp:param value="statistics" name="thisPage"/>
	</jsp:include>
	<div data-bs-spy="scroll" data-bs-target="#simple-list-example" data-bs-offset="0" data-bs-smooth-scroll="true" class="scrollspy-example" tabindex="0">
    <div id="simple-list-item-1" class="block_content_top"></div>

    
	<div class="container">
    	<div class="statistics_top">
    		<div class="uv_count">
	    		<table class="uv_table">
	    			<tr>
	    				<td class="uvt_cont">????????? ?????? ?????????</td>
	    				<td class="uvt_val" id="tuv"></td>
	    			</tr>
	    			<tr>
	    				<td class="uvt_cont">????????? ?????? ?????????</td>
	    				<td class="uvt_val" id="muv"></td>
	    			</tr>
	    		</table>
    		</div>
    		<div class="pv_count">
  		    	<table class="pv_table">
		    			<tr>
		    				<td class="pvt_cont">????????? ?????? ????????????</td>
		    				<td class="pvt_val" id="tpv"></td>
		    			</tr>
		    			<tr>
		    				<td class="pvt_cont">?????? ?????? ????????? ???</td>
		    				<td class="pvt_val" id="dpv"></td>
		    			</tr>		
		    			<tr>
		    				<td class="pvt_cont">?????? ???????????? 1??? </td>
		    				<td class="pvt_val"><a href="" id="pvTopTitle"> ????????????</a></td>
		    			</tr>
    			</table>

    		</div>
    	</div>
    	<br />
  	    <div class="statistics">
  	    	<div class="chart">
	   		 	<canvas id="myChart" ref="acquisitions" width="600" height="600"></canvas>
	   		 	<br />
   		 	</div>
   		 	<div class="chart">
	   		 	<canvas id="myChart2" ref="acquisitions2" width="600" height="600"></canvas>
	   		 	<br />
   		 	</div>
   		 	<div class="chart">
	   		 	<select name="" id="mCateChart">
	   		 		<option value="" disabled selected hidden>?????? ?????? ??????</option>
	   		 		<option value="1" id="op1"></option>
	   		 		<option value="2" id="op2"></option>
	   		 		<option value="3" id="op3"></option>
	   		 		<option value="4" id="op4"></option>
	   		 		<option value="5" id="op5"></option>
	   		 		<option value="6" id="op6"></option>
	   		 		<option value="7" id="op7"></option>
	   		 		<option value="8" id="op8"></option>
	   		 		<option value="9" id="op9"></option>
	   		 		<option value="10" id="op10"></option>
	   		 		<option value="11" id="op11"></option>
	   		 		<option value="12" id="op12"></option>
	   		 	</select>
   		 		<canvas id="myChart3" ref="acquisitions3" width="600" height="600"></canvas>
  		 	</div>
   		 	<br />
   		 	<div class="chart">
				<canvas id="myChart4" ref="acquisitions4" width="600" height="600"></canvas>
			</div>
    	</div>
    	

	</div>
</body>

<script>
const app = Vue.createApp({

	async mounted() {
		const response = await fetch('${pageContext.request.contextPath}/es/test', {
			method : 'GET',
			headers : {
				'Content-Type' : 'application/json',
			}
		});
		const responseUv = await fetch('${pageContext.request.contextPath}/es/test3', {
			method : 'GET',
			headers : {
				'Content-Type' : 'application/json',
			}
		});
		const viewObject = await response.json();
		const viewObject2 = await responseUv.json();
		//????????? ????????? ??? ?????? ???????????? ????????????  ??????
/* 		const monthPvCount = viewObject.filter(item => {
		    return item.date.startsWith("2024-01");
		});
 */
 		console.log(Object.keys(viewObject2[0]).length)
 		console.log(viewObject2[0][Object.keys(viewObject2[0])[0]])
 		var totalUv = 0;
 		var uvobjSize = Object.keys(viewObject2[0]).length;
 		var uvobjkeyArr = Object.keys(viewObject2[0]);
 		for(var i=0; i<uvobjSize; i++){
 			totalUv = totalUv + viewObject2[0][uvobjkeyArr[i]];
 		}
 		//total Uv, ????????? Uv
 		document.getElementById("tuv").innerText = totalUv;
 		document.getElementById("muv").innerText = viewObject2[0][uvobjkeyArr[uvobjSize -1]];
 
		document.getElementById("tpv").innerText = viewObject[2].PVTotalCount;
		document.getElementById("dpv").innerText = viewObject[1].PVDayCount;
		document.getElementById("pvTopTitle").innerText = Object.keys(viewObject[0][Object.keys(viewObject[0])[0]])[7];
		document.getElementById("pvTopTitle").setAttribute("href", "http://localhost:9000/shop/detail?num=" + viewObject[0][Object.keys(viewObject[0])[11]].storeId + "&keyword=");

		
		for(var i=0; i<12; i++){
			document.getElementById("op"+(i+1)).innerText = Object.keys(viewObject[0])[11-i];
		}
		
		Object.keys(viewObject[0])[11]
		const data=[];
		const data2=[];
		const data3=[];
		var pvTotalVal = 0;
		
		for(var i=0; i<12; i++){
			var monthKey = Object.keys(viewObject[0])[i];
			if(monthKey != null){
				pvMonthVal = viewObject[0][monthKey].total;
				pvTotalVal = pvTotalVal+viewObject[0][monthKey].total;
			}
			if(i==11){
				for(var j=0; j<7; j++){
					const cateItem = viewObject[0][monthKey]["cate"+(j+1)];
					let cateName = "";
				    switch(j){
				      case 0:
				        cateName = "??????";
				        break;
				      case 1:
				        cateName = "??????";
				        break;
				      case 2:
				        cateName = "??????";
				        break;
				      case 3:
				        cateName = "??????";
				        break;
				      case 4:
				        cateName = "??????";
				        break;
				      case 5:
				        cateName = "???????????????";
				        break;
				      default:
				        cateName = "??????";
				        break;
				    }
					data3.push({category: cateName , count:cateItem })
					
				}
			}
			//chart 1??? ?????????
			data.push({month:monthKey, pvMonth:pvMonthVal});
			//chart 2??? ?????????
			data2.push({month:monthKey, totalPv : pvTotalVal});
			
			monthKey, pvMonthVal = 0;
			
		}
		
		const ctx = document.getElementById("myChart").getContext("2d");
		const myChart = new Chart(ctx, {
			type: "bar",
	        data: {
	            labels: data.map(row => row.month),
	            datasets: [
	              {
	                label: '?????? PV',
	                data: data.map(row => row.pvMonth)
	              }
	            ]
	          },
			plugins : [ChartDataLabels],
			options: {
				plugins:??{
					title: {
						display: true,
						text: '?????? 12?????? ?????? PV',
						font:{
							size: 20,
						},
						padding: 0,
					},
					legend:??{
						display:??false
						},
					datalabels: {
			            font: {
			              size: 12,
			            },
			            display: function(context) {
			                return context.dataset.data[context.dataIndex]>1;
			              },
			            anchor: 'top',
			            align: 'center',
			            offset: 2,
			            formatter: function(value, context) {
			              return value;
			            }
					}
				},
				scales: {
					x:{
				    	ticks: {
							display: true,
							stepSize: 1,
				        },
			            grid: {display: false},
					},
					y:{
						beginAtZero: true, // y?????? 0?????? ??????????????? ??????
						offset: true,
						grid: {
						    display: false
					  	},
					    ticks: {
					        color: 'black',
					    	stepSize: 10, // ???????????? ????????? ????????? ?????? ?????? ??????
					    },
					},
				},
				responsive: true,
				},
		});
		window.addEventListener('resize', function() {
			myChart.resize();
		});
		

		
		
		//chart2 ???

		
		const ctx2 = document.getElementById("myChart2").getContext("2d");
		const myChart2 = new Chart(ctx2, {
			type: "line",
	        data: {
	            labels: data2.map(row => row.month),
	            datasets: [
	              {
	                label: '?????? PV2',
	                data: data2.map(row => row.totalPv)
	              }
	            ]
	          },
			plugins : [ChartDataLabels],
			options: {
				plugins:??{
					title: {
						display: true,
						text: '?????? PV ?????? ??????',
						font:{
							size: 20,
						},
						padding: 0,
					},
					legend:??{
						display:??false
						},
					datalabels: {
			            font: {
			              size: 12,
			            },
			            display: function(context) {
			                return context.dataset.data[context.dataIndex]>1;
			              },
			            anchor: 'top',
			            align: 'left',
			            offset: 2,
			            formatter: function(value, context) {
			              return value;
			            }
					}
				},
				scales: {
					x:{
				    	ticks: {
							display: true,
							stepSize: 1,
				        },
			            grid: {display: false},
					},
					y:{
						beginAtZero: true, // y?????? 0?????? ??????????????? ??????
						offset: true,
						grid: {
						    display: false
					  	},
					    ticks: {
					        color: 'black',
					    	stepSize: 500, // ???????????? ????????? ????????? ?????? ?????? ??????
					    },
					},
				},
				responsive: true,
				},
		});
		window.addEventListener('resize', function() {
			myChart2.resize();
		});
		
		
		
		//chart3

	  	const ctx3 = document.getElementById("myChart3").getContext("2d");
	  	
	  	const myChart3 = new Chart(ctx3, {
	  		type: "doughnut",
	        data: {
	              labels: data3.map(row => row.category),
	              datasets: [
	                {
	                  label: '?????? ???????????? ??? PV',
	                  data: data3.map(row => row.count)
	                }
	              ]
	            },
	  		plugins : [ChartDataLabels],
	  		options: {
	  			plugins:??{
					title: {
						display: true,
						text: Object.keys(viewObject[0])[11]+' ?????? ???????????? ??? ?????????',
						font:{
							size: 20,
						},
						padding: 0,
					},
	  				legend:{
	  					display: true,
	  					labels: {
	  						font: {
	  						  size: 12,
	  						},
	  						boxWidth: 30
	  					},
	  					formatter: function(value, context) {
	  		                return percentage;
	  		            },
	  				},
	  				datalabels: {
	  		            font: {
	  		              size: 15,
	  		              color: 'gray',
	  		            },
	  		            display: function(context) {
	  		                return context.dataset.data[context.dataIndex]>1;
	  		              },
	  		            anchor: 'top',
	  		            align: 'center',
	  		            offset: 2,
	  		            formatter: function(value, context) {
	  		                let sum = 0;
	  		                let dataArr = context.chart.data.datasets[0].data;
	  		                dataArr.map(data => {
	  		                  sum += data;
	  		                });
	  		                let percentage = (value * 100 / sum).toFixed(2) + "%";
	  		                return percentage;
	  		            }
	  				}
	  			},

	  	     },
		});
		window.addEventListener('resize', function() {
			myChart3.resize();
		});
		
		const mCateChart = document.getElementById("mCateChart");
		mCateChart.addEventListener("change", function() {
			const selectedValue = mCateChart.value; // ????????? ????????? ???
			var monthKey = Object.keys(viewObject[0])[12-selectedValue];

			for(var j=0; j<7; j++){
				const cateItem = viewObject[0][monthKey]["cate"+(j+1)];
				myChart3.data.datasets[0].data[j]=cateItem;
				myChart3.options.plugins.title.text = monthKey+ ' ?????? ???????????? ??? ?????????'
			}
			
			myChart3.update();
		});
		
		
		//chart4 
		var dataRST =[];
		let viewObject4 = {};
		
		const response4 = await fetch('${pageContext.request.contextPath}/es/test2', {
			method : 'GET',
			headers : {
				'Content-Type' : 'application/json',
			}
		});
		viewObject4 = await response4.json();

		var currTime2 = 0;
		var secData=[];
		var timeData=[];
		var timeObj = [];
		var resObj = [];
		var errorObj = [];
		var codeObj = [];
		var currTime= dayjs().valueOf()-65000;
		var count = 0;
		
		if(viewObject4.length==0){
			console.log("?????? ?????? ??????")
		}else{
			//response4??? ???????????? "time" ket??? ??? ????????? ????????? ????????? ????????????
 			for (var k = 0; k < viewObject4.length; k++) {
 				const currList=[];
 				  objTime = viewObject4[k].time;
 				  resObj[dayjs(objTime).$s] = viewObject4[k].elapsedTime * 0.001
 				  codeObj[dayjs(objTime).$s] = viewObject4[k].errorCode
 				  errorObj[dayjs(objTime).$s]= viewObject4[k].errorMsg
 				  timeObj[dayjs(objTime).$s] = dayjs(objTime).valueOf();
 				  timeData.push(timeObj);
 				  secData[k] = dayjs(objTime).$s;
 					currList.push({x: timeObj[dayjs(objTime).$s], y:resObj[dayjs(objTime).$s], rslt: (codeObj[dayjs(objTime).$s]=="OK") ? "success" : "failure", msg:errorObj[dayjs(objTime).$s]})
 					dataRST.push(currList);
 					count++;
 			}
		}
		
		for(var n=0; n<60 ;n++){
			const currList=[];
			currList.push({x: currTime, y:null, rslt:null, msg:null})
			currTime=currTime+1000;
			dataRST.push(currList);
		}
		function manfData(dataArr) {
			return dataArr.map(d => {
				return {
					data: d,
					label: d[0].x,
					backgroundColor: function(context) {
					    var responseType = context.dataset.data[context.dataIndex].rslt;
					    var responseTime = context.dataset.data[context.dataIndex].y;
					    return responseType === "success" && responseTime > 1 ? 'orange' : (responseType === "success" ? 'skyblue' : 'red');
					}
				};
			});
		}
		
		const ctx4 = document.getElementById("myChart4").getContext("2d");
		const dataLabels = [];

		const myChart4 = new Chart(ctx4, {
			type: "scatter",
	        data: {
	            datasets: manfData(dataRST),
	          },
			options: {
				plugins:??{
					tooltip: {
						  callbacks: {
						    title: function(tooltipItem, data) {
						    	if(tooltipItem[0].dataset.data[0].rslt != "success"){
						    		return 'Abnormal Response';
						    	}
						    	else if(tooltipItem[0].dataset.data[0].y>1){
						    		return 'Pending Response';
						    	}else{
						    		return 'Normal Response';
						    	}
						    },
						    label: function(tooltipItem, data) {
						      return 'Request Time : ' + dayjs(tooltipItem.dataset.data[0].x).$d;
						    },
						    afterLabel: function(tooltipItem, data) {
						      return 'Response Time : '+ tooltipItem.dataset.data[0].y.toFixed(3) + " sec"
						      		+ ((tooltipItem.dataset.data[0].msg != null) ? "\nError Code : "+tooltipItem.dataset.data[0].msg : "");
						    }
						  }
						},
					legend:??{
						display:??false
					},
					datalabels: {
			            font: {
			              size: 0,
			            },
			            display: function(context) {
			                return context.dataset.data[context.dataIndex]>1;
			              },
			            anchor: 'top',
			            align: 'center',
			            offset: 2,
			            formatter: function(value, context) {
			              return value;
			            }
					},
				},
				animation : {
					duration : 0,
				},
				scales: {
					x:{
			    	ticks: {
				    		font : {
				    			size : 12,
				    		},
							display: true,
							maxTicksLimit: 30,	
							stepSize: 100,
							// ?????? ??? ??????
					        callback: function(value, index, values) {
					            return dayjs(value).$H+":"+dayjs(value).$m+":"+dayjs(value).$s;
					          },
				        }, 
			            grid: {display: false},
					},
					y:{
						beginAtZero: true, // y?????? 0?????? ??????????????? ??????
						offset: true,
						grid: {
						    display: false
					  	},
					    ticks: {
					    	max : 1,
					    	min : 0,
					        color: '#ffc107',
					    	stepSize: 0.05, // ???????????? ????????? ????????? ?????? ?????? ??????
					    },
					},
				},
				responsive: true,
			},
		});
		window.addEventListener('resize', function() {
			myChart4.resize();
		});
		
		const ws = new WebSocket('ws://34.125.190.255:8011/data');

	    ws.onmessage = function(event) {
			const blob = event.data;
	    	const reader = new FileReader();
	    	reader.onload = function(event) {
				const buffer = event.target.result;
				const arrayBuffer = buffer;
				const dataView = new DataView(arrayBuffer);
				const decoder = new TextDecoder();
				const text = decoder.decode(dataView);
				const json = JSON.parse(text);
				viewObject4 = json;
	    	};
	    	reader.readAsArrayBuffer(blob);
	    }
	    
		setInterval(function() {
			const dataRST = []
 			
 			var currTime2 = 0;
 			var secData=[];
 			var timeData=[];
 			var timeObj = [];
 			var resObj = [];
 			var errorObj = [];
 			var codeObj = [];
 			var currTime= dayjs().valueOf()-65000;
 			var count = 0;
 			
 			if(viewObject4.length==0){
 				console.log("?????? ?????? ??????")
 			}else{
 				//response4??? ???????????? "time" ket??? ??? ????????? ????????? ????????? ????????????
 	 			for (var k = 0; k < viewObject4.length; k++) {
 	 				const currList=[];
					objTime = viewObject4[k].time;
					resObj[dayjs(objTime).$s] = viewObject4[k].elapsedTime * 0.001
					codeObj[dayjs(objTime).$s] = viewObject4[k].errorCode
					errorObj[dayjs(objTime).$s]= viewObject4[k].errorMsg
					timeObj[dayjs(objTime).$s] = dayjs(objTime).valueOf();
					timeData.push(timeObj);
					secData[k] = dayjs(objTime).$s;
 					currList.push({x: timeObj[dayjs(objTime).$s], y:resObj[dayjs(objTime).$s], rslt: (codeObj[dayjs(objTime).$s]=="OK") ? "success" : "failure", msg:errorObj[dayjs(objTime).$s]})
 					dataRST.push(currList);
 					count++;
 	 			}
 			}
 			
 			for(var n=0; n<60 ;n++){
 				const currList=[];
 				currList.push({x: currTime, y:null, rslt:null, msg:null})
 				currTime=currTime+1000;
 				dataRST.push(currList);
 			}
			myChart4.data.datasets = manfData(dataRST)
			myChart4.update();
	    }, 10000);
	},
});
app.mount(".statistics");

</script>

</html>