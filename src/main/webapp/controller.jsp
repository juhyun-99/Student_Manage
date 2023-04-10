<%@ page  contentType="text/html; charset=UTF-8" 
	import = "java.util.*, model.*" %>
	
<%
	if(request.getMethod().equals("POST")) {
		request.setCharacterEncoding("UTF-8");
	}
%>

<jsp:useBean id = "studentDAO" class = "model.StudentDAO" scope = "session" />
<jsp:useBean id = "studentDO" class = "model.StudentDO" scope = "page"/>


<%
	String viewPath = "/WEB-INF/views/"; 
	String command = request.getParameter("command");
	session.setAttribute("list", studentDAO.getAllStudent());
	
	if(session.getAttribute("mnum") == null) {
		if(request.getMethod().equals("GET")){
			pageContext.forward(viewPath + "StudentManage.jsp");
		}
		else if(request.getMethod().equals("POST")){
			String mnum = request.getParameter("mnum");
			session.setAttribute("mnum", mnum);
			if(mnum!=null){
				if(mnum.equals("1")){
					pageContext.forward(viewPath + "StudentInsert.jsp");
				}
				else if(mnum.equals("2")){
					session.setAttribute("student", null);
					pageContext.forward(viewPath + "StudentList.jsp");
				}
				else if(mnum.equals("3")){
					pageContext.forward(viewPath + "StudentScoreChange.jsp");
				}
				else if(mnum.equals("4")){
					pageContext.forward(viewPath + "StudentDelete.jsp");
				}
				else if(mnum.equals("5")){
					pageContext.forward(viewPath + "StudentEnd.jsp");
				}
				else{
					pageContext.forward(viewPath + "StudentManage.jsp");
				}
			}
			else{
				response.sendRedirect("controller.jsp");
			}
		}
		
	}
	
	else if(command != null && command.equals("studentInsert")){ //1. 학생 정보 입력
			StudentDO sDO = new StudentDO();
			try{
				sDO.setNum(Integer.parseInt(request.getParameter("num")));
				sDO.setName((String)request.getParameter("name"));
				sDO.setGender((String)request.getParameter("gender"));
				sDO.setKorScore(Integer.parseInt(request.getParameter("korScore")));
				sDO.setEngScore(Integer.parseInt(request.getParameter("engScore")));
				sDO.setMathScore(Integer.parseInt(request.getParameter("mathScore")));
				sDO.setSciScore(Integer.parseInt(request.getParameter("sciScore")));
				if(studentDAO.getSelectStudent(sDO.getNum()) != null){
					request.setAttribute("script", "alert('" + sDO.getNum() + "학번 학생이 이미 존재합니다');");
				}
				else{
					int rowCount = studentDAO.insertStudent(sDO);
					if(rowCount < 1){
						request.setAttribute("script", "alert('잘못된 값을 입력하셨습니다 다시 입력하십시오.');");
					}
					else{
						request.setAttribute("script", "alert('" + sDO.getNum() + "학번 학생의 정보를 추가했습니다!');");
					}		
				}
			}
			catch(Exception e){
				request.setAttribute("script", "alert('잘못된 값을 입력하셨습니다 다시 입력하십시오.');");
			}
			finally{
				session.setAttribute("list", studentDAO.getAllStudent());
				pageContext.forward(viewPath + "StudentInsert.jsp");
			}
	}
	
	else if(command != null && command.equals("studentSearch")){ //학생 정보 개별 조회
		String num = (String) request.getParameter("num");
		if (num.equals("")){
			request.setAttribute("script", "alert('학생의 학번을 입력하십시오');");
		}
		else{
			StudentDO sDO = studentDAO.getSelectStudent(Integer.parseInt(num));
			if(sDO == null){
				request.setAttribute("script", "alert('" + num + "학번의 학생이 존재하지 않습니다.');");
			}
			else{
				session.setAttribute("student", sDO);
			}
		}
		pageContext.forward(viewPath + "StudentList.jsp");
	}

	else if(command != null && command.equals("studentScoreChange")){ //3. 학생 성적 변경
		try{
			int num = Integer.parseInt(request.getParameter("num"));
			int kor = Integer.parseInt(request.getParameter("korScore"));
			int eng = Integer.parseInt(request.getParameter("engScore"));
			int math = Integer.parseInt(request.getParameter("mathScore"));
			int sci = Integer.parseInt(request.getParameter("sciScore"));
			int rowCount = studentDAO.updateStudent(kor, eng, math, sci, num);
			if(rowCount < 1){
				request.setAttribute("script", "alert('" + num + "학번의 학생이 존재하지 않습니다.');");
			}
			else{
				request.setAttribute("script", "alert('" + num + "학번의 학생 성적을 변경했습니다!');");
			}	
		}
		catch(Exception e){
			request.setAttribute("script", "alert('잘못된 값을 입력하셨습니다 다시 입력하십시오.');");
		}
		finally{
			session.setAttribute("list", studentDAO.getAllStudent());
			pageContext.forward(viewPath + "StudentScoreChange.jsp");
		}
		
	}
	
	else if(command != null && command.equals("studentDelete")){ //학생 정보 삭제
		String num = (String)request.getParameter("num");
		if (num.equals("")){
			request.setAttribute("script", "alert('학생의 학번을 입력하십시오');");
		}
		else{
			int rowCount = studentDAO.deleteStudent(Integer.parseInt(num));
			if(rowCount < 1){
				request.setAttribute("script", "alert('" + num + "학번의 학생이 존재하지 않습니다.');");
			}
			else{
				request.setAttribute("script", "alert('" + num + "학번의 학생 정보를 삭제했습니다!');");
			}
		}
		session.setAttribute("list", studentDAO.getAllStudent());
		pageContext.forward(viewPath + "StudentDelete.jsp");
	}
	
	else if(command != null && command.equals("back")){ // 메인으로 돌아가는 버튼
		session.invalidate();
		pageContext.forward(viewPath + "StudentManage.jsp");
	}
	
	else{
		response.sendRedirect("controller.jsp");
	}
	
%>