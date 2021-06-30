package visitors;

import config.DbConfig;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Time;
import java.time.LocalTime;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/UploadData")
@MultipartConfig
public class UploadDataServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            HttpSession session = req.getSession();
            Part part = req.getPart("data");
            BufferedReader br = new BufferedReader(new InputStreamReader(part.getInputStream()));
            String header = br.readLine();
            Connection con = DbConfig.connect();
            CallableStatement ps = con.prepareCall("call visitorsEntry(?,?,?,?)");
            while (true) {
                String line = br.readLine();
                if (line == null) {
                    break;
                }
                saveData(line.split(","), ps);
            }
            con.close();
            br.close();
            session.setAttribute("msg", "Data Uploaded successfully");
            resp.sendRedirect("UploadData.jsp");
        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

    private void saveData(String[] data, PreparedStatement ps) throws Exception {
        LocalTime lt1=LocalTime.parse(data[2]);
        if(data.length==3){
            ps.setTime(4,null);
        }else{
            LocalTime lt2=LocalTime.parse(data[3]);
            ps.setTime(4,Time.valueOf(lt2)); 
        }
        ps.setString(1, data[0]);
        ps.setString(2, data[1]);
        ps.setTime(3,Time.valueOf(lt1));
               
        ps.executeUpdate();

    }
}
