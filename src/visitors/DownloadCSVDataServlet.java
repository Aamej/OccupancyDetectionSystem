package visitors;

import config.DbConfig;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Download")
public class DownloadCSVDataServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setHeader("Content-Type", "text/csv");
        resp.setHeader("Content-Disposition", "attachment;filename=\"file.csv\"");
        try {
            Connection con = DbConfig.connect();
            String sql = "select * from visitorsdata where entrydate=date(now()) and outtime is null";
            ResultSet rs = con.createStatement().executeQuery(sql);
            List<List<String>> data = new ArrayList<>();
            BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(resp.getOutputStream(), "UTF-8"));
            
            writer.append("Visitor Id,Entry Date,In Time,Out Time");
            writer.newLine();
            
            while (rs.next()) {
                writer.append(String.format("%s,%s,%s,",rs.getString("vid"), rs.getString("entrydate"),
                       rs.getString("intime")));
                writer.newLine();
            }
            writer.flush();
            con.close();
            
        } catch (Exception ex) {
            System.out.println("Error " + ex.getMessage());
        }
    }
}
