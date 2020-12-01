package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import data.dto.AdoptDto;
import data.dto.UserDto;
import mysql.db.MysqlConnect;

public class AdoptDao {
	MysqlConnect db=new MysqlConnect();
		
	//insert
	public void insertAdopt(AdoptDto dto)
	{
		String sql="insert into adopt (id,breed,age,gender,vaccine,content,photo,user_num,writeday) values (?,?,?,?,?,?,?,?,now())";
		Connection conn=null;
		PreparedStatement pstmt=null;
		conn=db.getMyConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, dto.getId());
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
				dto.setId(rs.getString("id"));
				dto.setWriteday(rs.getTimestamp("writeday"));
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
	/*public AdoptDto getData(String adopt_num)
	{
		AdoptDto dto=new AdoptDto();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select a.adopt_num, a.content, a.age, a.gender, a.breed, a.commt, a.photo ,a.likes, a.writeday, a.id ,b.id from adopt a, user_tb b where a.user_num=b.user_num and a.adopt_num=? ";
		//String sql="select * from adopt where adopt_num=?";
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
				dto.setId(rs.getString("id"));
				dto.setWriteday(rs.getTimestamp("writeday"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt, rs);
		}
		return dto;	
	}*/
	
	public List<HashMap<String, String>> getData(String adopt_num)
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
	}
	
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
			
}