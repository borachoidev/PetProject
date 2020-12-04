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
/* bg-dark text-white */
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
	max-width: 86.5%;
	margin: 2% 13.5% 5% 13.5%;
	padding: 0 1.5%;
}

.mung__nav__acc {
	width: 30%;
}

.mung__add-btn {
	font-size: 1.5em;
}

.mung__add-btn:hover {
	color: #ffc107;
}

.mung__nav__search {
	width: 40%;
	text-align: center;
}

.mung__nav__btn {
	width: 30%;
	text-align: right;
}

.mung__nav__btn a {
	font-size: 1.5em;
	margin: 2% 0.5em;
}

.mung__nav__btn a:hover {
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

.mung__acc-btn:hover {
	color: #ffc107;
}

.mung__accId:hover {
	cursor: pointer;
	color: #ffc107;
}
	

/* 메인컨텐츠 */
.mung__post-list{
	max-width: 86.5%;
	text-align: center;
	margin: 0 13.5%;
}


/* 카드이미지*/
.mung__post-img {
	border-style: none;
	border-radius: 0;
	margin: 0;
	z-index: 1;
}

/* 카드이미지-마우스오버시 추가할 효과*/
.mung__post-img__hover {
	opacity: 0.3;
}

/* 카드이미지 박스 */
.mung__img-box {
    overflow: hidden;
    border-style: none;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    border-radius: 0;
    margin: 0;
    z-index: 10;
}

.card {
	border-style: none;
}

/* 카드이미지 박스-마우스오버시 추가할 효과 */
.mung__img-box__hover {
    background-color: black;
    color: white;
}

/* 카드텍스트 */
.mung__post-text {
	display: none;
}

/* 카드텍스트-마우스오버시 적용할 효과 */
.mung__post-text__hover {
	text-align: center;
	padding:8rem 0;
	
}

.card-img-overlay {
	padding: 0;
}

.mung__post__icon {
	margin-left: 10px;
}

/* 로그인한 계정 프로필, 게시글작성한 계정 프로필 */
.mung__profile {
	width: 40px;
	height: 40px;
	border-radius: 40px;
	margin: 0 1%;
	border: 1px solid #ddd;
	padding: 0.08em;
}
     
/* 게시글에 댓글작성한 계정 프로필 */     
.mung__profile-sm {
	width: 30px;
	height: 30px;
	border-radius: 30px;
	margin: 0 1%;
	border: 1px solid #ddd;
	padding: 0.08em;
}

.mung__post-modal {
	min-width: 100%; 
	height: 100%;
	margin: 3.5% 0;
}

/* 모달 (모달dialog, 모달content) */
.modal-size {
	min-width: 60%; 
	min-height: 50%;
	display: flex;
	overflow: hidden;
	align-items: center;
    justify-content: center;
    border: 0;
}     

/* 모달 바디 */
div.mung__post__modal {
	padding: 0;
	min-width: 60%; 
	min-height: 50%;
	display: flex;
	overflow: hidden;
	align-items: center;
    justify-content: center;
}


.mung__modal__img {
	padding-right: 0;
	display: flex;
	justify-content: center;
	align-items: center; 
	background-color: #121212;
	height: 100%;
}

.mung__modal__text {
	padding-left:0 ;
	display: flex;
	justify-content: flex-start;
	flex-direction: column;	
	max-height: 100%;
}

/* 모달 텍스트 헤더 */
.mung__modal__acc {
	display: flex;
	justify-content: space-between;
	width: 100%;
	padding: 1.2em 0.8em; 
	border-bottom: 1px solid #ddd;
	margin: 0;
}

/* 계정아이디 */
.mung__modal__moveAcc {
	width: 100%;
	height: 20%;
}

.mung__modal__textBox {
	width: 100%;
	height: 60%;
	border-bottom: 1px solid #ddd;
	padding: 0 0.8em;
	overflow-y: auto;
	overflow-x: hidden;
	align: top;
}

/* 컨텐츠 */
#mung__modal__content {
	margin: 1em 0 0 1em;
	white-space: pre-wrap;
}

/* 태그 목록 */
#mung__modal__tag {
	margin: 1em 0 0 1em;
}

/* 태그 */
.mung__modal__tag:hover {
	cursor: pointer;
	opacity: 0.5;
}

/* 댓글 목록 */
#mung__modal__comment {
	margin: 1.5em 0 0 0;
	psdding: 0 0.8em;
	width: 90%;
}

.mung__comm-list {
	display: flex;
	justify-content: flex-start;
	flex-direction: row;
	flex-wrap: nowrap;
	padding: 1em 0 0;
	width: 100%;
}

/* 텍스트박스 댓글내용(스크롤) */
.mung__modal__content-box {
	white-space: pre-wrap;
	font-size: 0.9em;
	width: 100%;
	margin-left: 1em;
}

.mung__modal__content {
	white-space: pre-wrap;
	font-size: 0.9em;
	width: 80%;
}

/* 좋아요 */
.mung__modal_likes {
	width: 100%;
	height: 10%;
	border-bottom: 1px solid #ddd;
	padding: 1% 1em;
	align-items: center;
}

/* 작성일 */
#mung__postDay{
	font-size: 0.8em;
}

.mung__comm-writeday {
	font-size: 0.8em;
}

/* 댓글입력 */
.mung__modal__addComm {
	height: 10%;
	display: flex;
	justify-content: flex-start;
	align-items: center;
	flex-direction: row;
	flex-wrap: nowrap;
	padding: 0.5em 1em;
}

/* 댓글입력창 */
#mung__modal__inputComm {
	width: 80%;
	font-size: 1em;
	border: 0;
	display: inline-flex;
	background-color:transparent;
}

#mung__modal__inputComm:focus {
	outline: none;
	box-shadow: 0;
}

/* 댓글전송 버튼 */
#mung__modal__submitBtn {
	width: 20%;
	background: none;
	border: none;
	font-size: 0.9em;
	display: inline-flex;
	margin-left: 1em;
	white-space: nowrap;
}

/* 검색창 */
#mung__searchTag {
	width: 100%;
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

/* 모달창 close */
.mung__close-btn {
	font-size: 1em;
	color: white;
	cursor: pointer;
}

/* 게시글 삭제버튼 */
#mung__delPost:hover {
	cursor: pointer;
	color: #9a0007;
}


</style>
<script type="text/javascript">
$(function() {
	//게시글 클릭시 모달창 오픈
	//모달창 열릴 경우 이벤트
	$("#exampleModal").on("show.bs.modal",function(e) {
		//클릭한 게시글 post_num
		var post_num=$(e.relatedTarget).data("num");
		$.ajax({
			type:"post",
			url:"Mung/mungPostData.jsp",
			data:{"post_num":post_num},
			datatype:'json',
			success:function(data) {
				//json파싱
				json=JSON.parse(data);
				
				//json으로부터 받아올 데이터 변수
				var photo=json.photo.split(',');
				var content=json.content;
				var tag=json.tag.split("#");
				var writeday=json.writeday;
				var likes=json.likes;
				var postUserId=json.postUserId;
				var postAccId=json.postAccId;
				var postProfile=json.postProfile;
				var commList=json.commList;
				
				/* 사진 캐러셀 */
				//게시글 당 불러올 사진 개수
				var img_idx=photo.length-1;
				//캐러셀 추가할 이미지
				var src="mungSave/"+photo[img_idx];
				//캐러셀 이미지에 들어갈 코드
				var s1="";
				s1+="<div class='carousel-item active'>";
				s1+="<img src='"+src+"' class='d-block w-100'>";
				s1+="</div>";
				//사진이 2장이상일 경우 사진개수만큼 코드 생성
				if(img_idx>0) {
					for(var i=img_idx-1; i>=0; i--) {
						src="mungSave/"+photo[i];
						s1+="<div class='carousel-item'>";
						s1+="<img src='"+src+"' class='d-block w-100'>";
						s1+="</div>";
					}    
				}
				//코드 추가
				$("#slideImg").html(s1);
				//캐러셀 이미지 위치 표시를 위한 코드
				var s2="";
				s2+="<li data-target='#carouselExampleIndicators' data-slide-to='0' class='active'></li>";
				//사진이 2장이상일 경우 사진개수만큼 코드 생성
				if(img_idx>0) {
					for(var i=1; i<=img_idx; i++) {
						src="mungSave/"+photo[i];
						s2+="<li data-target='##carouselExampleIndicators' data-slide-to='"+i+"'></li>";
					}    
				}
				//코드 추가
				$("#slideIdx").html(s2);
				//캐러셀 실행 및 자동 슬라이드 기능 해제
				$('.carousel').carousel('pause');
				
				/* 텍스트 */
	        	//게시글 작성한 계정정보
	        	$("#mung__post__profile").attr("src","AccSave/"+postProfile);
	        	$("#mung__post__id").text(postAccId+' ('+postUserId+')');
				
	        	//게시글 삭제 버튼(작성자에게만 출력)
	        	var accId=$("#mung__delPost").attr("accId");
				if(accId==postAccId) {
		        	var del_html="";
					del_html+="<svg width='1em' height='1em' viewBox='0 0 16 16' class='bi bi-trash' fill='currentColor' xmlns='http://www.w3.org/2000/svg'>";
					del_html+="<path d='M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z'/>";
					del_html+="<path fill-rule='evenodd' d='M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z'/>";
					del_html+="</svg>";
		        	$("#mung__delPost").html(del_html);
				}				
	        	
	        	//게시글 삭제버튼 이벤트
	        	$("#mung__delPost").click(function() {
	        		var result=confirm('해당 게시글을 삭제하시겠습니까?');
	        		if(result) {
	        			location.href="index.jsp?main=Mung/mungPostDelAction.jsp?post_num="+post_num;
	        		}
	        	});
	        	
	        	//게시글 내용
	        	$("#mung__modal__content").html(content);
	        	
	        	var tagList="";
	        	var tag_len=tag.length;
	        	for(var i=1; i<tag_len; i++) {
	        		tagList+="<span class='mung__modal__tag text-primary'>#"+tag[i]+"</span>";
	        	}
	        	$("#mung__modal__tag").html(tagList);
	        	
	        	
	        	//댓글 목록(댓글 추가 후 목록 새로고침 되도록 ajax로 처리)
	        	getCommList(post_num);
	        	
	        	//게시글 좋아요(클릭시 개수 업데이트)
	        	getLikes(post_num);
	        	
	        	//게시글 좋아요 클릭이벤트
	        	$("#mung__likesIcon").click(function() {
	        		var heart=$(this).attr("class");
	        		
	        		if(heart=="empty") {
	        			plusLikes(post_num);
	        			$(this).removeClass("empty").addClass("text-danger");
	        			var fill="<svg width='1em' height='1em' viewBox='0 0 16 16' class='bi bi-heart-fill' fill='currentColor' xmlns='http://www.w3.org/2000/svg'>";
	        			fill+="<path fill-rule='evenodd' d='M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z'/>";
	        			fill+="</svg>";
	        			$(this).html(fill);
	        			getLikes(post_num);
	        		}
	        		
	        		if(heart!="empty") {
	        			minusLikes(post_num);
	        			$(this).addClass("empty").removeClass("text-danger");
	        			var empty="<svg width='1em' height='1em' viewBox='0 0 16 16' class='bi bi-heart' fill='currentColor' xmlns='http://www.w3.org/2000/svg'>";
						empty+="<path fill-rule='evenodd' d='M8 2.748l-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z'/>";
						empty+="</svg>";
	        			$(this).html(empty);
	        			getLikes(post_num);
	        		}
	        		
	        	});
	        	
	        	//작성일 출력
	        	$("#mung__postDay").text(writeday);
	        	
				//댓글 추가 버튼 이벤트
				$("#mung__modal__submitBtn").click(function() {
					var content=$("#mung__modal__inputComm").val();
					var dog_num=$("#mung__modal__commNum").val();
					
					if(content!='') {
						insertComm(post_num, content, dog_num);
						$("#mung__modal__inputComm").val("");
					}else {
						alert('내용을 입력해주세요!')
					}
				});
				
				//댓글 추가 엔터키 이벤트
				$("#mung__modal__inputComm").keydown(function(key) {
					if(key.keyCode==13) {
						var content=$(this).val();
						var dog_num=$("#mung__modal__commNum").val();
						
						if(content!='') {
							insertComm(post_num, content, dog_num);
							$("#mung__modal__inputComm").val("");
						}else {
							alert('내용을 입력해주세요!')
						}
					}
				});
				
			},error:function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    }
		});
	});
	
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
	
	//카드이미지 마우스오버 이벤트
	$(".mung__post-img").hover(function() {
		$(this).addClass("mung__post-img__hover");
		$(".mung__img-box").addClass("mung__img-box__hover");
		$(".mung__post-text").addClass("mung__post-text__hover").removeClass("mung__post-text");
	},function() {
		$(this).removeClass("mung__post-img__hover");
		$(".mung__img-box").removeClass("mung__img-box__hover");
		$(".mung__post-text__hover").removeClass("mung__post-text__hover").addClass("mung__post-text");
	});
	
	//태그 검색 후 엔터키 이벤트
	$("#mung__searchTag").keydown(function(key) {
		if (key.keyCode==13) {
			var tag=$(this).val();
			location.href="index.jsp?main=Mung/mungSearch.jsp?tag="+tag;
		}
	});
	
	//게시글의 태그 클릭시 이벤트
	$(document).on("click",".mung__modal__tag",function() {
		var tag=$(this).text().replace("#","");
		location.href="index.jsp?main=Mung/mungSearch.jsp?tag="+tag;
	});
	
	//댓글창 입력시 이벤트
	$("#mung__modal__inputComm").keydown(function() {
		$("#mung__modal__submitBtn").removeClass("text-muted").css("color","#ffc107");
		if($("#mung__modal__inputComm").val()=='') {
			$(this).next().css("color","").addClass("text-muted");
		}
	});
	
	//모달창 닫힐 때 모달창 내의 데이터 초기화
	$('#exampleModal').on('hidden.bs.modal', function () {
		location.reload();
	});
	
	
});


//숫자 포매팅 함수
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

//게시글 좋아요 출력
function getLikes(post_num) {
	$.ajax({
		type:"get",
		url:"Mung/mungPostData.jsp",
		data:{"post_num":post_num},
		datatype:'json',
		success:function(data) {
			//json파싱
			json=JSON.parse(data);
			//좋아요 개수 출력
			var likes=json.likes;
			//포맷
			likes=numberWithCommas(likes);
			$("#mung__modal__likes").html("좋아요&nbsp;"+likes+"개");
		}	
	});
}

//게시글 좋아요 +1
function plusLikes(post_num) {
	$.ajax({
		type:"get",
		url:"Mung/mungLikesPlus.jsp",
		data:{"post_num":post_num},
		datatype:'html',
		success:function(data) {
			getLikes(post_num);
		}
	});
}
	
//게시글 좋아요 -1
function minusLikes(post_num) {
	$.ajax({
		type:"get",
		url:"Mung/mungLikesCancel.jsp",
		data:{"post_num":post_num},
		datatype:'html',
		success:function(data) {
			getLikes(post_num);
		}
	});	
}

//댓글 목록 출력
function getCommList(post_num) {
	$.ajax({
		type:"post",
		url:"Mung/mungPostData.jsp",
		data:{"post_num":post_num},
		datatype:'json',
		success:function(data) {
			//json파싱
			json=JSON.parse(data);
			//댓글목록 초기화
			$("#mung__modal__comment").html("");
			//댓글 목록 출력
			var commList=json.commList;
			var comm="";
        	$.each(commList,function(i,item) {
        		comm="<li class='mung__comm-list'><img style='vertical-align: top;' class='mung__profile-sm' idx="+item.idx+" src=AccSave/"+item.commProfile+">";
        		comm+="<ul class='mung__modal__content-box'><li class='mung__modal__content'>"+item.content+"</li>";
        		comm+="<ln class='mung__comm-writeday text-secondary'>"+item.writeday+"</ln></ul></li>";
	        	$("#mung__modal__comment").append(comm);
			});
		}	
	});
}

//댓글 추가
function insertComm(comm_num,content,dog_num) {
	$.ajax({
		type:"post",
		url:"Mung/mungCommAddAction.jsp",
		data:{"comm_num":comm_num,"content":content,"dog_num":dog_num},
		datatype:'html',
		success:function(data) {
			getCommList(comm_num);
		}	
	});
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
	//해당계정 게시글목록 출력
	List<MungPostDto> postList=dao.getAccountPost(dog_num);
%>
<body>
<div id="mumg__container">
	<!-- 멍스타그램 네비바 -->
	<ul id="mung__nav">
		<!-- 로그인한 계정 정보 -->
<%
		if(loginOk!=null && accId!="no") {
%>		
		<li class="mung__nav__acc">
			<a href="index.jsp?main=Mung/mungAccount.jsp">
				<img class="mung__profile" src="AccSave/<%=accDto.getPhoto()%>">
				<b><%=accId %>(<%=myId %>)</b>
			</a>
			<a class="mung__add-btn" href="index.jsp?main=Mung/mungPostAdd.jsp">
				<svg class="mung__post__icon" width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-plus-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
				  <path fill-rule="evenodd" d="M14 1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
				  <path fill-rule="evenodd" d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
				</svg>
			</a>
		</li>
		<!-- 검색창 -->
		<li class="mung__nav__search">
			<input type="text" id="mung__searchTag"  placeholder="#     검색">
		</li>
		<!-- 메뉴 버튼 -->
		<li class="mung__nav__btn">
			<a href="index.jsp?main=Mung/mungMain.jsp">
				<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-house-door" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
				  <path fill-rule="evenodd" d="M7.646 1.146a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 .146.354v7a.5.5 0 0 1-.5.5H9.5a.5.5 0 0 1-.5-.5v-4H7v4a.5.5 0 0 1-.5.5H2a.5.5 0 0 1-.5-.5v-7a.5.5 0 0 1 .146-.354l6-6zM2.5 7.707V14H6v-4a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 .5.5v4h3.5V7.707L8 2.207l-5.5 5.5z"/>
				  <path fill-rule="evenodd" d="M13 2.5V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"/>
				</svg>
			</a>
			<a href="index.jsp?main=Mung/mungChat.jsp">
				<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-cursor" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
				  <path fill-rule="evenodd" d="M14.082 2.182a.5.5 0 0 1 .103.557L8.528 15.467a.5.5 0 0 1-.917-.007L5.57 10.694.803 8.652a.5.5 0 0 1-.006-.916l12.728-5.657a.5.5 0 0 1 .556.103zM2.25 8.184l3.897 1.67a.5.5 0 0 1 .262.263l1.67 3.897L12.743 3.52 2.25 8.184z"/>
				</svg>
			</a>
			<a id="mung__accListBtn" data-toggle="modal" data-target="#mung__accList">
				<svg class="mung__acc-btn" width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-repeat" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
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
		</li>
<%
		}
%>
	</ul>
	
<!-- 게시글 목록 카드이미지 -->
	<div class="mung__post-list">
		<div class="row row-cols-1 row-cols-md-3">
<%
		//전체 게시글리스트에서 데이터 꺼내기
		
		//case1.게시글 1개 
		if(postList.size()==1) {
			
			for(MungPostDto dto:postList) {
				//계정별 게시글 전체 목록에서 필요한 데이터 변수
				int idx=dto.getPhoto().split(",").length-1;
				String photo=dto.getPhoto().split(",")[idx];
				DecimalFormat df=new DecimalFormat("#,###,###");
				DecimalFormat bdf=new DecimalFormat("#,###.#");
				int likes=dto.getLikes();
				int commSize=dao.getCommentSize(dto.getPost_num());
				String likes_str="";
				String commSize_str="";
				if(likes>=1000) {
					likes_str=bdf.format((double)likes/1000)+"천";
				}else {
					likes_str=df.format(likes);
				}
				if(commSize>=1000) {
					commSize_str=bdf.format(commSize);
				}else {
					commSize_str=df.format(commSize);
				}
				
%>
			<div class="col mb-4" data-toggle="modal" data-target="#exampleModal" data-num="<%=dto.getPost_num()%>"> 
			    <div class="card text-center mung__img-box">
			      <img src="mungSave/<%=photo %>" class="card-img mung__post-img">
			      <div class="card-img-overlay">
				    <p class="card-text mung__post-text">
						<svg class="mung__post__icon" width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-heart-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
						  <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
						</svg>
						<span><%=likes_str %></span>
				    	<svg class="mung__post__icon" width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chat-right-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
						  <path fill-rule="evenodd" d="M14 0a2 2 0 0 1 2 2v12.793a.5.5 0 0 1-.854.353l-2.853-2.853a1 1 0 0 0-.707-.293H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12z"/>
						</svg>
				    	<span><%=commSize_str %></span>
					</p>
				  </div>
			    </div>
			</div>
<%
			}
%>			
			<div class="col md-1"> 
			    <div class="card">
			      <img src="" class="card-img">
			      
			    </div>
			</div>
			<div class="col md-1"> 
			    <div class="card">
			      <img src="" class="card-img">
			      
			    </div>
			</div>
<%		
		//case2.게시글 2개 
		}else if(postList.size()==2) {
			for(MungPostDto dto:postList) {
				//계정별 게시글 전체 목록에서 필요한 데이터 변수
				int idx=dto.getPhoto().split(",").length-1;
				String photo=dto.getPhoto().split(",")[idx];
				DecimalFormat df=new DecimalFormat("#,###,###");
				DecimalFormat bdf=new DecimalFormat("#,###.#");
				int likes=dto.getLikes();
				int commSize=dao.getCommentSize(dto.getPost_num());
				String likes_str="";
				String commSize_str="";
				if(likes>=1000) {
					likes_str=bdf.format((double)likes/1000)+"천";
				}else {
					likes_str=df.format(likes);
				}
				if(commSize>=1000) {
					commSize_str=bdf.format(commSize);
				}else {
					commSize_str=df.format(commSize);
				}
			
%>
			<div class="col mb-4" data-toggle="modal" data-target="#exampleModal" data-num="<%=dto.getPost_num()%>"> 
			    <div class="card text-center mung__img-box">
			      <img src="mungSave/<%=photo %>" class="card-img mung__post-img">
			      <div class="card-img-overlay">
				    <p class="card-text mung__post-text">
						<svg class="mung__post__icon" width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-heart-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
						  <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
						</svg>
						<span><%=likes_str %></span>
				    	<svg class="mung__post__icon" width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chat-right-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
						  <path fill-rule="evenodd" d="M14 0a2 2 0 0 1 2 2v12.793a.5.5 0 0 1-.854.353l-2.853-2.853a1 1 0 0 0-.707-.293H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12z"/>
						</svg>
				    	<span><%=commSize_str %></span>
					</p>
				  </div>
			    </div>
			</div>
<%
			}
%>		
			<div class="col md-1" > 
			    <div class="card" style="border-style: none;">
			      <img src="" class="card-img">
			    </div>
			</div>
<%	
		//case2.게시글 3개 이상
		}else {
			for(MungPostDto dto:postList) {
				//계정별 게시글 전체 목록에서 필요한 데이터 변수
				int idx=dto.getPhoto().split(",").length-1;
				String photo=dto.getPhoto().split(",")[idx];
				DecimalFormat df=new DecimalFormat("#,###,###");
				DecimalFormat bdf=new DecimalFormat("#,###.#");
				int likes=dto.getLikes();
				int commSize=dao.getCommentSize(dto.getPost_num());
				String likes_str="";
				String commSize_str="";
				if(likes>=1000) {
					likes_str=bdf.format((double)likes/1000)+"천";
				}else {
					likes_str=df.format(likes);
				}
				if(commSize>=1000) {
					commSize_str=bdf.format(commSize);
				}else {
					commSize_str=df.format(commSize);
				}
			
%>
			<div class="col mb-4" data-toggle="modal" data-target="#exampleModal" data-num="<%=dto.getPost_num()%>"> 
			    <div class="card text-center mung__img-box">
			      <img src="mungSave/<%=photo %>" class="card-img mung__post-img">
			      <div class="card-img-overlay">
				    <p class="card-text mung__post-text">
						<svg class="mung__post__icon" width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-heart-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
						  <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
						</svg>
						<span><%=likes_str %></span>
				    	<svg class="mung__post__icon" width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chat-right-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
						  <path fill-rule="evenodd" d="M14 0a2 2 0 0 1 2 2v12.793a.5.5 0 0 1-.854.353l-2.853-2.853a1 1 0 0 0-.707-.293H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12z"/>
						</svg>
				    	<span><%=commSize_str %></span>
					</p>
				  </div>
			    </div>
			</div>
<%			
			}
		}
%>		
		</div>	
	</div>
			
	<!-- 모달창 -->
	<div class="modal fade mung__post-modal" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="mung__modal__closeBtn">
      <span aria-hidden="true" class="mung__close-btn">&times;</span>
    </button>
	  <div class="modal-dialog modal-size modal-dialog-centered">
		<!-- close 버튼 -->	  
	    <!-- 모달창 컨텐츠 -->
	    <div class="modal-content modal-size">
	      <div class="modal-body mung__post__modal">
	       <div class="row">
		      <!-- 이미지영역 -->
     		 <div class="col mung__modal__img">
        		<%-- 캐러셀 --%>
				<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
				  <!-- Indicators -->
				  <ol class="carousel-indicators" id="slideIdx">
				    <%-- 모달창 오픈시 스크립트에서 추가될 부분 --%>
				  </ol>
				  <!-- Wrapper for slides -->
				  <div class="carousel-inner" role="listbox" id="slideImg">
					<%-- 모달창 오픈시 스크립트에서 추가될 부분 --%>
				  </div>
				  <!-- Controls -->
				 <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="sr-only">Previous</span>
				  </a>
				  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="sr-only">Next</span>
				  </a>
				</div>
        	</div>
        	<!-- 텍스트 영역 -->
	        <div class="mung__modal__text col-4">
	        	<!-- 게시글 작성한 계정 -->
	        	<ul class="mung__modal__acc">
	        		<!-- 프로필 -->
	        		<li class="mung__modal__moveAcc">
	        		 	<img id="mung__post__profile" class="mung__profile" src="">
						<b id="mung__post__id"></b>
	        		</li>
	        		<!-- 게시글 삭제버튼 -->
	        		<li id="mung__delPost" accId=<%=accId %>>
						<%-- 게시글 작성자일 경우에만 버튼 출력 --%>		
	        		</li>
	        	</ul>
	        	<div class="mung__modal__textBox">
		        	<!-- 게시글 내용 -->
		        	<article id="mung__modal__content"><%-- 게시글 내용 출력 --%></article>
		        	<div id="mung__modal__tag"><%-- 게시글 태그 출력 --%></div>
		        	<!-- 게시글 댓글 목록 -->
		        	<ul id="mung__modal__comment">
		        		<%-- 댓글 리스트 출력 --%>
		        	</ul>
		        </div>		
<%
				/* 로그인한 경우에만 좋아요 및 댓글작성 가능 */
				if(loginOk!=null && accId!="no") {
%>			        
		        	<!-- 게시글 좋아요/작성일 -->
		        	<div class="mung__modal_likes">
		        		<span id="mung__likesIcon" class="empty">
			        		<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-heart" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
							  <path fill-rule="evenodd" d="M8 2.748l-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
							</svg>
		        		</span>
		        		<b id="mung__modal__likes"><%-- 게시글 좋아요 개수 출력 --%></b>
		        		<div id="mung__postDay" class="text-secondary"></div>
		        	</div> 
		        	<!-- 게시글 댓글추가 -->
		        	<div class="mung__modal__addComm">
		        		<input type="hidden" id="mung__modal__commNum" value="<%=dog_num%>">
		        		<input type="text"  id="mung__modal__inputComm" placeholder="댓글 달기...">
		        		<button type="button" id="mung__modal__submitBtn" class="text-muted">게시</button>
		        	</div>
<%
				}else {
%>						
					<!-- 게시글 좋아요/작성일 -->
		        	<div class="mung__modal_likes">
		        		<b id="mung__modal__likes"><%-- 게시글 좋아요 개수 출력 --%></b>
		        		<div id="mung__postDay" class="text-secondary"></div>
		        	</div> 
<%
				}
%>		
	   		   </div>
	   	    </div> 
  		 </div>
 	  </div>
 	</div> 
 </div>	
</div>
</body>
</html>