<%@page import="java.sql.ResultSet"%>
<%@page import="config.*"%>
<%@page import="java.sql.Connection"%>
<jsp:include page="header.jsp"></jsp:include>
    <h4 class="p-3">Visitors Report</h4>
    <div class="card text-center m-3">
        <div class="row">
            <div class="col-sm-10 text-center mx-auto p-2">
                <form class="form-inline">
                    <label class="mr-sm-2">Date :</label>
                    <input type="date" id="rdate" class="form-control mr-sm-2" value="${param.rdate}" name="rdate">
                    <label class="mr-sm-2">In Time :</label>
                    <input type="time" id="intime" class="form-control mr-sm-2" value="${param.in}" name="in">
                    <label class="mr-sm-2">Out Time :</label>
                    <input type="time" id="outtime" class="form-control mr-sm-2" name="out" value="${param.out}">
                    <input type="submit" value="Filter" class="btn btn-primary">
                </form>
            </div>
        </div>
    </div>
    <table class="table table-border shadow">
        <thead>
            <tr>
                <th>Id</th>
                <th>Visitor ID</th>
                <th>Date</th>                
                <th>In Time</th>                
                <th>Out Time</th>                                
            </tr>
        </thead>
        <tbody>
        <%
            Connection con = DbConfig.connect();
            String sql="";
            if(request.getParameter("rdate")!=null){
                String rdate=request.getParameter("rdate");
                String intime=request.getParameter("in");
                String outtime=request.getParameter("out");
                sql=String.format("select * from visitorsdata where entrydate='%s' and intime between '%s' and '%s' and outtime>'%s'",rdate,intime,outtime,outtime);
            }
            else{
                sql="select * from visitorsdata";
            }
            ResultSet rs = con.createStatement().executeQuery(sql);
            while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("id")%></td>
            <td><%= rs.getString("vid")%></td>
            <td><%= rs.getString("entrydate")%></td>
            <td><%= rs.getString("intime")%></td>
            <td><%= rs.getString("outtime")==null ? "In Building" : rs.getString("outtime")%></td>                
        </tr>
        <%
            }
            con.close();
        %>
    </tbody>
</table>
<script>
    $(function(){
       document.querySelector("#rdate").valueAsDate=new Date();        
    });
</script>
<jsp:include page="footer.jsp"></jsp:include>