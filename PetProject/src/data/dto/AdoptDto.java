package data.dto;

import java.sql.Timestamp;

public class AdoptDto {
	private String adopt_num;
	private String title;
	private String age;
	private String gender;
	private String breed;
	private String vaccine;
	private String commt;
	private String photo;
	private String content;
	private int likes;
	private Timestamp wrteday;
	private String id;
	private String user_name;
	public String getAdopt_num() {
		return adopt_num;
	}
	public void setAdopt_num(String adopt_num) {
		this.adopt_num = adopt_num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBreed() {
		return breed;
	}
	public void setBreed(String breed) {
		this.breed = breed;
	}
	public String getVaccine() {
		return vaccine;
	}
	public void setVaccine(String vaccine) {
		this.vaccine = vaccine;
	}
	public String getCommt() {
		return commt;
	}
	public void setCommt(String commt) {
		this.commt = commt;
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
	public Timestamp getWrteday() {
		return wrteday;
	}
	public void setWrteday(Timestamp wrteday) {
		this.wrteday = wrteday;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

}