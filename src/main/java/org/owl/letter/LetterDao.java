package org.owl.letter;

import java.util.List;

import org.owl.letter.letter;
import org.owl.letter.letter;
import org.owl.letter.letter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

public class LetterDao {
	//받은편지목록
	static final String RECIVED_LETTER = "select letterId, title, content, senderId, senderName, cdate from letter where (reciverId, reciverName) = (?,?)";
	//보낸편지목록
	static final String SENDED_LETTER = "select letterId, title, content, reciverId, reciverName, cdate from letter where (senderId, senderName) = (?,?)";
	//편지상세보기
	static final String VIEW_LETTER = "select letterId, title, content, reciverId, reciverName, senderId, senderName, cdate from letter where letterId=?";
	//편지쓰기(보낸쪽의 보낸편지함, 받은쪽의 받은편지함 두 데이터베이스에 동시에 저장)
	static final String WRITE_LETTER = "insert letter(title,content,senderId,senderName,revicerId,reciverName) values(?,?,?,?,?,?)";
	//편지저장
	static final String SAVE_LETTER = "update letter set title=?, content=? where (letterId, senderId, senderName, revicerId, reciverName) = (?,?,?,?)";
	//편지삭제(받은사람은 받은사람 데이터베이스에서민 삭제, 보낸사람은 보낸사람 데이터베이스에서만 삭제)
	static final String DELETE_LETTER = "delete from letter where (letterId, senderId, reciverId) = (?,?,?)";
	
	static final String COUNT_LETTER = "select count(letterId) from letter";
	
	@Autowired
	JdbcTemplate jdbcTemplate;

	RowMapper<Letter> letterRowMapper = new BeanPropertyRowMapper<>(
			Letter.class);
	/**
	 * 받은편지건수
	 */
	public int getLettersCount() {
		return jdbcTemplate.queryForObject(COUNT_LETTER, Integer.class);
	}
	
	/**
	 * 받은편지함
	 */
	public List<Letter> recivedLetter(int offset, int count) {
		return jdbcTemplate.query(RECIVED_LETTER, letterRowMapper, offset,
				count);
	}
	/**
	 * 보낸편지함
	 */
	public List<Letter> sendedLetter(int offset, int count) {
		return jdbcTemplate.query(SENDED_LETTER, letterRowMapper, offset,
				count);
	}
	/**
	 * 편지보기
	 */
	public Letter viewLetter(String letterId) {
		return jdbcTemplate.queryForObject(VIEW_LETTER, letterRowMapper,
				letterId);
	}
	
	/**
	 * 편지쓰기
	 */
	public int writeLetter(Letter letter) {
		return jdbcTemplate.update(WRITE_LETTER, letter.getTitle(),
				letter.getContent(), letter.getSenderId(), letter.getSenderName(),letter.getReciverId(), letter.getReciverName());
	}
	
	/**
	 * 편지저장
	 */
	public int saveLetter(Letter letter) {
		return jdbcTemplate.update(SAVE_LETTER, letter.getTitle(),
				letter.getContent(), letter.getSenderId(), letter.getSenderName(), 
				letter.getReciverId(), letter.getReciverName(), letter.getLetterId());
	}
	/**
	 * 편지삭제
	 */
	public int deleteLetter(String letterId, String senderId, String reciverId) {
		return jdbcTemplate.update(DELETE_LETTER, letterId, senderId, reciverId);
	}
}
