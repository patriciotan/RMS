/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rms.model.and.controller;



import java.sql.*;
import javax.sql.DataSource;
import javax.swing.tree.RowMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

/**
 *
 * @author Sean Patrick T. Tan
 */
public class RMSModel {
//    @Autowired
//    DataSource ds;
    
    String JDBC_DRIVER="com.mysql.jdbc.Driver";
    String DB_URL="jdbc:mysql://localhost/rms";
    String USER="root";
    String PASS="";
    String sql;
    PreparedStatement ps;
    Statement st;
    Connection con;
    ResultSet rs;
    
    public boolean canLogin(String username, String password) throws SQLException, ClassNotFoundException {
        Class.forName(JDBC_DRIVER);
        con = DriverManager.getConnection(DB_URL,USER,PASS);
        sql = "select * from user where username=? and password=?";
        ps = con.prepareStatement(sql);
        ps.setString(1, username);
        ps.setString(2, password);
        rs = ps.executeQuery();
        
        if(rs.first())
            return true;
        return false;
    }

    public boolean addOutlook(String name, String start, String end, String type, String status, String bUnit, int resNeeded, String reference) throws ClassNotFoundException, SQLException {
        Class.forName(JDBC_DRIVER);
        con = DriverManager.getConnection(DB_URL,USER,PASS);
        sql = "insert into project (name,start_date,end_date,type,status,business_unit,resources_needed,reference) values ('"+name+"','"+start+"','"+end+"','"+type+"','"+status+"','"+bUnit+"','"+resNeeded+"','"+reference+"')";
        System.out.println(sql);
        st = con.createStatement();
        if(st.executeUpdate(sql) > 0)
            return true;
        return false;
    }

    public boolean addProject(String name, String start, String end, String type, String status, String bUnit, String reference) throws ClassNotFoundException, SQLException {
        Class.forName(JDBC_DRIVER);
        con = DriverManager.getConnection(DB_URL,USER,PASS);
        sql = "insert into project (name,start_date,end_date,type,status,business_unit,reference) values ('"+name+"','"+start+"','"+end+"','"+type+"','"+status+"','"+bUnit+"','"+reference+"')";
        System.out.println(sql);
        st = con.createStatement();
        if(st.executeUpdate(sql) > 0)
            return true;
        return false;
    }
    
    public ResultSet getOutlook() throws ClassNotFoundException, SQLException
    {
        Class.forName(JDBC_DRIVER);
        con = DriverManager.getConnection(DB_URL,USER,PASS);
        sql = "select * from project where reference=?";
        ps = con.prepareStatement(sql);
        ps.setString(1, "outlook");
        rs = ps.executeQuery();
        
        return rs;
    }
    
    public ResultSet getSummary() throws ClassNotFoundException, SQLException
    {
        Class.forName(JDBC_DRIVER);
        con = DriverManager.getConnection(DB_URL,USER,PASS);
        sql = "select * from project where reference=?";
        ps = con.prepareStatement(sql);
        ps.setString(1, "summary");
        rs = ps.executeQuery();
        
        return rs;
    }
        
        
    
}
