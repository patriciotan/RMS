/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rms.model.and.controller;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
/**
 *
 * @author Sean Patrick T. Tan
 */
@Controller
public class RMSController {
    
    RMSModel dbModel = new RMSModel();
     
    public ModelAndView getOutlook() throws ClassNotFoundException, SQLException {  
        ResultSet rs = dbModel.getOutlook();
        ModelAndView mav = new ModelAndView("projectoutlook"); 
        mav.addObject("title","RMS | Project Outlook");
        List<Project> projects=new ArrayList<Project>();
        while(rs.next()){
            Project project = new Project();
            project.setName(rs.getString("name"));
            project.setStart(rs.getString("start_date"));
            project.setEnd(rs.getString("end_date"));
            project.setType(rs.getString("type"));
            project.setStatus(rs.getString("status"));
            project.setbUnit(rs.getString("business_unit"));
            project.setResNeeded(rs.getInt("resources_needed"));
            projects.add(project);
        }
        mav.addObject("projects", projects);
        return mav;
    }  
    public ModelAndView getSummary() throws ClassNotFoundException, SQLException {  
        ResultSet rs = dbModel.getSummary();
        ModelAndView mav = new ModelAndView("projectsummary"); 
        mav.addObject("title","RMS | Project Summary");
        List<Project> projects=new ArrayList<Project>();
        while(rs.next()){
            Project project = new Project();
            project.setName(rs.getString("name"));
            project.setStart(rs.getString("start_date"));
            project.setEnd(rs.getString("end_date"));
            project.setType(rs.getString("type"));
            project.setStatus(rs.getString("status"));
            project.setbUnit(rs.getString("business_unit"));
            projects.add(project);
        }
        mav.addObject("projects", projects);
        return mav;
    } 
    public ModelAndView getResources() throws ClassNotFoundException, SQLException {  
        ResultSet rs = dbModel.getResources();
        ModelAndView mav = new ModelAndView("resourcesummary"); 
        mav.addObject("title","RMS | Resource Summary");
        List<Resource> resources=new ArrayList<Resource>();
        while(rs.next()){
            Resource resource = new Resource();
            resource.setFname(rs.getString("first_name"));
            resource.setLname(rs.getString("last_name"));
            resource.setbUnit(rs.getString("business_unit"));
            resource.setDateHired(rs.getString("date_hired"));
            resources.add(resource);
        }
        mav.addObject("resources", resources);
        return mav;
    } 
    
    @RequestMapping("/login")
    public ModelAndView login() {   
        ModelAndView mav = new ModelAndView("login", "title", "RMS | Log in"); 
        
        return mav;
    }  
    
    @RequestMapping(value = "/loginSubmit", method = RequestMethod.POST)
    public ModelAndView loginSubmit(@ModelAttribute("user")User user, ModelMap model) throws SQLException, ClassNotFoundException {
        ModelAndView mav = new ModelAndView("login"); 
        mav.addObject("title","RMS | Log in");   
        if(dbModel.canLogin(user.getUsername(), user.getPassword()))
        {
            return getOutlook();
        }
        return mav;
    } 
    
    @RequestMapping("/outlook")
    public ModelAndView viewOutlook() throws ClassNotFoundException, SQLException {   
        return getOutlook();
    }  
    
    @RequestMapping("/pSummary")
    public ModelAndView viewPSummary() throws ClassNotFoundException, SQLException {   
        return getSummary();
    }  
    
    @RequestMapping("/rSummary")
    public ModelAndView viewRSummary() throws ClassNotFoundException, SQLException {     
        return getResources();
    }  
    
    @RequestMapping(value = "/addOutlook", method = RequestMethod.POST)
    public ModelAndView addOutlook(@ModelAttribute("project")Project project, ModelMap model) throws ClassNotFoundException, SQLException, ParseException {
        ModelAndView mav = new ModelAndView("addprojectfailed", "title", "RMS | Add Project Failed");
        
        if(dbModel.addOutlook(project.getName(),project.getStart(),project.getEnd(),project.getType(),project.getStatus(),project.getbUnit(),project.getResNeeded(),project.getReference()))
        {
            return getOutlook();
        }
        return mav;
    } 
    
    @RequestMapping(value = "/addProject", method = RequestMethod.POST)
    public ModelAndView addProject(@ModelAttribute("project")Project project, ModelMap model) throws ClassNotFoundException, SQLException, ParseException {
        ModelAndView mav = new ModelAndView("addprojectfailed", "title", "RMS | Add Project Failed");
        
        if(dbModel.addProject(project.getName(),project.getStart(),project.getEnd(),project.getType(),project.getStatus(),project.getbUnit(),project.getReference()))
        {
            return getSummary();
        }
        return mav;
    }
    
}
