package com.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.domain.Reply;
import com.project.service.ReplyService;

@RestController
@RequestMapping("/reply")
public class ReplyController {

	@Autowired
	private ReplyService service;

	// 댓글 등록 (POST 방식)
	@PostMapping("")
	public ResponseEntity<String> register(@RequestBody Reply reply) {
		try {
			service.register(reply);
			return new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
	}

	// 댓글 목록 (GET 방식)
	@GetMapping("/all/{boardNo}")
	public ResponseEntity<List<Reply>> list(@PathVariable("boardNo") Integer boardNo) {
		try {
			return new ResponseEntity<>(service.list(boardNo), HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}

	@PostMapping("/modify/{replyNo}")
	public ResponseEntity<String> modify(@PathVariable("replyNo") Integer replyNo, @RequestBody Reply reply) {
		try {
			reply.setReplyNo(replyNo);
			service.modify(reply);
			return new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}

	// 댓글 삭제 (기존 DELETE -> POST로 변경)
	@PostMapping("/remove/{replyNo}")
	public ResponseEntity<String> remove(@PathVariable("replyNo") Integer replyNo) {
		try {
			service.remove(replyNo);
			return new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}
}