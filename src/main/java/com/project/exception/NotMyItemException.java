package com.project.exception;

// 1. 반드시 RuntimeException을 상속(extends) 받아야 합니다.
public class NotMyItemException extends RuntimeException {

	private static final long serialVersionUID = 1L;

	// 2. 클래스 이름과 동일한 생성자를 만듭니다. (반환 타입 String 같은 게 있으면 안 됩니다!)
	public NotMyItemException(String msg) {
		super(msg); // 이제 부모인 RuntimeException의 생성자로 메시지를 보냅니다.
	}
}