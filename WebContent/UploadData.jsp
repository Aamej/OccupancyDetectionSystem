<jsp:include page="header.jsp"></jsp:include>
    <h4 class="p-3">Upload Data</h4>
    <div class="container">
        <a href="Download" class="btn btn-primary btn-sm float-right m-2">Download Sample File</a>
        <form method="post" action="UploadData" enctype="multipart/form-data">
            <div class="row">
                 <div class="col-sm-3">
                     <input type="file" name="data" accept=".csv" class="form-control-file">                     
                 </div>
                <div class="col-sm-1">
                    <input type="submit" value="Upload Data" class="btn btn-primary">
                </div>
            </div>            
        </form>
    </div>
<jsp:include page="footer.jsp"></jsp:include>