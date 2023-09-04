<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%
Connection conn;
PreparedStatement pstmt = null;
ResultSet rs = null;

Class.forName("oracle.jdbc.OracleDriver");
conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<section>
<% if(conn!=null) { out.println("연결완료");} else{out.println("연결실패");}  %>
</section>
<jsp:include page="footer.jsp"/>
</body>
</html>
<%
if(conn!=null){conn.close();}
if(pstmt!=null){pstmt.close();}
if(rs!=null){rs.close();}
%>