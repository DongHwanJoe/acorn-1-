<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>chartRoom</title>
</head>
<body>
	<div id="indexPage">
	   {{ message }}
	   <br />
	   <input type="text" class="border w-64 h-12" id="ClientID" v-model="message">
	    <div style="width: 800px;"><canvas ref="acquisitions"></canvas></div>
	</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.2.1/chart.umd.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
<script>
	const { createApp } = Vue

	createApp({
	  data() {
	    return {
	      message: 'Hello Vue!',
	      }
	  },
	  async mounted() {
		  //data�� length�� �� graph�� �ִ� �������̴�. �̺��� Ŀ�� ��� ������ ������� �ڸ���.
		  var data = [
	          { time: 0, count: 0 },
	          { time: 0, count: 0 },
	          { time: 0, count: 0 },
	          { time: 0, count: 0 },
	          { time: 0, count: 0 },
	          { time: 0, count: 0 },
	          { time: 0, count: 0 },
	          { time: 0, count: 0 },
	          { time: 0, count: 0 },
	          { time: 0, count: 0 },
	          { time: 0, count: 0 },
	          { time: 0, count: 0 },
	          { time: 0, count: 0 },
	          { time: 0, count: 0 },
	          { time: 0, count: 0 },
	          { time: 0, count: 0 },
	          { time: 0, count: 0 },
	          { time: 0, count: 0 },
	          { time: 0, count: 0 },
	          { time: 0, count: 0 },
	          { time: 0, count: 0 },
	          { time: 0, count: 0 },
	          { time: 0, count: 0 },
	          { time: 0, count: 0 },
	          { time: 0, count: 0 },
	          { time: 0, count: 0 },
	        ];
		 
	    const chart = new Chart(
	      this.$refs.acquisitions,
	      {
	        type: 'bar',
	        data: {
	            labels: data.map(row => row.time),
	            datasets: [
	              {
	                label: 'Acquisitions by time',
	                data: data.map(row => row.count)
	              }
	            ]
	          }
	      }
	    );
	    //���ο��� ���� ���� �����Ͽ� ����
	    //������ �ö� �ִ� ��׶��� ������
	    //const ws = new WebSocket('ws://34.125.190.255:8011/data');
	    //�׽�Ʈ�� ���� ������
	    const ws = new WebSocket('ws://localhost:8011/data');
	    ws.onmessage = function(event) {
	        //�޾ƿ� �����͸� parsing�Ͽ� �׷����� data�� �־��ش�.
	        event.data.text().then((jsonString) => {
	            const jsonObj = JSON.parse(jsonString);
	            if(jsonObj.type=="data"){
	            	const newdata = {
	    	                time: jsonObj.date,
	    	                count: jsonObj.text
	    	              };
	            	//�ʹ� ������� ���(������ data ������ length��ŭ. �Ƹ� 25�� ��)
	            	//�����ϰ� �׷����� shifting�Ѵ�.
	            	data = data.slice(1);
					data.push(newdata);
		            chart.data.labels = data.map(row => row.time);
		            chart.data.datasets[0].data = data.map(row => row.count);
		            //�۾��� �������� ��Ʈ�� ������Ʈ���ش�.
		            chart.update();
	            }
	        })
	    }.bind(this);
	  }
	}).mount('#indexPage');
</script>
</body>
</html>