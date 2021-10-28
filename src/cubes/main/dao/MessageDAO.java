package cubes.main.dao;

import java.util.List;

import cubes.main.entity.Message;

public interface MessageDAO {
	
	public List<Message> getMessageList();
	
	public void saveMessage(Message message);
	
	public void markAsSeen(int id);
	
	public long getUnreadMessagesCount();
	
	public Message getMessageById(int id);

}
