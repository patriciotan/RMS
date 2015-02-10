/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rms.model.and.controller;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import javax.servlet.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
    public List getEmployees() throws Exception { 
        ResultSet rs = dbModel.getEmployees();
        List<Employee> employees=new ArrayList<>();
        while(rs.next()){
            Employee employee = new Employee();
            employee.setEmpId(rs.getInt("resource_id"));
            employee.setFname(rs.getString("first_name"));
            employee.setMname(rs.getString("middle_name"));
            employee.setLname(rs.getString("last_name"));
            employee.setbUnit(rs.getString("business_unit"));
            employee.setDateHired(rs.getString("date_hired"));
            employees.add(employee);
        }
        return employees;
    } 
    public List getResources() throws Exception {
        Calendar c = Calendar.getInstance();
        int year=c.get(Calendar.YEAR);
        List<Employee> employees = getEmployees();
        List<Resource> resources=new ArrayList<>();
        for(int i=0;i<employees.size();i++)
        {
            ResultSet rs = dbModel.getTotalResources(employees.get(i).getEmpId(),year);
            Resource resource = new Resource();
            rs.next();
            resource.setEmpId(employees.get(i).getEmpId());
            resource.setFname(employees.get(i).getFname());
            resource.setMname(employees.get(i).getMname());
            resource.setLname(employees.get(i).getLname());
            resource.setYear(rs.getInt("year"));
            resource.setJan(rs.getFloat("jan"));
            resource.setFeb(rs.getFloat("feb"));
            resource.setMar(rs.getFloat("mar"));
            resource.setApr(rs.getFloat("apr"));
            resource.setMay(rs.getFloat("may"));
            resource.setJun(rs.getFloat("jun"));
            resource.setJul(rs.getFloat("jul"));
            resource.setAug(rs.getFloat("aug"));
            resource.setSep(rs.getFloat("sep"));
            resource.setOct(rs.getFloat("oct"));
            resource.setNov(rs.getFloat("nov"));
            resource.setDece(rs.getFloat("dece"));
            resources.add(resource);
        }
        return resources;
    }
    
    @RequestMapping("/login")
    public ModelAndView login(HttpServletRequest request) {   
        ModelAndView mav = new ModelAndView("login", "title", "RMS | Log in"); 
        if(request.getSession().getAttribute("sessVar")!=null){
            mav = new ModelAndView("redirect:/outlook");
        }
        return mav;
    }  
    
    @RequestMapping(value = "/loginSubmit", method = RequestMethod.POST)
    public ModelAndView loginSubmit(@ModelAttribute("user")User user, ModelMap model,HttpServletRequest request) throws Exception {
        ModelAndView mav = new ModelAndView("redirect:/login"); 
        mav.addObject("title","RMS | Log in");   
        if(dbModel.canLogin(user.getUsername(), user.getPassword()))
        {
            request.getSession(true).setAttribute("sessVar",user.getUsername());
            mav = new ModelAndView("redirect:/dashboard"); 
            mav.addObject("title","RMS | Dashboard");
        }
        return mav;
    }
    
    @RequestMapping(value = "/logoutSubmit", method = RequestMethod.POST)
    public ModelAndView logoutSubmit(ModelMap model,HttpServletRequest request) throws Exception {
        ModelAndView mav = new ModelAndView("redirect:/login"); 
        mav.addObject("title","RMS | Log in");
        request.getSession().invalidate();
        return mav;
    }
    
    @RequestMapping("/dashboard")
    public ModelAndView viewDashboard(HttpServletRequest request) throws Exception {  
        
        ModelAndView mav = new ModelAndView("dashboard"); 
        if(request.getSession().getAttribute("sessVar")!=null){
            mav.addObject("title","RMS | Dashboard");
        }else{
            mav=new ModelAndView("redirect:/login"); 
            mav.addObject("title","RMS | Log in"); 
        }
        return mav;
    } 
    
    @RequestMapping("/outlook")
    public ModelAndView viewOutlook(HttpServletRequest request) throws Exception {  
        
        ModelAndView mav = new ModelAndView("projectoutlook"); 
        if(request.getSession().getAttribute("sessVar")!=null){
            mav.addObject("title","RMS | Project Outlook");
            mav.addObject("projects", getOutlook());
        }else{
            mav=new ModelAndView("redirect:/login"); 
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
            mav.addObject("employees", getEmployees());
        }else{
            mav=new ModelAndView("redirect:/login"); 
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
            mav=new ModelAndView("redirect:/login"); 
            mav.addObject("title","RMS | Log in"); 
        }
        return mav;
    }  
    
    @RequestMapping(value = "/addOutlook", method = RequestMethod.POST)
    public ModelAndView addOutlook(@ModelAttribute("project")Project project, ModelMap model) throws Exception {
        ModelAndView mav = new ModelAndView("addprojectfailed", "title", "RMS | Add Project Failed");
        
        if(dbModel.addOutlook(project.getName(),project.getStart(),project.getEnd(),project.getType(),project.getStatus(),project.getbUnit(),project.getResNeeded(),project.getReference()))
        {
            mav = new ModelAndView("redirect:/outlook"); 
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
            mav = new ModelAndView("redirect:/pSummary"); 
            mav.addObject("title","RMS | Project Summary");
            mav.addObject("projects", getSummary());
        }
        return mav;
    }
    
    @RequestMapping(value = "/delProject", method = RequestMethod.POST)
    public ModelAndView delProject(@ModelAttribute("project")Project project,ModelMap model) throws Exception{
        ModelAndView mav = new ModelAndView("addprojectfailed", "title", "RMS | Add Project Failed");
        
        if(dbModel.delProject(project.getProjectId())){
            mav = new ModelAndView("redirect:/outlook"); 
            mav.addObject("title","RMS | Project Outlook");
            mav.addObject("projects", getOutlook());
        }
        return mav;
    }
    
    @RequestMapping(value = "/delSummary", method = RequestMethod.POST)
    public ModelAndView delSummary(@ModelAttribute("project")Project project,ModelMap model) throws Exception{
        ModelAndView mav = new ModelAndView("addprojectfailed", "title", "RMS | Add Project Failed");
        
        if(dbModel.delSummary(project.getProjectId())){
            mav = new ModelAndView("redirect:/pSummary"); 
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
            mav = new ModelAndView("redirect:/outlook"); 
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
            mav = new ModelAndView("redirect:/pSummary"); 
            mav.addObject("title","RMS | Project Summary");
            mav.addObject("projects", getSummary());
        }
        return mav;
    } 
    
    @RequestMapping(value = "/assignResource", method = RequestMethod.POST)
    public ModelAndView assignResource(@ModelAttribute("effort")Effort effort, ModelMap model) throws Exception
    {
        ModelAndView mav = new ModelAndView("addprojectfailed", "title", "RMS | Add Project Failed");
        Boolean flag=true;
        //System.out.println("NAABOT KO DIRI---------------------------------"+effort.getYear());
        for(int i=0;i<effort.getCount();i++){
            //System.out.println("NAABOT KO DIRI---------------------------------");
            if(dbModel.assignResource(effort.getEmpId(),effort.getProjId(),effort.getYear(),effort.getJan(),effort.getFeb(),effort.getMar(),effort.getApr(),effort.getMay(),effort.getJun(),effort.getJul(),effort.getAug(),effort.getSep(),effort.getOct(),effort.getNov(),effort.getDece()))
            {
               
            }else{
                flag=false;
            }
        }
        if(flag==true){
            mav = new ModelAndView("redirect:/pSummary"); 
            mav.addObject("title","RMS | Project Summary");
            mav.addObject("projects", getSummary());
        }
        return mav;
    }
    
    @RequestMapping(value = "/getSpecificEmployee")
    public @ResponseBody String getSpecificEmployee(@RequestParam("id")int id, ModelMap model) throws Exception
    {
        ResultSet rs =null;
        String emp = null;
        rs=dbModel.getSpecificEmployee(id);
        if(rs.first()){
            emp=rs.getString("first_name")+"%"+rs.getString("middle_name")+"%"+rs.getString("last_name")+"%"+rs.getString("business_unit")+"%"+rs.getString("date_hired");
            System.out.println(rs.getString("first_name")+rs.getString("date_hired"));
        }
        return emp;
    }
    
    @RequestMapping(value = "/getResourcesProjects")
    public @ResponseBody String getResourcesProjects(@RequestParam("id")int id, ModelMap model) throws Exception
    {
        ResultSet rs = null;
        String res = null;
        rs=dbModel.getResourcesProjects(id);
        if(rs.first()){
            res=rs.getString("first_name")+"%"+rs.getString("middle_name")+"%"+rs.getString("last_name")+"%"+
                rs.getString("business_unit")+"%"+rs.getString("date_hired")+"%"+rs.getInt("year")+"%"+
                rs.getFloat("jan")+"%"+rs.getFloat("feb")+"%"+rs.getFloat("mar")+"%"+rs.getFloat("apr")+"%"+
                rs.getFloat("may")+"%"+rs.getFloat("jun")+"%"+rs.getFloat("jul")+"%"+rs.getFloat("aug")+"%"+
                rs.getFloat("sep")+"%"+rs.getFloat("oct")+"%"+rs.getFloat("nov")+"%"+rs.getFloat("dece");
        }
        System.out.println("-------------------"+res);
        return res;
    }
    
}
