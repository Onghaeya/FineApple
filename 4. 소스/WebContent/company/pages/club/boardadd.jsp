<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin 2 - Bootstrap Admin Theme</title>

<!-- Bootstrap Core CSS -->
<link href="/Project/company/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="/Project/company/vendor/metisMenu/metisMenu.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="/Project/company/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="/Project/company/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<script src="/Project/company/vendor/jquery/jquery.min.js"></script>
<style>
.v-header {
	margin-top: 15px;
	margin-left: 15px;
}

.v-profile {
	width: 15%;
	float: left;
	padding-left: 15px;
}

.v-profile img {
	border: 1px solid #c5c5c5;
	border-radius: 50%;
	outline: none;
}

.v-writer {
	width: 80%;
	float: left;
	padding-left: 30px;
	font-size: 14px;
}

.v-writer:after {
	clear: both;
}

.v-writer div {
	line-height: 1.5em;
	margin-top: 8px;
	font-size: 16px;
	margin-bottom: 8px;
}

.v-writer span {
	font-size: 16px;
	line-height: 1.5em;
	color: #868686;
}

.v-writer #clubname {
	margin-left: 30px;
	font-size: 16px;
	font-weight: 400;
	color: #868686;
	line-height: 1.33em;
	word-spacing: -10;
}

.v-body {
	margin-top: 25px;
	padding-left: 60px;
	padding-right: 60px;
}

.v-body #content {
	min-height: 300px;
}

.v-title {
	font-size: 25px;
	line-height: 36px;
	font-weight: 100;
	color: #333;
	margin-bottom: 25px;
}

.v-content {
	line-height: 1.33;
	margin-bottom: 1em;
	min-height: 30px;
	overflow-x: auto;
	font-size: 14px;
}

.v-regdate {
	font-weight: 400;
	margin: 0 0 21px;
	font-size: 14px;
	line-height: 24px;
	color: #999;
}

.v-btn {
	padding-left: 60px;
	margin-top: 15px;
}

.add {
	text-align: center;
	padding-right: 60px;
}

.v-btn .btn-default:hover {
	border-color: #c5c5c5;
	background-color: #eee;
}

.v-btn .btn-primary {
	border-color: #c5c5c5;
	background-color: #666;
	color: #fff;
}

.v-btn .btn-primary:hover {
	border-color: #c5c5c5;
	background-color: #c5c5c5;
}

.v-file label {
	display: inline-block;
	padding: .5em .75em;
	color: #999;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
}

.v-file input[type="file"] { /* 파일 필드 숨기기 */
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}
/* named upload */
.v-file .upload-name {
	display: inline-block;
	padding: .5em .75em; /* label의 패딩값과 일치 */
	font-size: inherit;
	font-family: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #f5f5f5;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
	-moz-appearance: none;
	appearance: none;
}
/* imaged preview */
.v-file .upload-display { /* 이미지가 표시될 지역 */
	margin-bottom: 5px;
}

@media ( min-width : 768px) {
	.v-file .upload-display {
		display: inline-block;
		margin-right: 5px;
		margin-bottom: 0;
	}
}

.v-file .upload-thumb-wrap { /* 추가될 이미지를 감싸는 요소 */
	display: inline-block;
	width: 54px;
	padding: 2px;
	vertical-align: middle;
	border: 1px solid #ddd;
	border-radius: 5px;
	background-color: #fff;
}

.v-file .upload-display img { /* 추가될 이미지 */
	display: block;
	max-width: 100%;
	width: 100% \9;
	height: auto;
}
</style>
<script>
	$(document).ready(function() {
		$("#title").val("제목을 입력하세요");
		$("#content").text("내용을 입력하세요.")

		$("#title").click(function() {
			$(this).val("");
		});

		$("#content").mousedown(function() {
			$(this).text("");
		});
		var fileTarget = $('.v-file .upload-hidden');
		fileTarget.on('change', function() { // 값이 변경되면 
			if (window.FileReader) {
				// modern browser 
				var filename = $(this)[0].files[0].name;
			} else { // old IE 
				var filename = $(this).val().split('/').pop()
						.split('\\').pop(); // 파일명만 추출 
			}
			// 추출한 파일명 삽입 
			$(this).siblings('.upload-name').val(filename);
			
			//preview image
			var imgTarget = $('.preview-image .upload-hidden');
			imgTarget
					.on(
							'change',
							function() {
								var parent = $(this).parent();
								parent.children('.upload-display')
										.remove();
								if (window.FileReader) { //image 파일만 
									if (!$(this)[0].files[0].type.match(/image\//))
										return;
									var reader = new FileReader();
									reader.onload = function(e) {
										var src = e.target.result;
										parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
									}
									reader.readAsDataURL($(this)[0].files[0]);
								} else {
									$(this)[0].select();
									$(this)[0].blur();
									var imgSrc = document.selection.createRange().text;
									parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');
									var img = $(this).siblings('.upload-display').find('img');
									img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+ imgSrc + "\")";
								}
							}); 
		});
	});

</script>
</head>

<body>

	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">

			<!-- upperHeader -->
			<%@ include file="/company/inc/upperHeader.jsp"%>
			<!-- leftHeader -->
			<%@ include file="/company/inc/leftHeader.jsp"%>


		</nav>

		<!-- Page Content -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">Blank</h1>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->

				<div class="v-header row">

					<div class="v-profile">
						<img src="/Project/company/images/empimg.png">
					</div>
					<div class="v-writer">
						<div>김태현</div>


						<span>총무부 / 과장</span> <span id="clubname"
							class="glyphicon glyphicon-asterisk" aria-hidden="true">
							축구왕 슛돌이</span>
					</div>

				</div>
				<form method="post" enctype="multipart/form-data"
					action="/Project/club/boardaddok.do">
					<div class="v-body row">
						<div class="v-title">
							<input type="text" name="title" id="title"
								class="form-control long" required>
						</div>
						<div class="v-content">
							<textarea name="content" id="content" class="form-control long"
								required></textarea>
						</div>
						<div class="v-file preview-image">
							<input class="upload-name" value="파일선택" disabled="disabled">

							<label for="attach">파일
								첨부</label> 
							<input type="file" name="attach" id="attach"
								class="upload-hidden">
						</div>
					</div>

					<div class="v-btn add" class="row">
						<input type="button" value="돌아가기" class="btn btn-default"
							onclick="history.back();"> 
						<input type="submit"
							value="글쓰기" class="btn btn-primary">

					</div>
					<input type="hidden" name="reply" value=""> <input
						type="hidden" name="thread" value=""> <input type="hidden"
						name="depth" value="">
						<input type="hidden" name="clubseq" value="${clubseq}">
				</form>
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="/Project/company/vendor/jquery/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="/Project/company/vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="/Project/company/vendor/metisMenu/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="/Project/company/dist/js/sb-admin-2.js"></script>

</body>

</html>
