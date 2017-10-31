<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <%@ include file="/company/pages/attendance/inc/asset.jsp" %>
	<title>SB Admin 2 - Bootstrap Admin Theme</title>
</head>

<style>
	
	/* 테이블의 내부여백을 줄여서, 결과적으로 전체 덩치를 줄인다. */
	.table-responsive .table, .panel-body {
		margin-bottom:0px; margin-top:0px;	/* 상하마진 0 */
		padding-bottom:0px; padding-top:0px;	/* 상하패딩 0 */
	}

	/* 주간, 월간 인기글 게시판의 너비를 줄여 한 줄에 나타나도록 한다.*/
	.head-board {
	width:50%;
	float:left;
	}
	#head-board-left {padding-left:0px; padding-right:10px;}
	#head-board-right {padding-left:10px; padding-right:0px;}
	
	/* 메인 게시판의 양옆 패딩을 제거. */
	#center-board {padding-left:0px; padding-right:0px;}
	#center-panel-heading {padding-top:15px;}
	
	/* 페이지 길이, 검색폼, 글쓰기를 한 줄에 넣기 */
	#dataTables-example_length {width:150px; display:inline;}
	#dataTables-example_wrapper > div:nth-child(1) > div:nth-child(1) {width:80px;}
	#dataTables-example_wrapper > div:nth-child(1) > div:nth-child(2) {float:left; display:inline; margin-left:3%;}
	#dataTables-example_wrapper > div:nth-child(1) > div:nth-child(3) {float:right; display:inline;}
	
	/* 페이지길이 내 옵션을 우측정렬 */
	#dataTables-example_length > label > select > option {}
	 
	/* 게시물 쇼잉 현황을 보여주는 폼 */
	#dataTables-example_wrapper > div:nth-child(3) > div:nth-child(1) {padding-left: 20px; width:285px;}
	/* 검색필터를 왼쪽으로 */
	div.dataTables_filter {text-align:left;}
	/* 페이징폼을 오른쪽으로 */
	#dataTables-example_wrapper > div:nth-child(3) > div:nth-child(2) {float:right;}
	
	/* 검색 폼 좌여백 */
	/* 검색 폼을 감싸는 div 넓이, 좌로 붙임. */
	#dataTables-example_wrapper > div:nth-child(1) > div:nth-child(2) {padding-left:10px; width:250px;}
	/* 검색분류 폼 높이 조절 */
	/* 패딩순서 -> 상 우 하 좌 */
	#dataTables-example_filter > label > div > select {margin-left:5px; padding: 0px 4px; height:30px;}
	/* 페이징 블럭 넓이 지정 */
	#dataTables-example_wrapper > div:nth-child(3) > div:nth-child(2) {width:500px;}

	/* 테이블텍스트는 티바디 기본 중앙정렬 */
	#center-board table tbody, #center-board table thead {text-align: center;} 
	/* 티바디 중 제목은 좌측정렬 */
	#center-board table tbody td:nth-child(2){text-align: left;} 
	
	/* 티헤드에 정렬스위치를 텍스트 옆으로 */
	table.dataTable thead .sorting:after {float: none; margin-left:5px;}
	
	/* 글쓰기 버튼 */
	#add {width:70px; margin-right:15px;}
	
	/* 페이징의 이전, 다음 버튼 내 텍스를 검은색으로 */
	#dataTables-example_previous > a, #dataTables-example_next> a {color:#777;}
	
	}


</style>




<body>

    <div id="wrapper">








		

	    <%@ include file="/company/pages/attendance/inc/navigation.jsp" %>
		

        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header" style="border-margin:0px; border:0px;"></h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->

				<div class="row" id="head-board">
					
					<!-- 최근에 댓글이 달린 테이블 -->
					<div class="col-lg-6 head-board" id="head-board-left">
						<div class="panel panel-default">
							<div class="panel-heading text-center">최근에 <span style="color:#F0AD4E">댓글이 달린</span> 글</div>
							<!-- /.panel-heading -->
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th>분류</th>
												<th class="text-center">제목</th>
												<th>갱신</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>일반</td>
												<td>연차 알차게 쓰는 방법(feat.여행)</td>
												<td>08:31</td>
											</tr>
											<tr>
												<td>일반</td>
												<td>코무합니다. 귀여운 고양이ㅎㅎ</td>
												<td>01:27</td>
											</tr>
											<tr>
												<td>건의</td>
												<td>템플릿을 더했을 뿐인데 이렇게..</td>
												<td>09-18</td>
											</tr>
											<tr>
												<td>질문</td>
												<td>그냥 아무 css없이 만들고싶다ㅎㅎ</td>
												<td>09-18</td>
											</tr>
											<tr>
												<td>질문</td>
												<td>나도 언젠간 템플릿을 만들 능력이..</td>
												<td>09-19</td>
											</tr>
										</tbody>
									</table>
								</div>
								<!-- /.table-responsive -->
							</div>
							<!-- /.panel-body -->
						</div>
						<!-- /.panel -->
					</div>
					<!-- /.col-lg-6 -->
					
					<!-- 최근에 답변을 받은 글 테이블 -->
					<div class="col-lg-6 head-board" id="head-board-right">
						<div class="panel panel-default">
							<div class="panel-heading text-center">최근에 <span style="color:#F0AD4E">답변을 받은</span> <span style="color:#5CB85C">질문, 건의</span> 글</div>
							<!-- /.panel-heading -->
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th>분류</th>
												<th class="text-center">제목</th>
												<th>갱신</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>질문</td>
												<td>쌍용홈페이지는 대체 왜 이 모양이죠?</td>
												<td>09-11</td>
											</tr>
											<tr>
												<td>건의</td>
												<td>특근 식비에 대한 개선안</td>
												<td>09-19</td>
											</tr>
											<tr>
												<td>질문</td>
												<td>프로그래머는 모두 섹시한가요? 뇌섹?</td>
												<td>09-15</td>
											</tr>
											<tr>
												<td>건의</td>
												<td>정수기에 라면을 버리는 교육생에 대해.</td>
												<td>09-15</td>
											</tr>
											<tr>
												<td>건의</td>
												<td>쓰레기통을 비치. 비치? 비치!! ㅗㅜㅖ!!</td>
												<td>09-15</td>
											</tr>
										</tbody>
									</table>
								</div>
								<!-- /.table-responsive -->
							</div>
							<!-- /.panel-body -->
						</div>
						<!-- /.panel -->
					</div>
					<!-- /.col-lg-6 -->
				</div>
				<!-- /.rows -->




				<div class="row">
					<div class="col-lg-12" id="center-board">
						<div class="panel panel-default">
							<div class="panel-heading text-center"><span style="color:#F0AD4E">자유</span><span style="color:#5CB85C">게시판</span></div>
							<!-- /.panel-heading -->
							<div class="panel-body" id="center-panel-heading">
								<table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
									<thead>
										<tr>
											<th class="text-center" style="padding:8px; width:9%;">분류</th>
											<th class="text-center"  style="padding:8px; width:56%;">제목</th>
											<th class="text-center" style="padding:8px; width:10%;">작성자</th>
											<th class="text-center" style="padding:8px; width:18%;">갱신</th>
											<th class="text-center" style="padding:8px; width:7%;">조회</th>
										</tr>
									</thead>
									
									<tbody>
										<c:forEach items="${list}" var="dto">
										<tr class="odd gradeX">
											<td>${dto.category}</td>
											<td>${dto.subject}</td>
											<td>${dto.name}</td>
											<td>${dto.regDate}</td>
											<td>${dto.readCount}</td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
								<!-- /.table-responsive -->
							</div>
							<!-- /.panel-body -->
						</div>
						<!-- /.panel -->
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->


			</div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <%@ include file="/company/pages/attendance/inc/closing.jsp" %>



<script>

	$(document).ready(function() {
	    
	    //글쓰기 버튼 추가
	    onclick="location.href='/MVCTest/board/add.do?reply=n';"
	    $('#dataTables-example_wrapper > div:nth-child(1) > div:nth-child(2)').after(
	            '<div id="add"><button type="button" class="btn btn-success" onclick="location.href=\'/Project/attendance/bbsAdd.do\';">글쓰기</button></div>');

	    //25페이씩 보여주도록.
		$('#dataTables-example_length > label > select > option:nth-child(1)').text('10 개');	
		$('#dataTables-example_length > label > select > option:nth-child(2)').text('25 개');	
		$('#dataTables-example_length > label > select > option:nth-child(3)').text('50 개');	
	
	});



</script>


</body>

</html>





















