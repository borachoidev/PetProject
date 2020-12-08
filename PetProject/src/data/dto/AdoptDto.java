package data.dto;

import java.sql.Timestamp;

public class AdoptDto {
	private String adopt_num;
	private String content;
	private String age;
	private String gender;
	private String breed;
	private String vaccine;
	private String photo;
	private int likes;
	private Timestamp writeday;
	private String adopt_name;
	private String user_num;
	public String getAdopt_name() {
		return adopt_name;
	}
	public void setAdopt_name(String adopt_name) {
		this.adopt_name = adopt_name;
	}
	public String getUser_num() {
		return user_num;
	}
	public void setUser_num(String user_num) {
		this.user_num = user_num;
	}
	public String getAdopt_num() {
		return adopt_num;
	}
	public void setAdopt_num(String adopt_num) {
		this.adopt_num = adopt_num;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
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

}