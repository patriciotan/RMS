/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rms.model.and.controller;



import java.sql.*;
import java.util.List;
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
    ResultSet rs=null;
    
    public RMSModel(){
        try{ 
            Class.forName(JDBC_DRIVER);
            con = DriverManager.getConnection(DB_URL,USER,PASS);
            st=con.createStatement();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    public boolean canLogin(String username, String password) throws Exception {
        sql = "select * from user where binary username=? and binary password=?";
        ps = con.prepareStatement(sql);
        ps.setString(1, username);
        ps.setString(2, password);
        rs = ps.executeQuery();
        
        if(rs.first())
            return true;
        return false;
    }
    
    public ResultSet getUser(String username, String password) throws Exception{
        sql = "select * from user where binary username=? and binary password=?";
        ps = con.prepareStatement(sql);
        ps.setString(1, username);
        ps.setString(2, password);
        rs = ps.executeQuery();
        
        return rs;
    }

    public boolean addOutlook(String name, String start, String end, String type, String status, String bUnit, int resNeeded, String reference, String created_by, String created_date) throws Exception {
        sql = "insert into project (name,start_date,end_date,type,status,business_unit,resources_needed,reference,created_by,created_date) values ('"+name+"','"+start+"','"+end+"','"+type+"','"+status+"','"+bUnit+"','"+resNeeded+"','"+reference+"','"+created_by+"','"+created_date+"')";
        System.out.println(sql);
        if(st.executeUpdate(sql) > 0)
            return true;
        return false;
    }

    public boolean addProject(String name, int clientId, String start, String end, String type, String status, String bUnit, String reference, int created_by, String created_date) throws Exception {
        sql = "insert into project (name,client_id,start_date,end_date,type,status,business_unit,reference,added_by,added_date) values ('"+name+"',"+clientId+",'"+start+"','"+end+"','"+type+"','"+status+"','"+bUnit+"','"+reference+"',"+created_by+",'"+created_date+"')";
        if(st.executeUpdate(sql) > 0)
            return true;
        return false;
    }
    
    public boolean addClient(String name, int addedBy, String addedDate) throws Exception {
        sql = "insert into client (name,added_by,added_date) values ('"+name+"',"+addedBy+",'"+addedDate+"')";
        System.out.println(sql);
        if(st.executeUpdate(sql) > 0)
            return true;
        return false;
    }
    
    public ResultSet getOutlook() throws Exception
    {
        sql = "select * from project where reference=? and status!=? order by added_date desc";
        ps = con.prepareStatement(sql);
        ps.setString(1, "Outlook");
        ps.setString(2, "Dropped");
        rs = ps.executeQuery();
        
        return rs;
    }
    
    public ResultSet getSummary() throws Exception
    {
        sql = "select * from project where reference=? and status!=? order by added_date desc";
        ps = con.prepareStatement(sql);
        ps.setString(1, "Summary");
        ps.setString(2, "Closed");
        rs = ps.executeQuery();
        
        return rs;
    }
    
    public ResultSet getEmployees() throws Exception
    {
        sql = "select * from resource";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        
        return rs;
    }
    
    public ResultSet getResource(int resId) throws Exception
    {
        sql = "SELECT resource.*,effort.* FROM resource JOIN effort ON resource.resource_id = effort.resource_id WHERE resource.resource_id=?";
        System.out.println(sql);
        ps = con.prepareStatement(sql);
        ps.setInt(1, resId);
        rs = ps.executeQuery();
        
        return rs;
    }
    
    public ResultSet getMyProjects(int resId) throws Exception
    {
        sql = "SELECT project.*,effort.* FROM project JOIN effort ON project.project_id = effort.project_id WHERE effort.resource_id=? and reference=? and status!=? order by project.added_date desc";
        System.out.println(sql);
        ps = con.prepareStatement(sql);
        ps.setInt(1, resId);
        ps.setString(2, "Summary");
        ps.setString(3, "Closed");
        rs = ps.executeQuery();
        
        return rs;
    }
    
    public ResultSet getTotalResources(int resId,int year) throws Exception
    {
        sql = "SELECT COALESCE(effort.year,?) as year,SUM(effort.jan) as jan,SUM(effort.feb) as feb,SUM(effort.mar) as mar,SUM(effort.apr) as apr,SUM(effort.may) as may,SUM(effort.jun) as jun,SUM(effort.jul) as jul,SUM(effort.aug) as aug,SUM(effort.sep) as sep,SUM(effort.oct) as oct,SUM(effort.nov) as nov,SUM(effort.dece) as dece FROM resource JOIN effort ON resource.resource_id= effort.resource_id WHERE resource.resource_id = ? AND effort.year=?";
        System.out.println(sql);
        ps = con.prepareStatement(sql);
        ps.setInt(1, year);
        ps.setInt(2, resId);
        ps.setInt(3, year);
        rs = ps.executeQuery();
        
        return rs;
    }
    
    public ResultSet getSpecificEmployeeTotalEffort(int year,int resId) throws Exception{
        sql = "SELECT SUM(jan) as jan,SUM(feb) as feb,SUM(mar) as mar,SUM(apr) as apr,SUM(may) as may,SUM(jun) as jun,SUM(jul) as jul,SUM(aug) as aug,SUM(sep) as sep,SUM(oct) as oct,SUM(nov) as nov,SUM(dece) as dece FROM effort WHERE resource_id=? AND year=?";
        ps = con.prepareStatement(sql);
        ps.setInt(1,resId);
        ps.setInt(2, year);
        rs = ps.executeQuery();
        
        return rs;
    }
    
    public ResultSet getSpecificEmployee(int id) throws Exception
    {
        sql = "select * from resource WHERE resource_id=?";
        ps = con.prepareStatement(sql);
        ps.setInt(1,id);
        rs = ps.executeQuery();
        
        return rs;
    }
    
    public ResultSet getResourcesTasks(int taskId) throws Exception
    {
        sql = "SELECT resource.*,effort.* FROM resource JOIN effort ON resource.resource_id = effort.resource_id WHERE effort.task_id = ?";
        System.out.println(sql);
        ps = con.prepareStatement(sql);
        ps.setInt(1, taskId);
        rs = ps.executeQuery();
        
        return rs;
    } 
    
    public ResultSet getTasksProjects(int projId) throws Exception
    {
        sql = "SELECT * FROM task WHERE project_id=?";
        System.out.println(sql);
        ps = con.prepareStatement(sql);
        ps.setInt(1, projId);
        rs = ps.executeQuery();
        
        return rs;
    }
        
    public ResultSet getEmployeeProjects(int resId) throws Exception
    {
        sql="SELECT DISTINCT project_id FROM `effort` WHERE resource_id=? order by added_date desc";
        ps = con.prepareStatement(sql);
        ps.setInt(1, resId);
        rs = ps.executeQuery();
        
        return rs;
    }
    
    public String getProjectName(int projId) throws Exception
    {
        sql="SELECT * FROM `project` WHERE project_id=?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, projId);
        rs = ps.executeQuery();
        rs.next();
        return rs.getString("name");
    }
    
    public boolean delProject(int projectId)throws Exception{
        sql="UPDATE project SET status='Dropped' WHERE project_id="+projectId;
        System.out.println(sql);
        if(st.executeUpdate(sql) > 0)
            return true;
        return false;
    }
    
    public boolean delSummary(int projectId)throws Exception{
        sql="DELETE FROM project WHERE project_id="+projectId;
        System.out.println(sql);
        if(st.executeUpdate(sql) > 0)
            return true;
        return false;
    }
        
    public boolean editOutlook(String name, String start, String end, String type, String status, String bUnit, int resNeeded,int projectId) throws Exception {
        sql = "UPDATE project SET name='"+name+"',start_date='"+start+"',end_date='"+end+"',type='"+type+"',status='"+status+"',business_unit='"+bUnit+"',resources_needed="+resNeeded+" WHERE project_id="+projectId;
        System.out.println(sql);
        if(st.executeUpdate(sql) > 0)
            return true;
        return false;
    }
    
    public boolean editSummary(String name, String start, String end, String type, String bUnit,int projectId, int updateBy, String updateDate) throws Exception {
        sql = "UPDATE project SET name='"+name+"',start_date='"+start+"',end_date='"+end+"',type='"+type+"',business_unit='"+bUnit+"',updated_by="+updateBy+",updated_date='"+updateDate+"' WHERE project_id="+projectId;
        System.out.println(sql);
        if(st.executeUpdate(sql) > 0)
            return true;
        return false;
    }
    
    public boolean assignResource(int empId,int taskId,int projId, int year, float jan, float feb, float mar, float apr, float may, float jun, float jul, float aug, float sep, float oct, float nov, float dece) throws Exception
    {
        sql = "insert into effort (project_id,task_id,resource_id,year,jan,feb,mar,apr,may,jun,jul,aug,sep,oct,nov,dece) values ("+projId+","+taskId+","+empId+","+year+","+jan+","+feb+","+mar+","+apr+","+may+","+jun+","+jul+","+aug+","+sep+","+oct+","+nov+","+dece+")";
        System.out.println("-------------------"+sql+"--------------------");
        if(st.executeUpdate(sql) > 0)
            return true;
        return false;
    }
    
    public boolean editResource(int effortId,int year, float jan, float feb, float mar, float apr, float may, float jun, float jul, float aug, float sep, float oct, float nov, float dece) throws Exception
    {
        sql="UPDATE effort SET jan=?, feb=?, mar=?, apr=?, may=?, jun=?, jul=?, aug=?, sep=?, oct=?, nov=?, dece=? WHERE effort_id=? AND year=?";
        ps = con.prepareStatement(sql);
        ps.setFloat(1,jan);
        ps.setFloat(2,feb);
        ps.setFloat(3,mar);
        ps.setFloat(4,apr);
        ps.setFloat(5,may);
        ps.setFloat(6,jun);
        ps.setFloat(7,jul);
        ps.setFloat(8,aug);
        ps.setFloat(9,sep);
        ps.setFloat(10,oct);
        ps.setFloat(11,nov);
        ps.setFloat(12,dece);
        ps.setInt(13,effortId);
        ps.setInt(14, year);
        if(ps.executeUpdate()==1)
            return true;
        return false;
    }
    
    public boolean deleteResource(int taskId,int empId) throws Exception
    {
        sql="DELETE FROM effort WHERE task_id=? AND resource_id=?";
        ps = con.prepareStatement(sql);
        ps.setInt(1,taskId);
        ps.setInt(2,empId);
        if(ps.executeUpdate()>0)
            return true;
        return false;
    }
    
    public int getTotalResources() throws Exception{
        sql = "SELECT COUNT(*) as total FROM resource";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        rs.next();
        return rs.getInt("total");
    }
    
    public int getTotalAlliance() throws Exception{
        sql = "SELECT COUNT(*) as alli FROM resource WHERE business_unit='Alliance'";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        rs.next();
        return rs.getInt("alli");
    }
    
    public int getTotalRow() throws Exception{
        sql = "SELECT COUNT(*) as row FROM resource WHERE business_unit='ROW'";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        rs.next();
        return rs.getInt("row");
    }
    
    public int getTotalJapan() throws Exception{
        sql = "SELECT COUNT(*) as jap FROM resource WHERE business_unit='JP Independent'";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        rs.next();
        return rs.getInt("jap");
    }
    
    public int getTotalPhilippines() throws Exception{
        sql = "SELECT COUNT(*) as ph FROM resource WHERE business_unit='Local'";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        rs.next();
        return rs.getInt("ph");
    }
    
    
    
    public ResultSet getClientProject() throws Exception{
        sql = "select client.name as cname,client.added_date,project.* from client JOIN project ON client.client_id=project.client_id";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        
        return rs;
    }
    
    public ResultSet getClient() throws Exception{
        sql = "select * FROM client ORDER BY added_date desc";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        
        return rs;
    }
    
    public ResultSet getSpecificClient(int id) throws Exception{
        sql = "select * from client where client_id="+id;
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        
        return rs;
    }
    
    public boolean addTask(String name,int projId,String start, String end) throws Exception{
        sql = "insert into task (name,project_id,start_date,end_date) values ('"+name+"',"+projId+",'"+start+"','"+end+"')";
        System.out.println(sql);
        if(st.executeUpdate(sql) > 0)
            return true;
        return false;
    }
    
    public boolean deleteTask(int projId,int taskId) throws Exception{
        sql = "DELETE FROM task where task_id=?";
        System.out.println(sql+taskId);
        ps = con.prepareStatement(sql);
        ps.setInt(1, taskId);
        ps.executeUpdate();
        return deleteResourcesInTask(projId, taskId);
    }
    
    public boolean deleteResourcesInTask(int projId,int taskId) throws Exception{
        sql= "DELETE FROM effort where task_id=? AND project_id=?";
        System.out.println(sql+taskId+"--"+projId);
        ps = con.prepareStatement(sql);
        ps.setInt(1, taskId);
        ps.setInt(2,projId);
        if(ps.executeUpdate() > 0)
            return true;
        return false;
    }
    
    public boolean editTask(int taskId, String name, String status) throws Exception{
        sql = "UPDATE task SET name=?, status=? WHERE task_id=?";
        System.out.println(sql+taskId);
        ps = con.prepareStatement(sql);
        ps.setString(1, name);
        ps.setString(2, status);
        ps.setInt(3, taskId);
         if(ps.executeUpdate() > 0)
            return true;
        return false;
    }
}
