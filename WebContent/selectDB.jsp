<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.sun.corba.se.pept.transport.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Connection conn = null;
String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:KnDB";

Boolean connect = false;

try {
        String sql = "select * from users shere name = ?";
        Class.forName(driver);
        conn = DriverManager.getConnection(url, "knuser", "system"); //자신의 아이디와 비밀번호
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, "김은주");
        ResultSet rs = pstmt.executeQuery();
        
        if (rs.next()) {
        	System.out.println(rs.getString("name"));
        	System.out.println(rs.getString("pass"));
        	System.out.println(rs.getString("email"));
        
        	
        } else {
        	System.out.println("아이디가 없습니다");
        
        
        }
        
        
       //pstmt.setString(1,"추연진");
        //pstmt.setString(2,"1234");
        //pstmt.setString(3,"choo@a.com");
       // pstmt.executeLargeUpdate();
        
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
</body>
</html>