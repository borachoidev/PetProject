package data.dto;

import java.sql.Timestamp;

public class MungCommentDto {
	private String idx;
	private String comm_num;
	private String acc_name;
	private String content;
	private Timestamp writeday;
	private String dog_num;
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getComm_num() {
		return comm_num;
	}
	public void setComm_num(String comm_num) {
		this.comm_num = comm_num;
	}
	public String getAcc_num() {
		return acc_name;
	}
	public void setAcc_num(String acc_num) {
		this.acc_name = acc_num;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getWriteday() {
		return writeday;
	}
	public void setWriteday(Timestamp writeday) {
		this.writeday = writeday;
	}
	public String getDog_num() {
		return dog_num;
	}
	public void setDog_num(String dog_num) {
		this.dog_num = dog_num;
	}
	
	
}
