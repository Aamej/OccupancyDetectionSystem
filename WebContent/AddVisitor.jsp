<jsp:include page="header.jsp"></jsp:include>
<script src="js/webcam.min.js"></script>
    <h4 class="p-3">Add New Visitor</h4>
    <div class="form-row">
        <div class="col-sm-2 text-center">
            <img src="images/logo.png" id="pic" class="img-fluid mb-2">
            <button data-target="#cam" data-toggle="modal" class="btn btn-success btn-sm">Pick From Camera</button>
        </div>
        <div class="col-sm-8">
            <form method="post" action="SaveVisitor">
            <div class="form-row">
                <div class="col-sm-6">
                    <div class="form-group">
                        <label>Visitor Name</label>
                        <input type="text" class="form-control form-control-sm" name="vname">
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group">
                        <label>Visitor City</label>
                        <input type="text" class="form-control form-control-sm" name="city">
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group">
                        <label>Visitor Phone</label>
                        <input type="text" maxlength="10" class="form-control form-control-sm" name="phone">
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group">
                        <label>Visitor Gender</label>
                        <select class="form-control form-control-sm" name="gender">
                            <option value="">--- Select Gender ---</option>
                            <option>Male</option>                            
                            <option>Female</option>                            
                        </select>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group">
                        <label>Visitor Type</label>
                        <select class="form-control form-control-sm" name="vtype">
                            <option value="">--- Select Type ---</option>
                            <option>Employee</option>                            
                            <option>Guest</option>                            
                        </select>
                    </div>
                </div>                
            </div>
            <input type="submit" value="Save Data" class="btn btn-primary btn-sm">
            </form>
        </div>
    </div>
    <div class="modal" id="cam">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5>Click Photo</h5>
                    <button type="button" onclick="Webcam.reset();" data-dismiss="modal" class="close">&times;</button>
                </div>
                <div class="modal-body">
                    <div id="my_camera" class="card" style="height:300px;">
                        
                    </div>
                </div>
                <div class="modal-footer">                    
                    <button onclick="showcam()" class="btn btn-primary btn-sm">Ready Camera</button>
                    <button onclick="take_snapshot()" data-dismiss="modal" class="btn btn-primary btn-sm">Save Photo</button>
                </div>
            </div>
        </div>
    </div>
    <script language="JavaScript">
function showcam(){
Webcam.set({
  width: 320,
  height: 240,
  image_format: 'jpeg',
  jpeg_quality: 90
 });
Webcam.attach( '#my_camera' );
}

function take_snapshot() {

 Webcam.snap( function(data_uri) {
    Webcam.upload( data_uri, 'UploadPhoto', function(code, text,Name) {
        document.getElementById("pic").src=data_uri;                    
        Webcam.reset();
 } );
  
  
 } );
}

</script>
<jsp:include page="footer.jsp"></jsp:include>