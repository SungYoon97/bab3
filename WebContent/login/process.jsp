<%@page import="java.sql.ResultSet"%>			
<%@page import="java.sql.PreparedStatement"%>		
<%@page import="javax.sql.DataSource"%>		
<%@page import="javax.naming.InitialContext"%>		
<%@page import="javax.naming.Context"%>		
<%@page import="java.sql.Connection"%>	
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	//	자바 코드 작성
	//	한글 깨짐 방지
	request.setCharacterEncoding("UTF-8");
	// username, email, password, confirm-password
	String name = request.getParameter("username");
	String password = request.getParameter("password");
	
	// DB 에서 받아온 정보로 name과 password 를 비교
	// 위 받아온 데이터들을 DB에 저장 하는 방법을 해야함
	Connection conn = null;
	Boolean connect = false;
   	boolean isLogin = false; // html 부분에서 사용

   String sql = "SELECT * FROM users WHERE email = ? AND pw = ?";
   
   try {
         
   	Context init = new InitialContext();
   	DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/kndb");
   	conn = ds.getConnection();
   	
	PreparedStatement pstmt = conn.prepareStatement(sql);			
	pstmt.setString(1, name);
	pstmt.setString(2, password);
	
	ResultSet rs = pstmt.executeQuery();			

	if (rs.next()) {			
		System.out.println(rs.getString("name"));		
		System.out.println(" 님 반갑습니다!!");
		isLogin = true; // 데이터기 있으면 true 변경
	} else {			
		System.out.println("아이디가 없거나 패스워드가 틀립니다.");		
	}			
	
           connect = true;
           conn.close();
   } catch (Exception e) {
           connect = false;
           e.printStackTrace();
   }
        %>
        <%
                if (connect == true) {
        %>
        연결되었습니다.
        <%
                } else {
        %>
        연결에 실패하였습니다.
        <%
                }

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login/process.jsp</title>
</head>
<body>
<h1><b>로그인 처리</b></h1><br>

<% if (isLogin)	{ %>
	<script> alert("로그인 성공");</script>
	이름: <b style=" color: tomato;"><%=name %></b><br>
	암호: <b style=" color: tomato;"><%=password %></b><br>
	
<% } else { %>
	<script>
		alert("로그인 실패!!");
		location.href="../sign.jsp";
		
		</script>
<% } %>
<br>

</body>
</html>