<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
											
		conn = DriverManager.getConnection("jdbc:mysql://localhost:80/testdb","wespec","18gkdans");

		String query="select * from userinfo";
		pstmt = conn.prepareStatement(query);
		rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			String name = rs.getString(1);
			String id = rs.getString("id");
			String email = rs.getString("email");
			String part = rs.getString("part");
			int count = rs.getInt("count");
			int level = rs.getInt("level");
			
			out.println(name + " " +id + " " +email + " " +part + " " +count + " " +level + " ");
		}
		
	}
	catch (SQLException ex)
	{
		out.println("���� ���� ����");
	}
	finally
	{
		try { rs.close(); } catch(SQLException ex) { out.println("rs"); }  
		try { pstmt.close(); } catch(SQLException ex) { out.println("pstmt"); }  
		try { conn.close(); } catch(SQLException ex) { out.println("conn");}  
		
	}
			
%>