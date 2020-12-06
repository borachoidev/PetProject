<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="<%=request.getContextPath()%>/se2/js/HuskyEZCreator.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=request.getContextPath()%>/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" type="text/javascript" charset="utf-8"></script>
<style type="text/css">

}

</style>
</head>

<body>
<%
String id=(String)session.getAttribute("myId");
String book_num=request.getParameter("book_num");
%>
<div>
<fieldset style="width: 800px;">
	<legend>리뷰 작성</legend>
	<form action="Review/formAction.jsp"
	  method="post" enctype="multipart/form-data"
	   name="f">
	 <table class="table">
	 	<tr>

	 		<td><input type="hidden" value="<%=book_num%>" name="book_num">
	 			<input type="text" class="all__form readonly"
	 			  style="width: 200px;" required="required"
	 			  name="id" value="<%=id%>" readonly>		 			  
	 		</td>
	 	</tr>
	 	<tr>
	 		
	 		<td>
	 			<input type="text" class="all__form"
	 			  style="width: 100%;" required="required"
	 			  name="title" placeholder="제목">		 			  
	 		</td>
	 	</tr>
	 	
	 	<tr>
	 		
	 		<td>
	 		  <textarea class="all__form"	 			 
	 			 style="width:100%; height:300px; display:none;"
	 			 name="content" id="content"></textarea>
	 	</tr>
	 	<tr>
	 		<td align="center">
	 			<button type="button"
	 			  style="width: 100px;"
	 			  onclick="submitContents(this)" class="button">리뷰작성</button>
	 			  
	 		</td>		 		
	 	</tr>
	 </table>	  
	</form>
</fieldset>
</div>

<script type="text/javascript">
var oEditors = [];

nhn.husky.EZCreator.createInIFrame({

    oAppRef: oEditors,

    elPlaceHolder: "content",

    sSkinURI: "<%=request.getContextPath()%>/se2/SmartEditor2Skin.html",

    fCreator: "createSEditor2"

}); 

//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.

function submitContents(elClickedObj) {

    // 에디터의 내용이 textarea에 적용된다.

    oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [ ]);

 

    // 에디터의 내용에 대한 값 검증은 이곳에서

    // document.getElementById("textAreaContent").value를 이용해서 처리한다.
    try {
        elClickedObj.form.submit();
    } catch(e) { 

    }

}

// textArea에 이미지 첨부

function pasteHTML(filepath){
    var sHTML = '<img src="<%=request.getContextPath()%>/save2/'+filepath+'">';
    
   console.log(sHTML);
    oEditors.getById["content"].exec("PASTE_HTML", [sHTML]); 

}
</script>
</body>
</html>
