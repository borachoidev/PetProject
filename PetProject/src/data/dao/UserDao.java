package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.UserDto;
import data.dto.UserDto2;
import mysql.db.MysqlConnect;



public class UserDao {
	MysqlConnect db=new MysqlConnect();

	// 아이디가 있으면 true 반환 ,없으면 false반환
	public boolean isIdSearch(String id)
	{
		boolean find = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from user_tb where id=?";
		conn = db.getMyConnection();
	

		try
		{
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next())
			{
				find = true;
			}

		} catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally
		{
			db.dbClose(conn, pstmt, rs);
		}

		return find;
	}
	
	
	//회원가입
	public void insertUser(UserDto2 dto)
	{
		String sql = " insert into user_tb (user_name,id,pass,road_addr,jibun_addr,zipcode,detail_addr,agree,email,hp) values (?,?,?,?,?,?,?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		conn = db.getMyConnection();
		try
		{
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getUser_name());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getPass());
			pstmt.setString(4, dto.getRoad_addr());
			pstmt.setString(5, dto.getJibun_addr());
			pstmt.setString(6, dto.getZipcode());
			pstmt.setString(7, dto.getDetail_addr());
			pstmt.setInt(8, dto.getAgree());

			String email = dto.getEmail1() + "@" + dto.getEmail2();
			pstmt.setString(9, email);
			String hp = dto.getHp1() + "-" + dto.getHp2() + "-" + dto.getHp3();
			pstmt.setString(10, hp);
			
			
			pstmt.execute();
		} catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally
		{
			db.dbClose(conn, pstmt);
		}

	}
	//로그인 아이디 비밀번호 확인
	public int loginProcess(String id, String pass) {
		int ans=0;
		if(this.isIdSearch(id)) {
			//아이디가 존재하는 경우
			//비번이 맞는지 확인
			if(this.isIdPassCheck(id, pass)) {
				//맞는경우
				ans=3;
			}else {
				//틀린경우
				ans=2;
			}
			
		}else {
			//아이디가 존재하지 않는경우
			ans=1;
		}
		return  ans;
	}
	
	//아이디에 해당하는 비번이 맞으면 true ,틀리면 false
		public boolean isIdPassCheck(String id, String pass)
		{
			boolean find = false;
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "select * from user_tb where id=? and pass=?";

			conn = db.getMyConnection();
			try
			{
				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, id);
				pstmt.setString(2, pass);
				rs = pstmt.executeQuery();
				if (rs.next())
				{
					find = true;
				}

			} catch (SQLException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally
			{
				db.dbClose(conn, pstmt, rs);
			}

			return find;
		}
		//아이디에 따른 user_num가져오기
		public String getNum(String id)
		{
			String num="";
			Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			String sql="select user_num from user_tb where id=?";
			conn=db.getMyConnection();
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs=pstmt.executeQuery();
				if(rs.next())
					num=rs.getString("user_num");
					
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				db.dbClose(conn, pstmt,rs);
			}
			return num;
		}
		
		
		//userNum에 따른 User정보 가져오기	
		public UserDto getInfo(String userNum)
		{
			UserDto dto = new UserDto();
			Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			String sql="select * from user_tb where user_num=?";
			conn=db.getMyConnection();
			 
			try {
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setString(1, userNum);
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					
					dto.setUser_num(rs.getString("user_num"));
					dto.setUser_name(rs.getString("user_name"));
					dto.setId(rs.getString("id"));
					dto.setPass(rs.getString("pass"));
					dto.setEmail(rs.getString("email"));
					dto.setHp(rs.getString("hp"));
					dto.setZipcode(rs.getString("zipcode"));
					dto.setRoad_addr(rs.getString("road_addr"));
					dto.setJibun_addr(rs.getString("jibun_addr"));
					dto.setDetail_addr(rs.getString("detail_addr"));
					
					dto.setAgree(rs.getInt("agree"));
					dto.setLvl(rs.getInt("lvl"));
					
				
					
				}
						
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
			return dto;		
		}
		
		//이메일애 따른 아이디 확인
		public String findID(String email)
		{
			String id="";
			Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			String sql="select id from user_tb where email=?";
			conn=db.getMyConnection();
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, email);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					id=rs.getString("id");		
				}
					
					
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				db.dbClose(conn, pstmt,rs);
			}
			return id;
		}
		
		//비밀번호 변경
		public void changePass(String pass, String id)
		{
			
			Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			String sql="update user_tb set pass=? where id=?";
			conn=db.getMyConnection();
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, pass);
				pstmt.setString(2, id);
				pstmt.execute();
					
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				db.dbClose(conn, pstmt,rs);
			}
			
		}
		
		//id에 따른 User정보 가져오기
		public UserDto getData(String myId)
		{
			UserDto dto = new UserDto();
			Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			String sql="select * from user_tb where id=?";
			conn=db.getMyConnection();
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, myId);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					dto.setUser_num(rs.getString("user_num"));
					dto.setUser_name(rs.getString("user_name"));
					dto.setId(rs.getString("id"));
					dto.setPass(rs.getString("pass"));
					dto.setEmail(rs.getString("email"));
					dto.setHp(rs.getString("hp"));
					dto.setZipcode(rs.getString("zipcode"));
					dto.setRoad_addr(rs.getString("road_addr"));
					dto.setJibun_addr(rs.getString("jibun_addr"));
					dto.setDetail_addr(rs.getString("detail_addr"));
					
					dto.setAgree(rs.getInt("agree"));
					dto.setLvl(rs.getInt("lvl"));
					
				}
					
					
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				db.dbClose(conn, pstmt,rs);
			}
			return dto;
		}
		
		//회원정보 수정
		public void updateUser(UserDto2 dto) {
			Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			String sql="update user_tb set hp=?,email=?,zipcode=?,road_addr=?,jibun_addr=?,detail_addr=?,agree=? where user_num=?";
			conn=db.getMyConnection();
			
			try {
				pstmt=conn.prepareStatement(sql);
				String hp = dto.getHp1() + "-" + dto.getHp2() + "-" + dto.getHp3();
				pstmt.setString(1, hp);
				String email = dto.getEmail1() + "@" + dto.getEmail2();
				pstmt.setString(2, email);
				pstmt.setString(3, dto.getZipcode());
				pstmt.setString(4, dto.getRoad_addr());
				pstmt.setString(5, dto.getJibun_addr());
				pstmt.setString(6, dto.getDetail_addr());
				pstmt.setInt(7, dto.getAgree());
				pstmt.setString(8, dto.getUser_num());
				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(conn, pstmt);
			}
		}
		
		//회원탈퇴
		public void deleteUser(String num){
			Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			String sql="delete from user_tb where user_num=?";
			conn=db.getMyConnection();
			
			try {
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setString(1,num);
				
				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(conn, pstmt);
			}
		}
		
		//전체회원 출력
		public List<UserDto> getAllUsers(){
			List<UserDto> list=new ArrayList<UserDto>();
			Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			String sql="select * from user_tb";
			conn=db.getMyConnection();
			try {
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				while(rs.next()) {
					UserDto dto=new UserDto();
					dto.setUser_num(rs.getString("user_num"));
					dto.setUser_name(rs.getString("user_name"));
					dto.setId(rs.getString("id"));
					dto.setPass(rs.getString("pass"));
					dto.setEmail(rs.getString("email"));
					dto.setHp(rs.getString("hp"));
					dto.setZipcode(rs.getString("zipcode"));
					dto.setRoad_addr(rs.getString("road_addr"));
					dto.setJibun_addr(rs.getString("jibun_addr"));
					dto.setDetail_addr(rs.getString("detail_addr"));
					
					dto.setAgree(rs.getInt("agree"));
					dto.setLvl(rs.getInt("lvl"));
					
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

		//회원레벨수정
		public void updateUserLevel(String user_num,String lvl) {
			Connection conn=null;
			PreparedStatement pstmt=null;
			String sql="update user_tb set lvl=? where user_num=?";
			conn=db.getMyConnection();
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, lvl);
				pstmt.setString(2, user_num);
			
				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(conn, pstmt);
			}
		}
		
		public boolean getUserLevel(String myId) {
			boolean adopt_user=false;
			String sql="select lvl from user_tb where id=?";
			Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			conn=db.getMyConnection();
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, myId);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					if(rs.getInt("lvl")==1) {
						adopt_user=true;
					}
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				db.dbClose(conn, pstmt, rs);
			}
			return adopt_user;
		}
		
}










































