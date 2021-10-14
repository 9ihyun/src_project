package kosta.mvc.exception;

/**
 * 로그인시 인증에 실패하면 발생하는 예외
 * */
public class AuthenticationException extends Exception {
	public AuthenticationException() {}
	public AuthenticationException(String message) {
		super(message);
	}
}
