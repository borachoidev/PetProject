package data.dto;

import java.sql.Timestamp;

public class AdoptReviewDto {
	private String adopre_num;
	private String subject;
	private String photo;
	private String content;
	private int likes;
	private Timestamp writeday;
	private String adopt_num;
	private String id;
	public String getAdopre_num() {
		return adopre_num;
	}
	public void setAdopre_num(String adopre_num) {
		this.adopre_num = adopre_num;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	public Timestamp getWriteday() {
		return writeday;
	}
	public void setWriteday(Timestamp writeday) {
		this.writeday = writeday;
	}
	public String getAdopt_num() {
		return adopt_num;
	}
	public void setAdopt_num(String adopt_num) {
		this.adopt_num = adopt_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
}
