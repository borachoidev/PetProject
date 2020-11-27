package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import mysql.db.MysqlConnect;

public class MyPageDao {

	MysqlConnect db=new MysqlConnect(); 
	
	public void deleteDogAcc(String dog_num)
	{
		String sql="delete from account_tb where dog_num=?";
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		conn=db.getMyConnection();

		try {
			pstmt=conn.(sql);
			pstmt.setString(1, dog_num);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt);
		}
		
	}


public void insertMember(MemberDto dto)
	{
		String sql="insert into member values (seq_mini.nextval,"
				+ "?,?,?,?,?,?,?,sysdate)";
		Connection conn=null;
		PreparedStatement pstmt=null;
		//conn=db.getMyConnection();
		conn=db.getGangsaConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPass());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getAddress());
			pstmt.setString(5, dto.getAddrdetail());
			
			String email=dto.getEmail1()+"@"+dto.getEmail2();
			pstmt.setString(6, email);
			
			String hp=dto.getHp1()+"-"+dto.getHp2()+"-"+dto.getHp3();
			pstmt.setString(7, hp);
			
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt);
		}
	}

public List<MemberDto2> getAllMembers()
	{
		List<MemberDto2> list=new Vector<MemberDto2>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from member order by id asc";
		conn=db.getGangsaConnection();
		//conn=db.getMyConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				MemberDto2 dto=new MemberDto2();
				dto.setNum(rs.getString("num"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setAddress(rs.getString("address"));
				dto.setAddrdetail(rs.getString("addrdetail"));
				dto.setHp(rs.getString("hp"));
				dto.setEmail(rs.getString("email"));
				dto.setGaipday(rs.getTimestamp("gaipday"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt,rs);
		}
		
		return list;
	}
	
	//num�� �ش��ϴ� dto ��ȯ
	public MemberDto getData(String num)
	{
		MemberDto dto=new MemberDto();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from member where num=?";
		conn=db.getGangsaConnection();
		//conn=db.getMyConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,  num);
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				 dto.setNum(rs.getString("num"));
				 dto.setId(rs.getString("id"));
				 dto.setName(rs.getString("name"));
				 dto.setAddress(rs.getString("address"));
				 dto.setAddrdetail(rs.getString("addrdetail"));
				String []hp=rs.getString("hp").split("-");
				 dto.setHp1(hp[0]);
				 dto.setHp2(hp[1]);
				 dto.setHp3(hp[2]);
				 
				 String[] email=rs.getString("email").split("@");
				 dto.setEmail1(email[0]);
				 dto.setEmail2(email[1]);
				 
				 
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt,rs);
		}
		
		
		return dto;
	}
	
	//����-�̸�, �ڵ���, �̸���, �ּҸ� ����
	public void updateMember(MemberDto dto)
	{
		Connection conn=null;
		PreparedStatement pstmt=null;
	
		String sql="update member set name=?, hp=?, email=?, address=?,"
				+ "addrdetail=? where num=?";
		//conn=db.getMyConnection();
		conn=db.getGangsaConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,  dto.getName());
			
			String hp=dto.getHp1()+"-"+dto.getHp2()+"-"+dto.getHp3();
			pstmt.setString(2, hp);
			
			String email=dto.getEmail1()+"@"+dto.getEmail2();
			pstmt.setString(3, email);
			
			pstmt.setString(4, dto.getAddress());
			pstmt.setString(5, dto.getAddrdetail());
			pstmt.setString(6, dto.getNum());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt);
		}
	}
}
