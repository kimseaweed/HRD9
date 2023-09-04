<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%
Connection conn=null;
PreparedStatement pstmt = null;
ResultSet rs = null;
int insert = 0;

try{
Class.forName("oracle.jdbc.OracleDriver");
conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");

//insert into TBL_class_202201 values('202203','10001','서울본원',100000,'100');
pstmt = conn.prepareStatement("insert into TBL_class_202201 values(?,?,?,?,?)");
pstmt.setString(1, request.getParameter("a") );
pstmt.setString(2, request.getParameter("c") );
pstmt.setString(3, request.getParameter("d") );
pstmt.setString(4, request.getParameter("f") );
pstmt.setString(5, request.getParameter("e") );
insert = pstmt.executeUpdate();
}catch(SQLIntegrityConstraintViolationException e){
	out.println("<script> alert('등록실패!'); history.back(); </script>");
}
if(insert==1){
	out.println("<script> alert('수강신청이 정상적으로 완료되었습니다!'); location.href='index.jsp'; </script>");
}

%>
<%
if(conn!=null){conn.close();}
if(pstmt!=null){pstmt.close();}
if(rs!=null){rs.close();}
%>