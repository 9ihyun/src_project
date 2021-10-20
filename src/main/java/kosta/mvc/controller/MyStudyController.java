package kosta.mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kosta.mvc.dao.MyStudyDAOImpl;
import kosta.mvc.dto.Study;
import kosta.mvc.dto.StudyChat;
import kosta.mvc.dto.User;
import kosta.mvc.service.MyStudyService;
import kosta.mvc.service.MyStudyServiceImpl;
import kosta.mvc.service.StudyServiceImpl;
import net.sf.json.JSONArray;

public class MyStudyController implements Controller {
	MyStudyService myStudyService = new MyStudyServiceImpl();

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		return null;
	}

	/**
	 * Session에서 ID 꺼내오기
	 * */
	private String getUserId(HttpServletRequest request) {
		HttpSession session = request.getSession();
		return (String)session.getAttribute("userId");
	}
	
	/**
	 * 내가 찜한 스터디 보기
	 * */
	public ModelAndView viewWishStudy(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = getUserId(request);
		
		List<Study> wishList = myStudyService.viewWishStudy(id);
		request.setAttribute("wishList", wishList);
		
		return new ModelAndView("mypage/wishStudy.jsp"); //찜한 스터디 페이지
	}
	
	/**
	 * 스터디 찜하기
	 */
	public void putWishStudy(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = getUserId(request);
		int studyNo = Integer.parseInt(request.getParameter("studyNo"));
		
		int result = myStudyService.putWishStudy(id, studyNo);
		
		PrintWriter out = response.getWriter();
		out.print(result);
	}
	
	/**
	 * 내가 신청한 스터디 보기
	 * */
	public ModelAndView viewSignStudy(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = getUserId(request);
		
		List<Study> signList = myStudyService.viewSignStudy(id);
		request.setAttribute("signList", signList);
		
		return new ModelAndView("mypage/signStudy.jsp"); //신청한 스터디 페이지
	}
	
	/**
	 * 스터디 신청하기
	 */
	public void putSignStudy(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = getUserId(request);
		int studyNo = Integer.parseInt(request.getParameter("studyNo"));
		
		int result = myStudyService.putSignStudy(id, studyNo);
		
		PrintWriter out = response.getWriter();
		out.print(result);
	}
	
	/**
	 * 스터디 신청 상태 변경
	 * */
	public void changeSignState(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		
		String id = request.getParameter("id");
		int studyNo = Integer.parseInt(request.getParameter("studyNo"));
		
		if(myStudyService.changeSignState(id, studyNo) != 0) {
			List<User> userList = new StudyServiceImpl().getUserList(studyNo);
				
			JSONArray arr = JSONArray.fromObject(userList);
			
			PrintWriter out = response.getWriter();
			out.print(arr);
		}
	}
	
	/**
	 * 스터디 신청 삭제
	 */
	public void removeSignStudy(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		
		String id = request.getParameter("id");
		int studyNo = Integer.parseInt(request.getParameter("studyNo"));
		
		if(myStudyService.removeSignStudy(id, studyNo) != 0) {
			List<User> userList = new StudyServiceImpl().getUserList(studyNo);
				
			JSONArray arr = JSONArray.fromObject(userList);

			PrintWriter out = response.getWriter();
			out.print(arr);
		}
	}
	
	/**
	 * 내가 등록한 스터디 보기
	 * */
	public ModelAndView viewMyStudy(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = getUserId(request);
		
		List<Study> myStudyList = myStudyService.viewMyStudy(id);
		request.setAttribute("myStudyList", myStudyList);
		
		return new ModelAndView("mypage/myStudy.jsp"); //등록한 스터디 페이지
	}
	
	/**
	 * 참여중/종료 스터디 보기
	 * */
	public ModelAndView viewJoinStudy(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = getUserId(request);
		
		List<Study> joinList = myStudyService.viewJoinStudy(id);		
		request.setAttribute("joinList", joinList);
		
		return new ModelAndView("mypage/myStudy.jsp"); //참여중/완료 스터디
	}
	
	/**
	 * 스터디룸 대화 내용 불러오기
	 * */
	public ModelAndView viewStudyRoomChat(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int studyNo = Integer.parseInt(request.getParameter("studyNo"));
		
		List<StudyChat> chatList = myStudyService.viewStudyRoomChat(studyNo);
		request.setAttribute("chatList", chatList);
		
		return new ModelAndView(""); //스터디룸 페이지
	}
	
	/**
	 * 스터디룸 대화 내용 입력
	 */
	public void putStudyRoomChat(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = getUserId(request);
		int studyNo = Integer.parseInt(request.getParameter("studyNo"));
		String chatContent = request.getParameter("chatContent");
		
		int result = myStudyService.putStudyRoomChat(new StudyChat(studyNo, id, chatContent));
		
		PrintWriter out = response.getWriter();
		out.print(result);
	}
	
}
