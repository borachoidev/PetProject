package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.AccountDto;
import data.dto.MungCommentDto;
import data.dto.MungPostDto;
import data.dto.UserDto;
import mysql.db.MysqlConnect;

public class MungDao {
	MysqlConnect db=new MysqlConnect();
	
	//전체게시글 출력
	public List<MungPostDto> getAllPost() {
		List<MungPostDto> list=new ArrayList<MungPostDto>();
		String sql="select * from mung_post order by num desc";
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		conn=db.getMyConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				MungPostDto dto=new MungPostDto();
				
				dto.setPost_num(rs.getString("post_num"));
				dto.setPhoto(rs.getString("photo"));
				dto.setContent(rs.getString("content"));
				dto.setTag(rs.getString("tag"));
				dto.setLikes(rs.getInt("likes"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				dto.setDog_num(rs.getString("dog_num"));
				dto.setUser_num(rs.getString("user_num"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt, rs);
		}
		
		return list;
	}
	
	//계정별 게시글 출력
	public List<MungPostDto> getAccountPost(String acc_name) {
		List<MungPostDto> list=new ArrayList<MungPostDto>();
		String sql="select * from mung_post where acc_name=? order by num desc";
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		conn=db.getMyConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, acc_name);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				MungPostDto dto=new MungPostDto();
				
				dto.setPost_num(rs.getString("post_num"));
				dto.setPhoto(rs.getString("photo"));
				dto.setContent(rs.getString("content"));
				dto.setTag(rs.getString("tag"));
				dto.setLikes(rs.getInt("likes"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				dto.setDog_num(rs.getString("dog_num"));
				dto.setUser_num(rs.getString("user_num"));
				list.add(dto);
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt, rs);
		}
		
		return list;
	}
	
	
	//계정 데이터 출력
	public AccountDto getAccountData(String accId) {
		AccountDto dto=new AccountDto();
		String sql="select * from account_tb where acc_name=?";
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		conn=db.getMyConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "accId");
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto.setDog_num(rs.getString("dog_num"));
				dto.setAcc_name(rs.getString("acc_name"));
				dto.setBreed(rs.getString("breed"));
				dto.setWeight(rs.getString("weight"));
				dto.setAge(rs.getString("age"));
				dto.setGender(rs.getString("gender"));
				dto.setPhoto(rs.getString("photo"));
				dto.setMemo(rs.getString("memo"));
				dto.setUser_num(rs.getString("user_num"));
				dto.setSel_acc(rs.getInt("sel_acc"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt, rs);
		}
		
		return dto;
	}
	
	
	//게시글 추가
	public void insertPost(MungPostDto dto) {
		String sql="insert into mung_post (photo, content, tag, writeday, dog_num, user_num) values (?,?,?,now(),?,?)";
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		conn=db.getMyConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPhoto());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getTag());
			pstmt.setString(4, dto.getDog_num());
			pstmt.setString(5, dto.getUser_num());
			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt);
		}
	}
	
	
	//게시글 삭제
	public void deletePost(String post_num) {
		String sql="delete from mung_post where post_num=?";
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		conn=db.getMyConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, post_num);
			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt);
		}
	}
	
	
	//게시글별 댓글 리스트 출력
	public List<MungCommentDto> getCommentList(String comm_num) {
		List<MungCommentDto> list=new ArrayList<MungCommentDto>();
		String sql="select from mung_comment where comm_num=? order by idx desc";
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		conn=db.getMyConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, comm_num);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				MungCommentDto dto=new MungCommentDto();
				
				dto.setIdx(rs.getString("idx"));
				dto.setComm_num(rs.getString("comm_num"));
				dto.setContent(rs.getString("content"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt, rs);
		}
		
		return list;
	}
	
	
	//댓글 추가
	public void insertComment(MungCommentDto dto) {
		String sql="insert into mung_comment (comm_num, content, writeday, dog_num) values (?,?,?,now(),?)";
			
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		conn=db.getMyConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getComm_num());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getDog_num());
			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt);
		}
	}
	
	
	//댓글 삭제
	public void deleteComment(String idx) {
		String sql="delete from mung_comment where idx=?";
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		conn=db.getMyConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, idx);
			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt);
		}
	}
	
	//user_num 값 얻기
	public String getUser(String myId) {
		String sql="select user_num from user_tb where id=?";
		String user_num="";
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		conn=db.getMyConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, myId);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				user_num=rs.getString("user_num");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt, rs);
		}
		
		return user_num;
	}
	
	//acc_num 값 얻기
	public String getAccount(String accId) {
		String sql="select dog_num from account_tb where acc_name=?";
		String dog_num="";
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		conn=db.getMyConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, accId);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dog_num=rs.getString("dog_num");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt, rs);
		}
		
		return dog_num;
	}
	
}
