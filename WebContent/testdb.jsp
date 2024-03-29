<%@page import="java.sql.ResultSet"%>			
<%@page import="java.sql.PreparedStatement"%>		
<%@page import="javax.sql.DataSource"%>		
<%@page import="javax.naming.InitialContext"%>		
<%@page import="javax.naming.Context"%>		
<%@page import="java.sql.Connection"%>				
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

                String sql = "SELECT * FROM users WHERE email = ? AND pw = ?";
                
                try {
                      
                	Context init = new InitialContext();
                	DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/kndb");
                	conn = ds.getConnection();
                	
            		PreparedStatement pstmt = conn.prepareStatement(sql);			
            		pstmt.setString(1, "a@a.com");
            		pstmt.setString(2, "2");
            		
            		ResultSet rs = pstmt.executeQuery();			
    				
            		if (rs.next()) {			
            			System.out.println(rs.getString("name"));		
            			System.out.println(rs.getString("pw"));		
            			System.out.println(rs.getString("email"));		
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
</body>
</html>