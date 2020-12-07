<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="data.dao.AccountDao"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="data.dto.AccountDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.MungDao"%>
<%@page import="data.dto.MungPostDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
<style type="text/css">
#mumg__container {
	width: 100%;
	font-size: 0.8em;
}

ul li {
	list-style: none;
}

/* 메뉴바 */
#mung__nav {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	align-items: center;
	max-width: 86.5%;
	margin: 2% 13.5% 5% 13.5%;
}

.mung__logo {
	width: 25%;
}

.mung__logo-img {
	width: 100%;
}

.mung__nav__search {
	width: 50%;
	max-height:70%;
	text-align: center;
}

#mung__searchTag {
	width: 50%;
	height:80%;
	border: 1px solid #ddd;
	outline: none;
	height: 100%; 
	border-radius: 10px;
	padding: 2% 5%;
	text-align: center;
}

#mung__searchTag:focus {
	box-shadow: 1px 1px .2em #ffc107, -1px -1px .2em #ffc107;
	background-color:transparent;
	caret-color: #ffc107;
	border-color: white;
}

.mung__nav__btn {
	width: 25%;
	text-align: right;
}

.mung__nav__btn a{
	font-size: 1.5em;
	margin: 2% 0.5em;
}

.mung__nav__btn a:hover {
	color: #ffc107;
}

#mung__accListBtn:hover {
	color: #ffc107;
}

.mung__acc-modal {
	width: 100%;
}

/* 계정목록 */
#mung__accList {
	text-align: center;
	width: 20%;
	margin: 0 40%;
}

.mung__accList {
	padding: 2% 0;
}

.mung__accList-content {
	border: none;
}

.mung__accId {
	padding: 5% 0;
	border-radius: 5px;
}

.mung__accId:hover {
	cursor: pointer;
	color: #ffc107;
}
	
.mung__post__icon {
	margin-left: 5%;
}

/* 계정전환목록 프로필 */
.mung__profile {
	width: 40px;
	height: 40px;
	border-radius: 40px;
	margin: 0 1%;
	border: 1px solid #ddd;
	padding: 0.08em;
}

/* 로그인한 계정 프로필 */
.mung__profile-sm {
	width: 30px;
	height: 30px;
	border-radius: 30px;
	margin: 0 1%;
	border: 1px solid #ddd;
	padding: 0.08em;
}
     
/* 게시글 추가폼 */     
.mung__add-form {
	width: 70%;
	margin: 0 15%;
	height: 60vh;
	align-content: center;
}

#mung__addForm {

}

.mung__add-box {
	width: 100%;
	height: 200px;
	display: flex;
	justify-content: center;
	flex-direction: row;
}

.mung__add-img {
	width: 160px;
	height: 160px;
	margin: 0 1%;
	text-align: center;
	border: 1px solid #ddd;
}


.mung__add-img input {
	display: none;
}

.mung__add-container {
	background-image: url('Image/favicon.png');
	background-repeat: no-repeat;
	background-position: center;
	background-size: 10%;
	width: 100%;
	height: 160px; 
	cursor: pointer;
}

.mung__preview {
	max-width: 100%;
}

.mung__del-btn {
	color: red;
}

.mung__add-text {
	display: flex;
	justify-content: flex-start;
	flex-direction: row;
	width: 80%;
	height: 40%;
	margin: 2% 10%;
}

.mung__add-content {
	width: 500px;
	height: 70px;
	resize: none;
	border: 2px solid #efefef;
	border-radius: 2px;
	padding: 1% 2%;
}

.mung__add-content:focus {
	outline: none;
	border: 2px solid #ffd479;
}

#mung__addTag {
	width: 500px;
	height: 35px;
	resize: none;
	padding: 1% 2%;
	border: 2px solid #efefef;
	border-radius: 2px;
}

#mung__addTag:focus {
	outline: none;
	border: 2px solid #ffd479;
}

#mung__addBtn {
	margin: 7% 0 0 10%;
	align-self: center;
	border: none;
	white-space: nowrap;
}
</style>
<script type="text/javascript">
$(function() {
	//계정 리스트 숨기기	
	$("#mung__accList").hide();
	
	//계정 전환 버튼이벤트
	$("#mung__accListBtn").click(function() {
		$("#mung__accList").toggle();	
	});
	 
	$(".mung__accId").click(function() {
		var accId=$(this).text();
		location.href="index.jsp?main=Mung/mungSession.jsp?accId="+accId;
	});
	
	//태그 검색 후 엔터키 이벤트
	$("#mung__searchTag").keydown(function(key) {
		if (key.keyCode==13) {
			var tag=$(this).val();
			location.href="index.jsp?main=Mung/mungSearch.jsp?tag="+tag;
		}
	});
	
	$(".mung__add-container").click(function() {
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
	
	//추가한이미지 삭제버튼 이벤트
	$(".mung__del-btn").click(function() {
		$(this).prev().find("img").attr("src","");
		$(this).hide();
	});
	
	//제출시 이미지파일 누락 또는 태그에 #이 빠진 경우
	$('#mung__addForm').submit(function() {
        if($('.mung__preview').attr("src")=='') {
            alert("사진을 1장 이상 등록해주세요");
            return false;
        }
        
        if($("#mung__addTag").val()!='') {
        	if(!$("#mung__addTag").val().match("#")) {
	        	alert("태그에 #을 붙여주세요.");
	            return false;
        	}
        }
	});
	
	//내용입력 시 등록버튼색 변경
	$(".mung__add-content").keydown(function() {
		$("#mung__addBtn").css("background-color","#ffd479");
		if($(this).val()=='') {
			$("#mung__addBtn").css("background-color","#efefef");
		}
	});
	
	//컨텐츠 글자수 제한
	$(".mung__add-content").keyup(function() {
		if($(this).val().length>255) {
			alert("입력가능한 글자수를 초과했습니다(최대255자)");
		}
	});

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
<%!
	String myId;
	String accId;
	String loginOk;
%>
<%	
	//인코딩
	request.setCharacterEncoding("utf-8");

	//로그인 상태 및 아이디 세션값
	myId=(String)session.getAttribute("myId");
	accId=(String)session.getAttribute("accId");
	loginOk=(String)session.getAttribute("loginOk");
	
	MungDao dao=new MungDao();
	//계정 정보 출력
	AccountDto accDto=dao.getAccountData(accId);
	String dog_num=dao.getAccount(accId);
	//계정리스트
	AccountDao accDao=new AccountDao();
	String user_num=dao.getUser(myId);
	List<AccountDto> accList=accDao.getAllAccounts(user_num);
	
%>
<body>
<div id="mumg__container">
	<!-- 멍스타그램 네비바 -->
	<ul id="mung__nav">
		<li class="mung__logo">
			<img src="Image/mung_logo.jpg" class="mung__logo-img">
		</li>
		<!-- 검색창 -->
		<li class="mung__nav__search">
			<input type="text" id="mung__searchTag"  placeholder="#     검색">
		</li>
		<!-- 메뉴 버튼 -->
		<!-- 로그인한 계정 정보 -->
		<li class="mung__nav__btn">
			<a href="index.jsp?main=Mung/mungMain.jsp">
				<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-house-door" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
				  <path fill-rule="evenodd" d="M7.646 1.146a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 .146.354v7a.5.5 0 0 1-.5.5H9.5a.5.5 0 0 1-.5-.5v-4H7v4a.5.5 0 0 1-.5.5H2a.5.5 0 0 1-.5-.5v-7a.5.5 0 0 1 .146-.354l6-6zM2.5 7.707V14H6v-4a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 .5.5v4h3.5V7.707L8 2.207l-5.5 5.5z"/>
				  <path fill-rule="evenodd" d="M13 2.5V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"/>
				</svg>
			</a>
<%
		if(loginOk!=null && accId!="no") {
%>				
			
			<a id="mung__accListBtn" data-toggle="modal" data-target="#mung__accList">
				<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-repeat" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
				  <path d="M11.534 7h3.932a.25.25 0 0 1 .192.41l-1.966 2.36a.25.25 0 0 1-.384 0l-1.966-2.36a.25.25 0 0 1 .192-.41zm-11 2h3.932a.25.25 0 0 0 .192-.41L2.692 6.23a.25.25 0 0 0-.384 0L.342 8.59A.25.25 0 0 0 .534 9z"/>
				  <path fill-rule="evenodd" d="M8 3c-1.552 0-2.94.707-3.857 1.818a.5.5 0 1 1-.771-.636A6.002 6.002 0 0 1 13.917 7H12.9A5.002 5.002 0 0 0 8 3zM3.1 9a5.002 5.002 0 0 0 8.757 2.182.5.5 0 1 1 .771.636A6.002 6.002 0 0 1 2.083 9H3.1z"/>
				</svg>
			</a>
			<div id="mung__accList" class="modal fade mung__acc-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				 <div class="modal-dialog modal-dialog-centered">
  					  <div class="modal-content mung__accList-content">
						<ul class="modal-body mung__accList">
						<%-- 계정 목록 출력 --%>
<%
						for(AccountDto acc:accList) {
%>
							<li class="mung__accId">
								<img class="mung__profile" src="AccSave/<%=acc.getPhoto()%>">
								<span id="mung__accId"><%=acc.getAcc_name() %></span>
							</li>
<%				
						}
%>					
						</ul>
					</div>
				 	  <button type="button" class="close mung__close-btn" data-dismiss="modal" aria-label="Close">
			             <span aria-hidden="true">&times;</span>
			          </button>
				</div>
			</div>		
			<a href="index.jsp?main=Mung/mungAccount.jsp">
				<img class="mung__profile-sm" src="AccSave/<%=accDto.getPhoto()%>">
			</a>
<%
		}
%>
		</li>
	</ul>
	
	<!-- 게시글 작성 폼 -->
	<div class="mung__add-form" >
		<form action="Mung/mungPostAddAction.jsp" method="post" enctype="multipart/form-data" id="mung__addForm">
			<ul class="mung__add-box">
				<li class="mung__add-img" style="border-color: #ffd479;" title="여기에 첫번째 사진을 등록해주세요">
					<input type="file" name="photo1" onchange="readUrl(this,1,this.value)">
					<div class="mung__add-container">
						<img class="mung__preview" id="preview1" src="">
					</div>	
					<svg id="mung__delBtn1" width="1em" height="1em" viewBox="0 0 16 16" class="mung__del-btn" bi bi-dash-circle-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
					  <path fill-rule="evenodd" d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM4.5 7.5a.5.5 0 0 0 0 1h7a.5.5 0 0 0 0-1h-7z"/>
					</svg>
				</li>
				<li class="mung__add-img">
					<input type="file" name="photo2" onchange="readUrl(this,2,this.value)">
					<div class="mung__add-container">
						<img class="mung__preview" id="preview2" src="">
					</div>	
					<svg id="mung__delBtn2" width="1em" height="1em" viewBox="0 0 16 16" class="mung__del-btn" bi bi-dash-circle-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
					  <path fill-rule="evenodd" d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM4.5 7.5a.5.5 0 0 0 0 1h7a.5.5 0 0 0 0-1h-7z"/>
					</svg>
				</li>
				<li class="mung__add-img">
					<input type="file" name="photo3" onchange="readUrl(this,3,this.value)">
					<div class="mung__add-container">
						<img class="mung__preview" id="preview3" src="">
					</div>	
					<svg id="mung__delBtn3" width="1em" height="1em" viewBox="0 0 16 16" class="mung__del-btn" bi bi-dash-circle-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
					  <path fill-rule="evenodd" d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM4.5 7.5a.5.5 0 0 0 0 1h7a.5.5 0 0 0 0-1h-7z"/>
					</svg>
				</li>
				<li class="mung__add-img">	
					<input type="file" name="photo4" onchange="readUrl(this,4,this.value)">
					<div class="mung__add-container">
						<img class="mung__preview" id="preview4" src="">
					</div>	
					<svg id="mung__delBtn4" width="1em" height="1em" viewBox="0 0 16 16" class="mung__del-btn" bi bi-dash-circle-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
					  <path fill-rule="evenodd" d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM4.5 7.5a.5.5 0 0 0 0 1h7a.5.5 0 0 0 0-1h-7z"/>
					</svg>
				</li>
				<li class="mung__add-img">
					<input type="file" name="photo5" onchange="readUrl(this,5,this.value)" >
					<div class="mung__add-container">
						<img class="mung__preview" id="preview5" src="">
					</div>	
						<svg id="mung__delBtn5" width="1em" height="1em" viewBox="0 0 16 16" class="mung__del-btn" bi bi-dash-circle-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
					  <path fill-rule="evenodd" d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM4.5 7.5a.5.5 0 0 0 0 1h7a.5.5 0 0 0 0-1h-7z"/>
					</svg>
				</li>
			</ul>
			<article class="mung__add-text">
				<div>
					<label>Content</label><br>
					<textarea class="mung__add-content" name="content" required="required"></textarea><br><br>
					<label>Tag</label><br>
					<textarea type="text" placeholder="단어 앞에 #를 붙여주세요" name="tag" id="mung__addTag"></textarea>
				</div>
				<button type="submit" id="mung__addBtn">게시글 등록</button>		
			</article>
		</form>
	</div>
</div>
</body>
</html>