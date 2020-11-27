package data.dto;

import java.sql.Timestamp;

public class MungChatDto {
	private String chat_num;
	private String toID;
	private String fromID;
	private String content;
	private Timestamp chatTime;
	
	public String getChat_num() {
		return chat_num;
	}
	public void setChat_num(String chat_num) {
		this.chat_num = chat_num;
	}
	public String getToID() {
		return toID;
	}
	public void setToID(String toID) {
		this.toID = toID;
	}
	public String getFromID() {
		return fromID;
	}
	public void setFromID(String fromID) {
		this.fromID = fromID;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getChatTime() {
		return chatTime;
	}
	public void setChatTime(Timestamp chatTime) {
		this.chatTime = chatTime;
	}
	
	
}
