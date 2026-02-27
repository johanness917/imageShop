package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.domain.Notice;
import com.project.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	@Autowired
	private NoticeService service;

	// 공지사항 등록 페이지
	@GetMapping("/register")
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER')")
	public void registerForm(Model model) throws Exception {
		Notice notice = new Notice();
		model.addAttribute(notice);
	}
}
