package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import data.dto.AdoptCommentDto;
import data.dto.AdoptDto;
import data.dto.MungCommentDto;
import data.dto.UserDto;
import mysql.db.MysqlConnect;

public class AdoptDao {
	MysqlConnect db=new MysqlConnect();
		
	//insert
	public void insertAdopt(AdoptDto dto)
	{
		String sql="insert into adopt (adopt_name,breed,age,gender,vaccine,content,photo,user_num,writeday) values (?,?,?,?,?,?,?,?,now())";
		Connection conn=null;
		PreparedStatement pstmt=null;
		conn=db.getMyConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, dto.getAdopt_name());
			pstmt.setString(2, dto.getBreed());
			pstmt.setString(3, dto.getAge());
			pstmt.setString(4, dto.getGender());
			pstmt.setString(5, dto.getVaccine());
			pstmt.setString(6, dto.getContent());
			pstmt.setString(7, dto.getPhoto());
			pstmt.setString(8, dto.getUser_num());
			//실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt);
		}
		
	}

	

	//전체 강아지 데이터 가져오기
	public List<AdoptDto> getAlldogs(int start,int end)
	{
	
		List<AdoptDto>list=new ArrayList<AdoptDto>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql ="select * from adopt order by adopt_num desc "
				+ "limit ?,?";
		conn=db.getMyConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				AdoptDto dto=new AdoptDto();
				dto.setContent(rs.getString("content"));
				dto.setAdopt_num(rs.getString("adopt_num"));
				dto.setAge(rs.getString("age"));
				dto.setGender(rs.getString("gender"));
				dto.setBreed(rs.getString("breed"));
				dto.setVaccine(rs.getString("vaccine"));
				dto.setPhoto(rs.getString("photo"));
				dto.setAdopt_name(rs.getString("adopt_name"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				dto.setUser_num(rs.getString("user_num"));
				dto.setLikes(rs.getInt("likes"));
				list.add(dto);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt, rs);
		}
		return list;
						
	}
	
	//한개 데이타 가져오기
	public AdoptDto getData(String adopt_num)
	{
		AdoptDto dto=new AdoptDto();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		//String sql="select a.adopt_num, a.content, a.age, a.gender, a.breed, a.commt, a.photo ,a.likes, a.writeday, a.id ,b.id from adopt a, user_tb b where a.user_num=b.user_num and a.adopt_num=? ";
		String sql="select * from adopt where adopt_num=?";
		conn=db.getMyConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, adopt_num);
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				dto.setContent(rs.getString("content"));
				dto.setAdopt_num(rs.getString("adopt_num"));
				dto.setAge(rs.getString("age"));
				dto.setGender(rs.getString("gender"));
				dto.setBreed(rs.getString("breed"));
				dto.setVaccine(rs.getString("vaccine"));
				dto.setPhoto(rs.getString("photo"));
				dto.setAdopt_name(rs.getString("adopt_name"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				dto.setUser_num(rs.getString("user_num"));
				dto.setLikes(rs.getInt("likes"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt, rs);
		}
		return dto;	
	}
	
	/*public List<HashMap<String, String>> getData(String adopt_num)
	{
		String sql="select a.adopt_num, a.content, a.age, a.gender, a.breed, a.commt, a.photo ,a.likes, a.writeday, a.id ,b.id u_id from adopt a, user_tb b where a.user_num=b.user_num and a.adopt_num=? ";
		List<HashMap<String, String>> list=
				new ArrayList<HashMap<String,String>>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		conn=db.getMyConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, adopt_num);
		
			
			//실행
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				HashMap<String, String> map=new HashMap<String, String>();
				map.put("content", rs.getString("content"));
				map.put("adopt_num", rs.getString("adopt_num"));
				map.put("age", rs.getString("age"));
				map.put("gender", rs.getString("gender"));
				map.put("breed", rs.getString("breed"));
				map.put("vaccine", rs.getString("vaccine"));
				map.put("photo", rs.getString("photo"));
				map.put("id", rs.getString("id"));
				map.put("u_id", rs.getString("u_id"));
				map.put("photo", rs.getString("photo"));
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
				map.put("writeday", sdf.format(rs.getTimestamp("writeday")));
				//list 에 추가
				
				list.add(map);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt, rs);
		}
		return list;
	}*/
	
	//삭제
	public void deleteAdopt(String adopt_num)
	{
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql="delete from adopt where adopt_num=?";
		conn=db.getMyConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, adopt_num);
			//실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt);
		}
		
	}
	

	public int getTotalCount() {
		int n = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from adopt";
		conn = db.getMyConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				n = rs.getInt(1);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt, rs);
		}

		return n;
	}
	
	public void insertComment(AdoptCommentDto dto)
	{
		String sql="insert into adopt_comment (comm_num, id, content, writeday) values (?,?,?,now())";
			
		Connection conn=null;
		PreparedStatement pstmt=null;
		conn=db.getMyConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, dto.getComm_num());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getContent());
			//실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt);
		}
	}
	
	public List<AdoptCommentDto> getCommentList(String adopt_num)
	{
		System.out.println("1:"+adopt_num);
		List<AdoptCommentDto> list=new ArrayList<AdoptCommentDto>();
		String sql="select * from adopt_comment where comm_num=? order by idx desc";
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		conn=db.getMyConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, adopt_num);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				AdoptCommentDto dto=new AdoptCommentDto();
				
				dto.setIdx(rs.getString("idx"));
				dto.setComm_num(rs.getString("comm_num"));
				dto.setContent(rs.getString("content"));
				SimpleDateFormat sdf=new SimpleDateFormat("M월 d일"); 
				dto.setWriteday(sdf.format(rs.getTimestamp("writeday")));
				dto.setId(rs.getString("id"));
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt, rs);
		}
		
		return list;
	}
	
	public void deleteComment(String idx)
	{
		String sql="delete from adopt_comment where idx=?";
		Connection conn=null;
		PreparedStatement pstmt=null;
		conn=db.getMyConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, idx);;
			//실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt);
		}
	}
	
	public void updateAdopt(AdoptDto dto)
	{
		String sql="update adopt set age=?, gender=?, breed=?, vaccine=?, adopt_name=?, user_num=?, photo=?, content=? where adopt_num=?";
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		conn=db.getMyConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getPhoto());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getAdopt_num());
			pstmt.setString(4, dto.getAge());
			pstmt.setString(5, dto.getGender());
			pstmt.setString(6, dto.getBreed());
			pstmt.setString(7, dto.getVaccine());
			pstmt.setString(8, dto.getAdopt_name());
			pstmt.setString(9, dto.getUser_num());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt);
		}
		
	}
	
	public void adoptUpdateLikes(String adopt_num)
	{
		String sql="update adopt set likes=likes+1 where adopt_num=?";
		Connection conn=null;
		PreparedStatement pstmt=null;
		conn=db.getMyConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, adopt_num);
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt);
		}
		
	}
	
			
}