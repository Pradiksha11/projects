<%-- 
    Document   : productadmi
    Created on : 4 Sep, 2022, 11:46:10 AM
    Author     : ashok
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <style>
            table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  text-align: left;
  padding: 8px;
}
tr:nth-child(even) {background-color: #f2f2f2;}
        </style>
    </head>
    <body style="background-color:powderblue;">
         <h1 style='text-align: center'>Billing System</h1>
        <div class="w3-bar w3-black">
  <a href="productadmi.jsp" class="w3-bar-item w3-button">Home</a>
  <a href='addproduct.jsp' class="w3-bar-item w3-button">Add new product</a>
  <a href="#" class="w3-bar-item w3-button">Link 2</a>
  <a href="#" class="w3-bar-item w3-button">Link 3</a>
</div>
         <table style="margin-left: auto;margin-right: auto; border: 1px solid black;">
                    <tr>
                        <th>S.no</th><th>Products</th><th>Cost</th><th>Edit</th><th>Delete</th></tr>
                     <%@ page import="java.sql.*" %>
                        <%
                            
                            Connection conn = null; 
                           try {  
            
            String url = "jdbc:sqlite:C:/Users/ashok/Desktop/Billing/sqlite.db";  
            Class.forName("org.sqlite.JDBC");
            conn = DriverManager.getConnection(url);  
            Statement stmt  = conn.createStatement();  
            ResultSet rs    = stmt.executeQuery("select * from product");  
        
            while (rs.next()) {  
                String sno = rs.getString("sno");
                String product = rs.getString("product");         
                String cost=rs.getString("cost");
                out.println("<tr><td>"+sno+"</td><td>"+product+"</td><td>"+cost+"</td><td><a href='edit.jsp?sno="+sno+"'>Edit</a></td><td><a href='delete.jsp?sno="+sno+"'>Delete</a></td></tr>");
                
            }
            out.println("");
              
        } catch (SQLException e) {  
            out.println(e.getMessage());  
        } finally {  
            try {  
                if (conn != null) {  
                    conn.close();  
                }  
            } catch (SQLException ex) {  
                out.println(ex.getMessage());  
            }  
        } %>
    </body>
</html>
