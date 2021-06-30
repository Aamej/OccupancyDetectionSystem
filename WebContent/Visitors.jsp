<%@page import="java.sql.ResultSet"%>
<%@page import="config.*"%>
<%@page import="java.sql.Connection"%>
<jsp:include page="header.jsp"></jsp:include>
<a href="AddVisitor.jsp" class="btn btn-sm btn-primary float-right m-2">Add Visitor</a>
    <h4 class="p-3">Visitors Module</h4>
    
    <table class="table table-border shadow">
        <thead>
            <tr>
                <th>Visitor Id</th>
                <th>Visitor Name</th>
                <th>City</th>                
                <th>Phone</th>                
                <th>Gender</th>                
                <th>Visitor Type</th> 
                <th>Photo</th>
            </tr>
        </thead>
        <tbody>
            <%
                Connection con=DbConfig.connect();
                ResultSet rs=con.createStatement().executeQuery("select * from visitors");
                while(rs.next()){
                %>
            <tr>
                <td><%= rs.getString("vid") %></td>
                <td><%= rs.getString("vname") %></td>
                <td><%= rs.getString("city") %></td>
                <td><%= rs.getString("phone") %></td>
                <td><%= rs.getString("gender") %></td>
                <td><%= rs.getString("vtype") %></td>
                <td><img style="width:100px;" src="<%= rs.getString("photo") %>" class="img-thumbnail"></td>
            </tr>
            <% 
                }
                con.close();
                %>
        </tbody>
    </table>
    
<jsp:include page="footer.jsp"></jsp:include>