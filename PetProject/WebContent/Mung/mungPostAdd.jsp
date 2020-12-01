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
	margin: 0 10px;
}

ul.mung__img li input {
	display: none;
}

.mung__img-container img{
	max-width: 200px;
}

.mung__img-container{
     background-image: url('Image/favicon.png');
     background-repeat : no-repeat;
     background-position: center;
     overflow: hidden;
     display: flex;
     align-items: center;
     justify-content: center;
     width: 200px;
     height: 200px;
     border: 1px solid gray;
}

</style>
<script type="text/javascript">
$(function() {
	$(".mung__img-container").click(function() {
		//이벤트 강제호출
		$(this).prev().trigger('click');
	});
	
	//사진 선택시 삭제버튼 보이기
	for(var i=1; i<=5; i++) {
		var id="#preview"+i;
		var src=$(id).attr("src");
		var btn="#mung__delBtn"+i;
		if(src=="") {
			$(btn).hide();
		}
	}
	
	//제출시 이미지파일 누락 또는 태그에 #이 빠진 경우
	$('#mung__addForm').submit(function() {
        if($('.mung__preview').attr("src")=='') {
            alert("사진을 1장 이상 등록해주세요");
            return false;
        }
        
        if($("#mung__tag").val()!=null && !$("#mung__tag").val().match("#")) {
        	alert("태그에 #을 붙여주세요.");
            return false;
        }
    }); // end submit()
	
});

//파일 업로드
function readUrl(input,idx,file) {
	if(input.files[0]) {
		var reader=new FileReader();
		var tag="#preview"+idx;
		var btn="#mung__delBtn"+idx;
		reader.onload=function(e) {
			$(tag).attr("src",e.target.result);
			$(btn).show();
		}
		
		//파일 확장자 검사(이미지만 가능)
		var reg = /(.*?)\.(jpg|jpeg|png|gif|bmp)$/;

	  	if(file.match(reg)) {
			reader.readAsDataURL(input.files[0]);
		} else {
			alert("이미지 파일을 선택해주세요.");
		}
	}
	
}
</script>
</head>
<%
	String myId=(String)session.getAttribute("myId");
	String accId=(String)session.getAttribute("accId");
	String loginOk=(String)session.getAttribute("loginOk");
%>
<body>
<%
	if(loginOk!=null) {
%>
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
	
	<form action="Mung/mungPostAddAction.jsp" method="post" enctype="multipart/form-data" id="mung__addForm">
		<ul class="mung__img">
			<li>
				<input type="file" name="photo1" onchange="readUrl(this,1,this.value)">
				<div class="mung__img-container">
					<img class="mung__preview" id="preview1" src="">
				</div>	
				<button type="button" id="mung__delBtn1" class="mung__del-btn">삭제</button>
			</li>
			<li>
				<input type="file" name="photo2" onchange="readUrl(this,2,this.value)">
				<div class="mung__img-container">
					<img class="mung__preview" id="preview2" src="">
				</div>	
				<button type="button" id="mung__delBtn2" class="mung__del-btn">삭제</button>
			</li>
			<li>
				<input type="file" name="photo3" onchange="readUrl(this,3,this.value)">
				<div class="mung__img-container">
					<img class="mung__preview" id="preview3" src="">
				</div>	
				<button type="button" id="mung__delBtn3" class="mung__del-btn">삭제</button>	
			</li>
			<li>	
				<input type="file" name="photo4" onchange="readUrl(this,4,this.value)">
				<div class="mung__img-container">
					<img class="mung__preview" id="preview4" src="">
				</div>	
				<button type="button" id="mung__delBtn4" class="mung__del-btn">삭제</button>
			</li>
			<li>
				<input type="file" name="photo5" onchange="readUrl(this,5,this.value)" >
				<div class="mung__img-container">
					<img class="mung__preview" id="preview5" src="">
				</div>	
				<button type="button" id="mung__delBtn5" class="mung__del-btn">삭제</button>
			</li>
		</ul>
		<textarea class="mung__content" name="content" required="required"></textarea>
		<input type="text" placeholder="태그입력후 엔터" name="tag" class="form-control" id="mung__tag">
		<button type="submit" id="mung__addBtn">등록</button>
	</form>
</div>	
<%
	}else {
%>
<script type="text/javascript">
	location.href="index.jsp?main=Mung/mungMain.jsp";
</script>
<%
	}
%>
</body>
</html>