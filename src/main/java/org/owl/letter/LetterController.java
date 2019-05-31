package org.owl.letter;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.owl.letter.Letter;
import org.owl.book.chap11.Member;
import org.owl.letter.LetterDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

@Controller
public class LetterController {
	
	@Autowired
	LetterDao letterDao;

	Logger logger = LogManager.getLogger();
	
	/**
	 * 받은편지함
	 */
	@GetMapping("/letter/revicedLetter")
	public void recivedList(
			@RequestParam(value = "page", defaultValue = "1") int page,
			Model model) {

		// 페이지당 행의 수와 페이지의 시작점
		final int COUNT = 100;
		int offset = (page - 1) * COUNT;

		List<Letter> letterList = letterDao.recivedLetter(offset, COUNT);
		int totalCount = letterDao.getLettersCount();
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("letterList", letterList);
	}
	/**
	 * 편지보기
	 */
	@GetMapping("/letter/letterView")
	public void letterView(@RequestParam("letterId") String letterId,
			Model model) {
		Letter letter = letterDao.recivedLetter(letterId);
		model.addAttribute("letter", letter);
	}

	/**
	 * 글 등록 화면
	 */
	@GetMapping("/letter/writeLetter")
	public String writeLetter(HttpSession session) {
		Object memberObj = session.getAttribute("MEMBER");
		if (memberObj == null)
			// 세션에 MEMBER가 없을 경우 로그인 화면으로
			return "login/loginForm";

		return "letter/writeLetter";
	}

	/**
	 * 글 등록
	 */
	@PostMapping("/letter/add")
	public String letterAdd(Letter letter,
			@SessionAttribute("MEMBER") Member member) {
		// 세션에 MEMBER가 없을 경우 로그인 화면으로
		/*Object memberObj = session.getAttribute("MEMBER");
		if (memberObj == null)
			// 세션에 MEMBER가 없을 경우 로그인 화면으로
			return "login/loginForm";

		Member member = (Member) memberObj; */
		letter.setUserId(member.getMemberId());
		letter.setName(member.getName());
		letterDao.addletter(letter);
		return "redirect:/app/letter/list";
	}
	/**
	 * 글수정 화면
	 */
	@GetMapping("/letter/modifyForm")
	public void modifyletter(@RequestParam("letterId")
			String letterId, @SessionAttribute("MEMBER") Member member,
			Model model) throws Exception {
			Letter letter = letterDao.getLetter(letterId);
			
			if(!member.getMemberId().equals(letter.getLetterId()))
				throw new RuntimeException("권한이 없습니다.");
			
			model.addAttribute("letter",letter);
	}
	/**
	 * 글수정
	 */
	@PostMapping("/letter/modify")
	public String update(Letter letter,
			@SessionAttribute("MEMBER") Member member) {
		letter.setUserId(member.getMemberId());
		int updatedRows = letterDao.modifyletter(letter);
		
		if (updatedRows == 0)
			throw new RuntimeException("권한이 없습니다.");
			
			return "redirect:/app/letter/view?letterId=" + letter.getletterId();
	}
	
	@GetMapping("/letter/delete")
	public String delete(@RequestParam("letterId") String letterId,
			@SessionAttribute("MEMBER") Member member) {
		int updatedRows = letterDao.deleteLetter(letterId,
				member.getMemberId());

		// 권한 체크 : 글이 삭제되었는지 확인
		if (updatedRows == 0)
			// 글이 삭제되지 않음. 자신이 쓴 글이 아님
			throw new RuntimeException("No Authority!");

		logger.debug("글을 삭제했습니다. letterId={}", letterId);
		return "redirect:/app/letter/list";
}
}
}
