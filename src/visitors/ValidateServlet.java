package visitors;

import config.DbConfig;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Validate")
public class ValidateServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userid=req.getParameter("userid");
        String pwd=req.getParameter("pwd");
        HttpSession session=req.getSession();
        try{
            Connection con=DbConfig.connect();
            PreparedStatement ps=con.prepareStatement("select * from users where userid=? and pwd=?");
            ps.setString(1,userid);
            ps.setString(2,pwd);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                con.close();
                session.setAttribute("userid", userid);
                resp.sendRedirect("dashboard.jsp");
            }else{
                con.close();
                session.setAttribute("error", "Invalid userid or password");
                resp.sendRedirect("index.jsp");
            }
        }
        catch(Exception ex){
            resp.getWriter().println("Error "+ex.getMessage());
        }
    }
    
    
}
