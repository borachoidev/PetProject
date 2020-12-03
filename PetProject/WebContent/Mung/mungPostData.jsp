<%@page import="data.dto.MungCommentDto"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="data.dto.AccountDto"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dto.MungPostDto"%>
<%@page import="data.dao.MungDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String post_num=request.getParameter("post_num");
	
	MungDao dao=new MungDao();
	
	//해당 게시글 정보 출력
	MungPostDto dto=dao.getPostData(post_num);
	String postProfile=dao.getAccProfile(dto.getDog_num());
	String postAccId=dao.getAccountId(dto.getDog_num());
	String postUserId=dao.getUserId(dto.getUser_num());
	List<MungCommentDto> commList=dao.getCommentList(post_num);
	
	JSONObject ob=new JSONObject();
	ob.put("post_num", dto.getPost_num());
	ob.put("photo", dto.getPhoto());
	ob.put("content", dto.getContent());
	ob.put("tag", dto.getTag());
	String likes=Integer.toString(dto.getLikes());
	ob.put("likes", likes);
	ob.put("writeday", dto.getWriteday());
	ob.put("dog_num", dto.getDog_num());
	ob.put("user_num", dto.getUser_num());
	ob.put("postUserId", postUserId);
	ob.put("postAccId", postAccId);
	ob.put("postProfile", postProfile);
	
	JSONArray jArray = new JSONArray();
	for(int i=0; i<commList.size(); i++) {
		JSONObject arrOb=new JSONObject();
		arrOb.put("idx", commList.get(i).getIdx());
		arrOb.put("content", commList.get(i).getContent());
		arrOb.put("writeday", commList.get(i).getWriteday());
		String commProfile=dao.getAccProfile(commList.get(i).getDog_num());
		arrOb.put("commProfile", commProfile);
		jArray.add(arrOb);
	}
	ob.put("commList", jArray);
	
%>
<%=ob.toString()%>