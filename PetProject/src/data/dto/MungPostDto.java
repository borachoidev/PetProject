package data.dto;

import java.sql.Timestamp;

public class MungPostDto {
	private String post_num;
	private String photo;
	private String content;
	private String tag;
	private int likes;
	private Timestamp writeday;
	private String dog_num;
	private String user_num;
	public String getPost_num() {
		return post_num;
	}
	public void setPost_num(String post_num) {
		this.post_num = post_num;
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
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
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
	public String getDog_num() {
		return dog_num;
	}
	public void setDog_num(String dog_num) {
		this.dog_num = dog_num;
	}
	public String getUser_num() {
		return user_num;
	}
	public void setUser_num(String user_num) {
		this.user_num = user_num;
	}

	
}
