package org.owl.letter;

import java.util.List;

import org.owl.book.chap11.Member;
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

	/**
	 * 받은 목록
	 */
	@GetMapping("/letter/listReceived")
	public void listReceived(
			@RequestParam(value = "page", defaultValue = "1") int page,
			@SessionAttribute("MEMBER") Member member, Model model) {

		// 페이지당 행의 수와 페이지의 시작점
		final int ROWS_PER_PAGE = 20;
		int offset = (page - 1) * ROWS_PER_PAGE;

		List<Letter> letters = letterDao.listLettersReceived(
				member.getMemberId(), offset, ROWS_PER_PAGE);
		int count = letterDao.countLettersReceived(member.getMemberId());

		model.addAttribute("letters", letters);
		model.addAttribute("count", count);
	}

	/**
	 * 보낸 목록
	 */
	@GetMapping("/letter/listSent")
	public void listSent(
			@RequestParam(value = "page", defaultValue = "1") int page,
			@SessionAttribute("MEMBER") Member member, Model model) {

		// 페이지당 행의 수와 페이지의 시작점
		final int ROWS_PER_PAGE = 20;
		int offset = (page - 1) * ROWS_PER_PAGE;

		List<Letter> letters = letterDao.listLettersSent(member.getMemberId(),
				offset, ROWS_PER_PAGE);
		int count = letterDao.countLettersSent(member.getMemberId());

		model.addAttribute("letters", letters);
		model.addAttribute("count", count);
	}

	/**
	 * 보기
	 */
	@GetMapping("/letter/view")
	public void view(@RequestParam("letterId") String letterId,
			@SessionAttribute("MEMBER") Member member, Model model) {

		// 자신의 편지가 아닐 경우 EmptyResultDataAccessException 발생함
		Letter letter = letterDao.getLetter(letterId, member.getMemberId());
		model.addAttribute("letter", letter);
	}

	/**
	 * 편지 저장
	 */
	@PostMapping("/letter/add")
	public String add(Letter letter,
			@SessionAttribute("MEMBER") Member member) {
		letter.setSenderId(member.getMemberId());
		letter.setSenderName(member.getName());
		letterDao.addLetter(letter);
		return "redirect:/app/letter/listSent";
	}
	
	@GetMapping("/letter/addForm")
	public String addLetter(Letter letter,
			@SessionAttribute("MEMBER") Member member) {
		return "letter/addForm";
	}
	/**
	 * 편지 삭제
	 */
	@GetMapping("/letter/delete")
	public String delete(
			@RequestParam(value = "mode", required = false) String mode,
			@RequestParam("letterId") String letterId,
			@SessionAttribute("MEMBER") Member member) {
		int updatedRows = letterDao.deleteLetter(letterId,
				member.getMemberId());
		if (updatedRows == 0)
			// 자신의 편지가 아닐 경우 삭제되지 않음
			throw new RuntimeException("No Authority!");

		if ("SENT".equals(mode))
			return "redirect:/app/letter/listSent";
		else
			return "redirect:/app/letter/listReceived";
	}
}