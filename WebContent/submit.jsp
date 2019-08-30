<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
로그인 버튼을 누르면 여기로 와요~!<br>
	<%			
		request.setCharacterEncoding("UTF-8");		
		// username, email, password, confirm-password		
		String id  = request.getParameter("data2");		
		String pw  = request.getParameter("data2");		
	%>			
</body>
</html>