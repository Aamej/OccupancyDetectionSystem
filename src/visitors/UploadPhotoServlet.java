package visitors;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/UploadPhoto")
@MultipartConfig
public class UploadPhotoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        Part photo=req.getPart("webcam");
        String path=getServletContext().getRealPath("/images/");
        photo.write(path+"test.jpg");
        resp.getWriter().println(path+"test.jpg");
    }
}
