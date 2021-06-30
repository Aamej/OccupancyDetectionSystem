<jsp:include page="header.jsp"></jsp:include>
    <h4 class="p-3">Change Password</h4>
    <div class="row">
        <div class="col-sm-5 mx-auto">

            <form method="post" action="ChangePassword">
                <input type="hidden" name="userid" value="${sessionScope.userid}">
            <div class="form-group">
                <label>Current Password</label>
                <input type="password" required name="pwd" class="form-control"
                       placeholder="Current Password">
            </div>
            <div class="form-group">
                <label>New Password</label>
                <input type="password" required name="npwd" class="form-control"
                       placeholder="Current Password">
            </div>
            <div class="form-group">
                <label>Confirm Password</label>
                <input type="password" required name="cpwd" class="form-control"
                       placeholder="Current Password">
            </div>
            <input type="submit" value="Change Password" class="btn btn-primary btn-block">
        </form>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>