<%@ page  contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>

<html>
<head>
	<meta charset="UTF-8">
	<title>StudentManage.jsp</title>
</head>

<body>

	<form method = "POST">
	<fieldset>
		<legend> ### 학생 성적 관리 프로그램 ### </legend>
		<h3> 1. 학생 정보 입력<br/>
		2. 학생 정보 조회<br/>
		3. 성적 변경<br/>
		4. 학생 정보 삭제<br/>
		5. 프로그램 종료</h3>
		<label for = "number">번호를 선택하세요</label>
		<input type = "radio" name = "mnum" id = "mnum" value = "1"/>1
		<input type = "radio" name = "mnum" id = "mnum" value = "2"/>2
		<input type = "radio" name = "mnum" id = "mnum" value = "3"/>3
		<input type = "radio" name = "mnum" id = "mnum" value = "4"/>4
		<input type = "radio" name = "mnum" id = "mnum" value = "5"/>5
		<input type = "submit" value = "select"/>
	</fieldset>
	</form>
	<br/>
</body>
</html>