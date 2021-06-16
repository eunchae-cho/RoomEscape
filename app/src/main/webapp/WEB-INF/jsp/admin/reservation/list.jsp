<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[room escape] 관리자 - 예약 관리</title>
    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

</head>
<body>
<jsp:include page="../sidebar.jsp"></jsp:include>  

 <main  class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
    <h3 style="margin-block: 50px; border-bottom: solid;">예약 리스트</h3> 
 <div id="control" style="display: flex; margin-right: 10px; justify-content: space-between;">
 	 <input type="date" id="selectDate" name="date" value="${dateToday}">
 	<button type="button" class="btn btn-light editBtn" style="font-size: 12px;">수정</button>
 	<button type="button" class="btn btn-light ajaxBtn" style="font-size: 12px; display: none;">완료</button>
 </div>
  <div style="margin-top: 20px;">
      <div id=".table-responsive" class="table-responsive">
        <table class="table table-striped table-sm res-table">
          <thead>
            <tr>
              <th style="width: 5%;">no.</th>
              <th style="width: 10%;">날짜</th>
              <th style="width: 10%;">시간대</th>
              <th style="width: 20%;">룸 테마</th>
              <th style="width: 12%;">예약자명</th>
              <th style="width: 12%;">인원</th>
              <th style="width: 12%;">상태</th>
              <th style="width: 14%;">탈출여부</th>
            </tr>
          </thead>
          <tbody>
          <c:forEach items="${list}" var="res">
            <tr class="tr">
              <td>${res.no}</td>
              <td>${res.doDate}</td>
              <td >${res.roomTime}</td>
              <td >${res.room.title}</td>
              <td >${res.user.name}</td>
              <td >${res.participant}</td>
              <td >${res.status}</td>
              <td >${res.escape}<div id="record" style="margin-block: 5px;"></div></td>
            </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
   </div>

 </main>

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>
	$(function() {
		statusAsString();
	});
	
	function statusAsString() {
		$('.res-table .tr').each(function() {
			var status = $(this).find('td:eq(6)');
			if (status.text() == 0) {
				status.text('예약');
			} else if (status.text() == 1) {
				status.text('예약취소');
			} else if (status.text() == 2) {
				status.text('종료');
			}
		});
	}
	
	// 날짜 선택 시
	$('#selectDate').on('change', function() {
		$('.ajaxBtn').css('display', 'none');
		$('.editBtn').css('display', 'inline-block');
		
		var selectedDate = $(this).val();
		
		$.ajax({
			url: 'selectDate',
			type: 'get',
			data: {
				date : selectedDate
			},
			dataType: 'json',
			success: function(data) {
				console.log(data);
				$('.res-table tbody').text('')
				var htmls = '';
				
				$(data).each(function() {
					htmls += '<tr class="tr">';
					htmls += '<td>'+ this.no +'</td>'; 
					htmls += '<td>'+ this.doDate +'</td>'; 
					htmls += '<td>'+ this.roomTime +'</td>'; 
					htmls += '<td>'+ this.room.title +'</td>'; 
					htmls += '<td>'+ this.user.name +'</td>'; 
					htmls += '<td>'+ this.participant +'</td>'; 
					htmls += '<td>'+ this.status +'</td>'; 
					htmls += '<td>'+ this.escape +'</td>'; 
					htmls += '</tr>';
				})
				$('.res-table tbody').append(htmls);
				statusAsString();
			},
			error: function() {
				console.log('error');
			}
		});
	});
	
	// 예약 행을 눌렀을 때
	$('.res-table .tr').on('click', function() {
		location.href = '<%=request.getContextPath() %>/admin/reservation/detail?no='+ $(this).find('td:eq(0)').text();
	});
	$(document).on('click', '.res-table .tr', function() {
		location.href = '<%=request.getContextPath() %>/admin/reservation/detail?no='+ $(this).find('td:eq(0)').text();
	});
	
	// 수정 버튼 누를 시
	$(".editBtn").on('click', function() {
		
		$(".editBtn").css('display', 'none');
		$(".ajaxBtn").css('display', 'inline-block');
		
		$('.res-table tr').each(function() {
			var st_value = $(this).find('td:eq(6)').text();
			var es_value = $(this).find('td:eq(7)').text();
			var status = $(this).find('td:eq(6)');
			var escape = $(this).find('td:eq(7)');
			
			status.text('');
			escape.text('');
			
			status.append('<select class="form-select select-status" style="width: 100px; padding-block: 2px; font-size:15px;">');
			if ($('.select-status').empty()) {
				$('.select-status').append('<option value="0">예약</option>');
				$('.select-status').append('<option value="1">예약취소</option>');
				$('.select-status').append('<option value="2">종료</option>');
			}
			
			if (st_value == '예약') {
				$('.select-status option:eq(0)').attr('selected', 'selected');
			} else if (st_value == '예약취소') {
				$('.select-status option:eq(1)').attr('selected', 'selected');
			} else if (st_value == '종료') {
				$('.select-status option:eq(2)').attr('selected', 'selected');
			}
			
			escape.append('<select class="form-select select-escape" style="width: 100px; padding-block: 2px; font-size:15px;">');
			if ($('.select-escape').empty()) {
				$('.select-escape').append('<option value="0">실패</option>');
				$('.select-escape').append('<option value="1">성공</option>');
			}
			
			if (es_value == '실패') {
				$('.select-escape option:eq(0)').attr('selected', 'selected');
			} else if (es_value == '성공') {
				$('.select-escape option:eq(1)').attr('selected', 'selected');
			} 
			
			var max_cnt = 0;
			var record = record = document.getElementById('record');;
			$('.select-escape').on('change', function() {
				if (es_value == '성공' && max_cnt == 0) {
					$('#record').append('<label style="font-size: 14px; margin-left: 5px;">탈출 시간:</label>');
					$('#record').append('<input type="text" name="escapedTime" style="font-size: 14px; width: 80px; height: 22px; margin-left: 5px;">');
					console.log($('#record').html())
					max_cnt = 1;
				} else {
					//escape.find('.select-escape div').remove();
					$('#record *').remove();
					console.log(record)
					max_cnt = 0;
				}
			});
		});
	
	});
	
	// 완료 버튼 누를 시
	 $('.ajaxBtn').on('click', function() {
		 
		 $('.ajaxBtn').css('display', 'none');
		 $('.editBtn').css('display', 'inline-block');

		
		$('.res-table tbody tr').each(function() {
			var no = $(this).find('td:eq(0)');
			var status = $(this).find('.select-status option:selected').val();
			var escape = $(this).find('.select-escape option:selected').val();
			var selectedDate = $('#selectDate').val();
			console.log(selectedDate)
			
			 $.ajax({
				url: 'edit',
				type: 'get',
				traditional: true,
				async: false,
				data: {
					no : no.text(),
					status : status,
					escape : escape
				},
				dataType: 'text',
				success: function(data) {
					console.log(data);
					location.reload();
					//$('#selectDate').val(selectedDate)
					//$('#table-responsive').load(location.href + '#table-responsive');
				},
				error: function() {
					console.log('error');
				}
			}); 
		});
	});
</script>
</body>
</html>