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
import javax.servlet.http.*;
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
     
    public List getOutlook() throws Exception {
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
    public List getSummary() throws Exception {  
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
    public List getResources() throws Exception { 
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
    public ModelAndView loginSubmit(@ModelAttribute("user")User user, ModelMap model,HttpServletRequest request) throws Exception {
        ModelAndView mav = new ModelAndView("login"); 
        mav.addObject("title","RMS | Log in");   
        if(dbModel.canLogin(user.getUsername(), user.getPassword()))
        {
            request.getSession(true).setAttribute("sessVar",user.getUsername());
            mav = new ModelAndView("projectoutlook"); 
            mav.addObject("title","RMS | Project Outlook");
            mav.addObject("projects", getOutlook());
        }
        return mav;
    }
    
    @RequestMapping(value = "/logoutSubmit", method = RequestMethod.POST)
    public ModelAndView logoutSubmit(ModelMap model,HttpServletRequest request) throws Exception {
        ModelAndView mav = new ModelAndView("login"); 
        mav.addObject("title","RMS | Log in");
        request.getSession().invalidate();
        return mav;
    }
    
    @RequestMapping("/outlook")
    public ModelAndView viewOutlook(HttpServletRequest request) throws Exception {  
        
        ModelAndView mav = new ModelAndView("projectoutlook"); 
        if(request.getSession().getAttribute("sessVar")!=null){
            mav.addObject("title","RMS | Project Outlook");
            mav.addObject("projects", getOutlook());
        }else{
            mav=new ModelAndView("login"); 
            mav.addObject("title","RMS | Log in"); 
        }
        return mav;
    }  
    
    @RequestMapping("/pSummary")
    public ModelAndView viewPSummary(HttpServletRequest request) throws Exception {   
        ModelAndView mav = new ModelAndView("projectsummary"); 
        if(request.getSession().getAttribute("sessVar")!=null){
            mav.addObject("title","RMS | Project Summary");
            mav.addObject("projects", getSummary());
            mav.addObject("resources", getResources());
        }else{
            mav=new ModelAndView("login"); 
            mav.addObject("title","RMS | Log in"); 
        }
        return mav;
    }  
    
    @RequestMapping("/rSummary")
    public ModelAndView viewRSummary(HttpServletRequest request) throws Exception {   
        ModelAndView mav = new ModelAndView("resourcesummary"); 
        if(request.getSession().getAttribute("sessVar")!=null){
            mav.addObject("title","RMS | Resource Summary");
            mav.addObject("resources", getResources());
        }else{
            mav=new ModelAndView("login"); 
            mav.addObject("title","RMS | Log in"); 
        }
        return mav;
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
            mav = new ModelAndView("projectoutlook"); 
            mav.addObject("title","RMS | Project Outlook");
            mav.addObject("projects", getOutlook());
        }
        return mav;
    }
    
    @RequestMapping(value = "/delSummary", method = RequestMethod.POST)
    public ModelAndView delSummary(@ModelAttribute("project")Project project,ModelMap model) throws Exception{
        ModelAndView mav = new ModelAndView("addprojectfailed", "title", "RMS | Add Project Failed");
        
        if(dbModel.delSummary(project.getProjectId())){
            mav = new ModelAndView("projectsummary"); 
            mav.addObject("title","RMS | Project Summary");
            mav.addObject("projects", getSummary());
        }
        return mav;
    }
    
    @RequestMapping(value = "/editOutlook", method = RequestMethod.POST)
    public ModelAndView editOutlook(@ModelAttribute("project")Project project, ModelMap model) throws Exception {
        ModelAndView mav = new ModelAndView("addprojectfailed", "title", "RMS | Add Project Failed");
        
        if(dbModel.editOutlook(project.getName(),project.getStart(),project.getEnd(),project.getType(),project.getStatus(),project.getbUnit(),project.getResNeeded(),project.getProjectId()))
        {
            mav = new ModelAndView("projectoutlook"); 
            mav.addObject("title","RMS | Project Outlook");
            mav.addObject("projects", getOutlook());
        }
        return mav;
    } 
    
    @RequestMapping(value = "/editSummary", method = RequestMethod.POST)
    public ModelAndView editSummary(@ModelAttribute("project")Project project, ModelMap model) throws Exception {
        ModelAndView mav = new ModelAndView("addprojectfailed", "title", "RMS | Add Project Failed");
        
        if(dbModel.editSummary(project.getName(),project.getStart(),project.getEnd(),project.getType(),project.getbUnit(),project.getProjectId()))
        {
            mav = new ModelAndView("projectsummary"); 
            mav.addObject("title","RMS | Project Summary");
            mav.addObject("projects", getSummary());
        }
        return mav;
    } 
    
    @RequestMapping(value = "/assignResource", method = RequestMethod.POST)
    public ModelAndView assignResource(@ModelAttribute("effort")Effort effort, ModelMap model) throws Exception
    {
        ModelAndView mav = new ModelAndView("addprojectfailed", "title", "RMS | Add Project Failed");
        
        if(dbModel.assignResource(effort.getEmpName(),effort.getProjName(),effort.getYear(),effort.getMonths()))
        {
            mav = new ModelAndView("projectsummary"); 
            mav.addObject("title","RMS | Project Summary");
            mav.addObject("projects", getSummary());
        }
        return mav;
    }
    
}
