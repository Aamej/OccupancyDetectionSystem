<%@page import="config.*"%>
<jsp:include page="header.jsp"></jsp:include>
    <h4 class="p-3">Admin Dashboard</h4>
    <div class="row">
        <div class="col-sm-3">
            <div class="card bg-primary text-white shadow text-center p-3">
                <h5>Registered Visitors</h5>
                <h4><%= DbConfig.CountRecords("visitors") %></h4>
            </div>
        </div>
        <div class="col-sm-3">
            <div class="card bg-primary text-white shadow text-center p-3">
            <h5>In Buildings</h5>
            <h4><%= DbConfig.CountInBuliding() %></h4>
            </div>
        </div>
        <div class="col-sm-3">
            <div class="card bg-primary text-white shadow text-center p-3">
            <h5>Upload Visitors</h5>
            <h4>Data</h4>
            </div>
        </div>
    </div>
<jsp:include page="footer.jsp"></jsp:include>
