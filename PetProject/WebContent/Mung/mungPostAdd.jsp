<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
ul.mung__img {
	display: flex;
	justify-content: space-between;
	align-self: center;
}

ul.mung__img li {
	list-style: none;
	border: 1px solid gray;
	margin: 0 10px;
}

ul.mung__img li input {
	display: none;
}

img {
	max-width: 200px;
}

.mung__img-container{
     overflow: hidden;
     display: flex;
     align-items: center;
     justify-content: center;
     width: 200px;
     height: 200px;
}
</style>
<script type="text/javascript">
$(function() {
	$("div.mung__img-container").click(function() {
		//이벤트 강제호출
		$(this).prev().trigger('click');
	});
	
});

function readUrl(input,idx) {
	if(input.files[0]) {
		var reader=new FileReader();
		var tag="#preview"+idx;
		reader.onload=function(e) {
			$(tag).attr("src",e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
}
</script>
</head>
<%
	String myId=(String)session.getAttribute("myId");
	String accId=(String)session.getAttribute("accId");
%>
<body>
<div id="mumg__container">
	<ul id="mung__nav">
		<li class="mung__nav__acc">
			<a href="index.jsp?main=Mung/mungAccount.jsp">
				<img class="mung__profile" src="">
				<b><%=accId %>(<%=myId %>)</b>
			</a>
		</li>
		<li class="mung__nav__btn">
			<a href="index.jsp?main=Mung/mungMain.jsp">
				<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-house-door" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
				  <path fill-rule="evenodd" d="M7.646 1.146a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 .146.354v7a.5.5 0 0 1-.5.5H9.5a.5.5 0 0 1-.5-.5v-4H7v4a.5.5 0 0 1-.5.5H2a.5.5 0 0 1-.5-.5v-7a.5.5 0 0 1 .146-.354l6-6zM2.5 7.707V14H6v-4a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 .5.5v4h3.5V7.707L8 2.207l-5.5 5.5z"/>
				  <path fill-rule="evenodd" d="M13 2.5V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"/>
				</svg>
			</a>
		</li>
	</ul>
	
	<form action="Mung/mungInsertAction.jsp" method="post" enctype="multipart/form-data">
		<ul class="mung__img">
			<li>
				<input type="file" name="photo1" onchange="readUrl(this,1)">
				<div class="mung__img-container">
					<img id="preview1" src="Image/favicon.png">
				</div>	
			</li>
			<li>
				<input type="file" name="photo2" onchange="readUrl(this,2)">
				<div class="mung__img-container">
					<img id="preview2" src="Image/favicon.png">
				</div>	
			</li>
			<li>	
				<input type="file" name="photo3" onchange="readUrl(this,3)">
				<div class="mung__img-container">
					<img id="preview3" src="Image/favicon.png">
				</div>	
			</li>
			<li>	
				<input type="file" name="photo4" onchange="readUrl(this,4)">
				<div class="mung__img-container">
					<img id="preview4" src="Image/favicon.png">
				</div>	
			</li>
			<li>
				<input type="file" name="photo5" onchange="readUrl(this,5)" >
				<div class="mung__img-container">
					<img id="preview5" src="Image/favicon.png">
				</div>	
			</li>
		</ul>
		<textarea class="mung__content" name="content" required="required"></textarea>
		<input type="text" placeholder="#+추가할태그" name="tag" class="form-control">
		<button type="submit" id="mung__addBtn">등록</button>
	</form>
</div>	
</body>
</html>