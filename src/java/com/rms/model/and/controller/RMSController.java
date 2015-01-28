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
     
<<<<<<< HEAD
    public List getOutlook() throws ClassNotFoundException, SQLException {  
=======
    public ModelAndView getOutlook() throws Exception {  
>>>>>>> 356b3ef007c7b0d3c56098f73daabc9e21e45522
        ResultSet rs = dbModel.getOutlook();
        List<Project> projects=new ArrayList<>();
        while(rs.next()){
            Project project = new Project();
            project.setProjectId(rs.getInt("project_id"));
            project.setName(rs.getString("name"));
            project.setStart(rs.getString("start_date"));
            project.setEnd(rs.getString("end_date"));
            project.setType(rs.getString("type"));
            project.setStatus(rs.getString("status"));
            project.setbUnit(rs.getString("business_unit"));
            project.setResNeeded(rs.getInt("resources_needed"));
            projects.add(project);
        }
        return projects;
    }  
<<<<<<< HEAD
    public List getSummary() throws ClassNotFoundException, SQLException {  
=======
    public ModelAndView getSummary() throws Exception {  
>>>>>>> 356b3ef007c7b0d3c56098f73daabc9e21e45522
        ResultSet rs = dbModel.getSummary();
        List<Project> projects=new ArrayList<>();
        while(rs.next()){
            Project project = new Project();
            project.setProjectId(rs.getInt("project_id"));
            project.setName(rs.getString("name"));
            project.setStart(rs.getString("start_date"));
            project.setEnd(rs.getString("end_date"));
            project.setType(rs.getString("type"));
            project.setStatus(rs.getString("status"));
            project.setbUnit(rs.getString("business_unit"));
            projects.add(project);
        }
        return projects;
    } 
<<<<<<< HEAD
    public List getResources() throws ClassNotFoundException, SQLException {  
=======
    public ModelAndView getResources() throws Exception {  
>>>>>>> 356b3ef007c7b0d3c56098f73daabc9e21e45522
        ResultSet rs = dbModel.getResources();
        List<Resource> resources=new ArrayList<>();
        while(rs.next()){
            Resource resource = new Resource();
            resource.setResourceId(rs.getInt("resource_id"));
            resource.setFname(rs.getString("first_name"));
            resource.setMname(rs.getString("middle_name"));
            resource.setLname(rs.getString("last_name"));
            resource.setbUnit(rs.getString("business_unit"));
            resource.setDateHired(rs.getString("date_hired"));
            resources.add(resource);
        }
        return resources;
    } 
    
    @RequestMapping("/login")
    public ModelAndView login() {   
        ModelAndView mav = new ModelAndView("login", "title", "RMS | Log in"); 
        
        return mav;
    }  
    
    @RequestMapping(value = "/loginSubmit", method = RequestMethod.POST)
    public ModelAndView loginSubmit(@ModelAttribute("user")User user, ModelMap model) throws Exception {
        ModelAndView mav = new ModelAndView("login"); 
        mav.addObject("title","RMS | Log in");   
        if(dbModel.canLogin(user.getUsername(), user.getPassword()))
        {
            mav = new ModelAndView("projectoutlook"); 
            mav.addObject("title","RMS | Project Outlook");
            mav.addObject("projects", getOutlook());
        }
        return mav;
    } 
    
    @RequestMapping("/outlook")
<<<<<<< HEAD
    public ModelAndView viewOutlook() throws ClassNotFoundException, SQLException {   
        ModelAndView mav = new ModelAndView("projectoutlook"); 
        mav.addObject("title","RMS | Project Outlook");
        mav.addObject("projects", getOutlook());
        
        return mav;
    }  
    
    @RequestMapping("/pSummary")
    public ModelAndView viewPSummary() throws ClassNotFoundException, SQLException {   
        ModelAndView mav = new ModelAndView("projectsummary"); 
        mav.addObject("title","RMS | Project Summary");
        mav.addObject("projects", getSummary());
        
        return mav;
    }  
    
    @RequestMapping("/rSummary")
    public ModelAndView viewRSummary() throws ClassNotFoundException, SQLException {   
        ModelAndView mav = new ModelAndView("resourcesummary"); 
        mav.addObject("title","RMS | Resource Summary");
        mav.addObject("resources", getResources());
        
        return mav;
=======
    public ModelAndView viewOutlook() throws Exception {   
        return getOutlook();
    }  
    
    @RequestMapping("/pSummary")
    public ModelAndView viewPSummary() throws Exception {   
        return getSummary();
    }  
    
    @RequestMapping("/rSummary")
    public ModelAndView viewRSummary() throws Exception {     
        return getResources();
>>>>>>> 356b3ef007c7b0d3c56098f73daabc9e21e45522
    }  
    
    @RequestMapping(value = "/addOutlook", method = RequestMethod.POST)
    public ModelAndView addOutlook(@ModelAttribute("project")Project project, ModelMap model) throws Exception {
        ModelAndView mav = new ModelAndView("addprojectfailed", "title", "RMS | Add Project Failed");
        
        if(dbModel.addOutlook(project.getName(),project.getStart(),project.getEnd(),project.getType(),project.getStatus(),project.getbUnit(),project.getResNeeded(),project.getReference()))
        {
            mav = new ModelAndView("projectoutlook"); 
            mav.addObject("title","RMS | Project Outlook");
            mav.addObject("projects", getOutlook());
        }
        return mav;
    } 
    
    @RequestMapping(value = "/addProject", method = RequestMethod.POST)
    public ModelAndView addProject(@ModelAttribute("project")Project project, ModelMap model) throws Exception {
        ModelAndView mav = new ModelAndView("addprojectfailed", "title", "RMS | Add Project Failed");
        
        if(dbModel.addProject(project.getName(),project.getStart(),project.getEnd(),project.getType(),project.getStatus(),project.getbUnit(),project.getReference()))
        {
            mav = new ModelAndView("projectsummary"); 
            mav.addObject("title","RMS | Project Summary");
            mav.addObject("projects", getSummary());
        }
        return mav;
    }
    
    @RequestMapping(value = "/delProject", method = RequestMethod.POST)
    public ModelAndView delProject(@ModelAttribute("project")Project project,ModelMap model) throws Exception{
        ModelAndView mav = new ModelAndView("addprojectfailed", "title", "RMS | Add Project Failed");
        
        if(dbModel.delProject(project.getProjectId())){
            return getOutlook();
        }
        return mav;
    }
    
    @RequestMapping(value = "/delSummary", method = RequestMethod.POST)
    public ModelAndView delSummary(@ModelAttribute("project")Project project,ModelMap model) throws Exception{
        ModelAndView mav = new ModelAndView("addprojectfailed", "title", "RMS | Add Project Failed");
        
        if(dbModel.delSummary(project.getProjectId())){
            return getSummary();
        }
        return mav;
    }
    
    @RequestMapping(value = "/editOutlook", method = RequestMethod.POST)
    public ModelAndView editOutlook(@ModelAttribute("project")Project project, ModelMap model) throws Exception {
        ModelAndView mav = new ModelAndView("addprojectfailed", "title", "RMS | Add Project Failed");
        
        if(dbModel.editOutlook(project.getName(),project.getStart(),project.getEnd(),project.getType(),project.getStatus(),project.getbUnit(),project.getResNeeded(),project.getProjectId()))
        {
            return getOutlook();
        }
        return mav;
    } 
    
    @RequestMapping(value = "/editSummary", method = RequestMethod.POST)
    public ModelAndView editSummary(@ModelAttribute("project")Project project, ModelMap model) throws Exception {
        ModelAndView mav = new ModelAndView("addprojectfailed", "title", "RMS | Add Project Failed");
        
        if(dbModel.editSummary(project.getName(),project.getStart(),project.getEnd(),project.getType(),project.getbUnit(),project.getProjectId()))
        {
            return getSummary();
        }
        return mav;
    } 
    
}
