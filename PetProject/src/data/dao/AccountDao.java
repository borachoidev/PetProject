package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import data.dto.AccountDto;
import mysql.db.MysqlConnect;

public class AccountDao {
	MysqlConnect db=new MysqlConnect();
	
	//default 강아지 찾기
	public String getDefault(String id) {
		String accName="";
		Connection conn=null;
		PreparedStatement pstmt= null;
		ResultSet rs=null;
		String sql="select b.acc_name from user_tb a, account_tb b"
				+ " where a.user_num=b.user_num and a.id=? and sel_acc=1";
	
		conn = db.getMyConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				accName=rs.getString(1);
			}
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
		return accName;
	}
	
	//첫번째 등록 강아지인지 아닌지 카운트로 잡아내기
	public int countDefault(String user_num)
	{
		int cnt=0;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select count(user_num) from account_tb where user_num=?";
		conn=db.getMyConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, user_num);
			
			rs=pstmt.executeQuery();
			if(rs.next())
				cnt=rs.getInt(1);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt,rs);
		}
		
		return cnt;
		
	}
	
	//기본강아지 값을 전부 0으로 초기화
		public int updateDefaultAll(String user_num)
		{
			int sel_acc=0;
			Connection conn=null;
			PreparedStatement pstmt=null;
		
			String sql="update account_tb set sel_acc=replace(sel_acc,1,0) where user_num=?";
		
			conn=db.getMyConnection();
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, user_num);
				
	
				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				db.dbClose(conn, pstmt);
			}
			return sel_acc;
		}
		
	
	//기본강아지로 바꿔주기
		public int updateDefault(String dog_num)
		{
			int sel_acc=0;
			String sql="update account_tb set sel_acc=1"
						+ " where dog_num=?";
			Connection conn=null;
			PreparedStatement pstmt=null;
			conn=db.getMyConnection();
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, dog_num);
				pstmt.execute();
			}catch (SQLException e) {
				
				e.printStackTrace();
			}finally {
				db.dbClose(conn, pstmt);
			}
			return sel_acc;
		}
		
	
	
		
		//강아지 등록하기
		public void insertAcc(AccountDto dto)
			{
			
			String sql="insert into account_tb (acc_name,breed,weight,age,gender,photo,memo,user_num,sel_acc) values (?,?,?,?,?,?,?,?,?)";
			
			Connection conn=null;
			PreparedStatement pstmt=null;
			conn=db.getMyConnection();
			try {
				pstmt=conn.prepareStatement(sql);
				
				
				pstmt.setString(1, dto.getAcc_name());
				pstmt.setString(2, dto.getBreed());
				pstmt.setString(3, dto.getWeight());
				pstmt.setString(4, dto.getAge());
				pstmt.setString(5, dto.getGender());
				pstmt.setString(6, dto.getPhoto());
				pstmt.setString(7, dto.getMemo());
				pstmt.setString(8, dto.getUser_num());
				pstmt.setInt(9, dto.getSel_acc());
				
				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(conn, pstmt);
			}
		}
		
	
	//강아지 삭제하기
	public void deleteAcc(String dog_num)
	{
		String sql="delete from account_tb where dog_num=?";
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		conn=db.getMyConnection();

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dog_num);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt);
		}
		
	}

	//강아지 정보 업데이트
			public void updateAcc(AccountDto dto)
			{
				Connection conn=null;
				PreparedStatement pstmt=null;
			
				String sql="update account_tb set weight=?, breed=?, age=?, gender=?, photo=?, memo=? where dog_num=?";
			
				conn=db.getMyConnection();
				try {
					pstmt=conn.prepareStatement(sql);
					pstmt.setString(1,  dto.getWeight());
					pstmt.setString(2, dto.getBreed());
					pstmt.setString(3, dto.getAge());
					pstmt.setString(4, dto.getGender());
					
					pstmt.setString(5, dto.getPhoto());
					pstmt.setString(6, dto.getMemo());
					
					pstmt.setString(7, dto.getDog_num());
					
					
					pstmt.execute();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					db.dbClose(conn, pstmt);
				}
			}
		


	
	
	
	//유저넘버로 뽑은 모든 강아지들 리스트
	public List<AccountDto> getAllAccounts(String user_num)
	{
		List<AccountDto> list=new Vector<AccountDto>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from account_tb where user_num=?";
		conn=db.getMyConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, user_num);
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				AccountDto dto=new AccountDto();
				dto.setDog_num(rs.getString("dog_num"));
				dto.setAcc_name(rs.getString("acc_name"));
				dto.setAge(rs.getString("age"));
				dto.setWeight(rs.getString("weight"));
				dto.setGender(rs.getString("gender"));
				dto.setBreed(rs.getString("breed"));
				dto.setPhoto(rs.getString("photo"));
				dto.setMemo(rs.getString("memo"));
				dto.setUser_num(rs.getString("user_num"));
				dto.setSel_acc(rs.getInt("sel_acc"));

				
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt, rs);
		}
		
		return list;
	}
	
	//유저넘버로 받아온 강아지들 개별 계정
	public AccountDto getData(String user_num)
	{
		AccountDto dto=new AccountDto();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from account_tb where user_num=?";
		conn=db.getMyConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, user_num);
			
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				
				dto.setDog_num(rs.getString("dog_num"));
				dto.setAcc_name(rs.getString("acc_name"));
				dto.setAge(rs.getString("age"));
				dto.setWeight(rs.getString("weight"));
				dto.setGender(rs.getString("gender"));
				dto.setBreed(rs.getString("breed"));
				dto.setPhoto(rs.getString("photo"));
				dto.setMemo(rs.getString("memo"));
				dto.setUser_num(rs.getString("user_num"));
				dto.setSel_acc(rs.getInt("sel_acc"));
				
			
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt, rs);
		}
		return dto;
	}
	//강아지넘버로 특정강아지 데이터뽑기
	public AccountDto getDogData(String dog_num)
	{
		AccountDto dto=new AccountDto();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from account_tb where dog_num=?";
		conn=db.getMyConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dog_num);
			
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				dto.setDog_num(rs.getString("dog_num"));
				dto.setAcc_name(rs.getString("acc_name"));
				dto.setAge(rs.getString("age"));
				dto.setWeight(rs.getString("weight"));
				dto.setGender(rs.getString("gender"));
				dto.setBreed(rs.getString("breed"));
				dto.setPhoto(rs.getString("photo"));
				dto.setMemo(rs.getString("memo"));
			
			
				
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt, rs);
		}
		return dto;
	}
	
}
