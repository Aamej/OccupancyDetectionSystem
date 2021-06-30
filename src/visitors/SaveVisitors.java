package visitors;
import config.DbConfig;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/SaveVisitor")
public class SaveVisitors extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        String vname=req.getParameter("vname");
        String city=req.getParameter("city");
        String phone=req.getParameter("phone");
        String gender=req.getParameter("gender");
        String vtype=req.getParameter("vtype");
        
        
        try{
            Connection con=DbConfig.connect();
            ResultSet rs=con.createStatement().executeQuery("select count(*) as c from visitors");
            rs.next();
            int count=rs.getInt("c");
            String vid=String.valueOf(count+1);            
            PreparedStatement ps=con.prepareStatement("insert into visitors(vname,city,phone,gender,vtype,vid,photo) values(?,?,?,?,?,?,?)");
            ps.setString(1,vname);
            ps.setString(2,city);
            ps.setString(3,phone);
            ps.setString(4,gender);
            ps.setString(5,vtype);
            ps.setString(6,vid);
            ps.setString(7,"photos/"+vid+".jpg");
            ps.executeUpdate();            
            con.close();
            String server=getServletContext().getRealPath("/");
            Path source=Paths.get(server, "images","test.jpg");
            Path target=Paths.get(server,"photos",vid+".jpg");
            Files.copy(source, target, StandardCopyOption.REPLACE_EXISTING);
            session.setAttribute("msg", "Visitor added successfully");
            resp.sendRedirect("Visitors.jsp");
        }catch(Exception ex){
            resp.getWriter().println("Error "+ex.getMessage());
        }
    }
}
