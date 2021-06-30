package config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

public class DbConfig {
    public static Connection connect() throws Exception {
        final String DBNAME="vmsdb";
        final  String URL="jdbc:mysql://localhost/"+DBNAME;
        final  String USER="root";
        final  String PWD="";
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection(URL, USER, PWD);
        return con;
    }
    
    public static int CountRecords(String table) throws Exception {
        Connection con=connect();
        ResultSet rs=con.createStatement().executeQuery("select count(*) as count from "+table);
        rs.next();
        int data=rs.getInt("count");
        rs.close();
        con.close();
        return data;
    }
    
    public static int CountInBuliding() throws Exception {
        Connection con=connect();
        String sql="select count(*) as count from visitorsdata where entrydate=date(now()) and outtime is null";
        ResultSet rs=con.createStatement().executeQuery(sql);
        rs.next();
        int data=rs.getInt("count");
        rs.close();
        con.close();
        return data;
    }
}
