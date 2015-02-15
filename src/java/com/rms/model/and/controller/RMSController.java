/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rms.model.and.controller;

import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
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
        ResultSet rs = dbModel.getSummary(),name=null;
        List<Project> projects=new ArrayList<>();
        while(rs.next()){
            Project project = new Project();
            project.setProjectId(rs.getInt("project_id"));
            project.setName(rs.getString("name"));
            name=dbModel.getSpecificClient(rs.getInt("client_id"));
            name.next();
            project.setClientName(name.getString("name"));
            project.setStart(rs.getString("start_date"));
            project.setEnd(rs.getString("end_date"));
            project.setType(rs.getString("type"));
            project.setStatus(rs.getString("status"));
            project.setbUnit(rs.getString("business_unit"));
            project.setAddedBy(rs.getString("added_by"));
            project.setAddedDate(rs.getString("added_date"));
            projects.add(project);
        }
        return projects;
    } 
    public List getMyProjects(int id) throws Exception {  
        ResultSet rs = dbModel.getMyProjects(id);
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
            project.setYear(rs.getInt("year"));
            project.setJan(rs.getFloat("jan"));
            project.setFeb(rs.getFloat("feb"));
            project.setMar(rs.getFloat("mar"));
            project.setApr(rs.getFloat("apr"));
            project.setMay(rs.getFloat("may"));
            project.setJun(rs.getFloat("jun"));
            project.setJul(rs.getFloat("jul"));
            project.setAug(rs.getFloat("aug"));
            project.setSep(rs.getFloat("sep"));
            project.setOct(rs.getFloat("oct"));
            project.setNov(rs.getFloat("nov"));
            project.setDece(rs.getFloat("dece"));
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
            resource.setJan((float) (Math.round(rs.getFloat("jan")*100.0)/100.0));
            resource.setFeb((float) (Math.round(rs.getFloat("feb")*100.0)/100.0));
            resource.setMar((float) (Math.round(rs.getFloat("mar")*100.0)/100.0));
            resource.setApr((float) (Math.round(rs.getFloat("apr")*100.0)/100.0));
            resource.setMay((float) (Math.round(rs.getFloat("may")*100.0)/100.0));
            resource.setJun((float) (Math.round(rs.getFloat("jun")*100.0)/100.0));
            resource.setJul((float) (Math.round(rs.getFloat("jul")*100.0)/100.0));
            resource.setAug((float) (Math.round(rs.getFloat("aug")*100.0)/100.0));
            resource.setSep((float) (Math.round(rs.getFloat("sep")*100.0)/100.0));
            resource.setOct((float) (Math.round(rs.getFloat("oct")*100.0)/100.0));
            resource.setNov((float) (Math.round(rs.getFloat("nov")*100.0)/100.0));
            resource.setDece((float) (Math.round(rs.getFloat("dece")*100.0)/100.0));
            resources.add(resource);
        }
        return resources;
    }
    
    public List getUnderload() throws Exception{
        SimpleDateFormat sdf = new SimpleDateFormat("MMMM");
        Calendar c = Calendar.getInstance();
        Date now = c.getTime();
        int year = c.get(Calendar.YEAR);
        String month = sdf.format(now);
        month=month.toLowerCase();
        if(month.equals("december")){
            month=month.substring(0,4);
        }else{
            month=month.substring(0,3);
        }
        List<Employee> employees = getEmployees();
        List<Resource> resources=new ArrayList<>();
        for(int i=0;i<employees.size();i++)
        {
            ResultSet rs = dbModel.getTotalResources(employees.get(i).getEmpId(),year);
            Resource resource = new Resource();
            rs.next();
            resource.setFname(employees.get(i).getFname());
            resource.setMname(employees.get(i).getMname());
            resource.setLname(employees.get(i).getLname());
            resource.setJan((float) (Math.round(rs.getFloat(month)*100.0)/100.0));
            if(resource.getJan()<1.0){
                resources.add(resource);
            }
        }
        return resources;
    }
    
    public List getOverload() throws Exception{
        SimpleDateFormat sdf = new SimpleDateFormat("MMMM");
        Calendar c = Calendar.getInstance();
        Date now = c.getTime();
        int year = c.get(Calendar.YEAR);
        String month = sdf.format(now);
        month=month.toLowerCase();
        if(month.equals("december")){
            month=month.substring(0,4);
        }else{
            month=month.substring(0,3);
        }
        List<Employee> employees = getEmployees();
        List<Resource> resources=new ArrayList<>();
        for(int i=0;i<employees.size();i++)
        {
            ResultSet rs = dbModel.getTotalResources(employees.get(i).getEmpId(),year);
            Resource resource = new Resource();
            rs.next();
            resource.setFname(employees.get(i).getFname());
            resource.setMname(employees.get(i).getMname());
            resource.setLname(employees.get(i).getLname());
            resource.setJan((float) (Math.round(rs.getFloat(month)*100.0)/100.0));
            if(resource.getJan()>=1.0){
                resources.add(resource);
            }
        }
        return resources;
    }
    
    public List getNextUnres() throws Exception {
        List<Project> resources = getResources(); 
        List<Project> unRes = new ArrayList<>(); 
        
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Calendar c = Calendar.getInstance();
        int month = c.get(Calendar.MONTH);
        for(Project resource: resources){
            Date dpmonth = sdf.parse(resource.getEnd());
            c.setTime(dpmonth);
            int pmonth = c.get(Calendar.MONTH);
            if(pmonth == month) 
                unRes.add(resource);
        }
        return unRes;
    }
    
    
    public ResourceSummary getRSummary(){
        ResourceSummary res = new ResourceSummary();
        try{
            res.setTotal(dbModel.getTotalResources());
            res.setAlli(dbModel.getTotalAlliance());
            res.setJap(dbModel.getTotalJapan());
            res.setPh(dbModel.getTotalPhilippines());
            res.setRow(dbModel.getTotalRow());
        }catch(Exception e){
            e.printStackTrace();
        }
        return res;
    }
    
    public List getCSummary() throws Exception{
        ResultSet rs = dbModel.getClient();
        ArrayList<Client> clients=new ArrayList<>();
        while(rs.next()){
            Client c = new Client();
            c.setClientId(rs.getInt("client_id"));
            c.setName(rs.getString("name"));
            c.setAddedBy(rs.getString("added_by"));
            c.setAddedDate(rs.getString("added_date"));
            clients.add(c);
        }
        return clients;
    }
    
    public List getNextUnpro() throws Exception {
        List<Project> projects = getSummary(); 
        List<Project> unPro = new ArrayList<>(); 
        
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Calendar c = Calendar.getInstance();
        int month = c.get(Calendar.MONTH);
        for(Project project: projects){
            Date dpmonth = sdf.parse(project.getEnd());
            c.setTime(dpmonth);
            int pmonth = c.get(Calendar.MONTH);
            if(pmonth == month) 
                unPro.add(project);
        }
        return unPro;
    }
    
    public List getTasks(int projid) throws Exception{
        ResultSet rs = null,zac=null;
        rs=dbModel.getTasksProjects(projid);
        List<Task> tasks=new ArrayList<Task>();
        while(rs.next()){
            Task a = new Task();
            a.setTaskId(rs.getInt("task_id"));
            a.setProjectId(rs.getInt("project_id"));
            a.setName(rs.getString("name"));
            a.setStart(rs.getString("start_date"));
            a.setEnd(rs.getString("end_date"));
            zac = dbModel.getResourcesTasks(a.getTaskId());
            while(zac.next()){
                Resource resource = new Resource();
                resource.setEmpId(zac.getInt("resource_id"));
                resource.setEffortId(zac.getInt("effort_id"));
                resource.setFname(zac.getString("first_name"));
                resource.setMname(zac.getString("middle_name"));
                resource.setLname(zac.getString("last_name"));
                resource.setbUnit(zac.getString("business_unit"));
                resource.setDateHired(zac.getString("date_hired"));
                resource.setYear(zac.getInt("year"));
                resource.setJan(zac.getFloat("jan"));
                resource.setFeb(zac.getFloat("feb"));
                resource.setMar(zac.getFloat("mar"));
                resource.setApr(zac.getFloat("apr"));
                resource.setMay(zac.getFloat("may"));
                resource.setJun(zac.getFloat("jun"));
                resource.setJul(zac.getFloat("jul"));
                resource.setAug(zac.getFloat("aug"));
                resource.setSep(zac.getFloat("sep"));
                resource.setOct(zac.getFloat("oct"));
                resource.setNov(zac.getFloat("nov"));
                resource.setDece(zac.getFloat("dece"));
                
                a.resources.add(resource);
            }
            tasks.add(a);
        }
        return tasks;
    }
    
    @RequestMapping("/login")
    public ModelAndView login(HttpServletRequest request) {   
        ModelAndView mav = new ModelAndView("login", "title", "RMS - Log in"); 
        if(request.getSession().getAttribute("sessVar")!=null){
            mav = new ModelAndView("redirect:/dashboard");
        }
        return mav;
    }  
    
    @RequestMapping(value = "/loginSubmit", method = RequestMethod.POST)
    public ModelAndView loginSubmit(@ModelAttribute("user")User user, ModelMap model,HttpServletRequest request) throws Exception {
        ModelAndView mav = new ModelAndView("redirect:/login"); 
        mav.addObject("title","RMS - Log in");   
        if(dbModel.canLogin(user.getUsername(), user.getPassword()))
        {
            ResultSet rs = dbModel.getUser(user.getUsername(), user.getPassword());
            rs.next();
            request.getSession(true).setAttribute("sessVar",user.getUsername());
            request.getSession(true).setAttribute("userType",rs.getString("type"));
            request.getSession(true).setAttribute("userId",rs.getInt("user_id"));
            //request.getSession(true).setAttribute("resId",rs.getInt("resource_id"));
            if(rs.getString("type").equals("Manager")){
                mav = new ModelAndView("redirect:/dashboard"); 
            }
            else if(rs.getString("type").equals("Employee")){
                mav = new ModelAndView("redirect:/employeeView"); 
            }
            else if(rs.getString("type").equals("Client")){
                mav = new ModelAndView("redirect:/clientView"); 
            }
        }
        return mav;
    }
    
    @RequestMapping(value = "/logoutSubmit", method = RequestMethod.POST)
    public ModelAndView logoutSubmit(ModelMap model,HttpServletRequest request) throws Exception {
        ModelAndView mav = new ModelAndView("redirect:/login"); 
        mav.addObject("title","RMS - Log in");
        request.getSession().invalidate();
        return mav;
    }
    
    @RequestMapping("/dashboard")
    public ModelAndView viewDashboard(HttpServletRequest request) throws Exception {  
        ModelAndView mav = new ModelAndView("dashboard");
        List<Project> projects = getSummary(); 
        
        if(request.getSession().getAttribute("sessVar")!=null){
            mav.addObject("title","RMS - Dashboard");
            mav.addObject("underload",getUnderload());
            mav.addObject("clients",getCSummary());
            mav.addObject("projects",projects);
            mav.addObject("unPro",getNextUnpro());
        }else{
            mav=new ModelAndView("redirect:/login"); 
        }
        return mav;
    } 
    
    @RequestMapping("/outlook")
    public ModelAndView viewOutlook(HttpServletRequest request) throws Exception { 
        ModelAndView mav = new ModelAndView("projectoutlook"); 
        if(request.getSession().getAttribute("sessVar")!=null){
            mav.addObject("title","RMS - Project Outlook");
            mav.addObject("projects", getOutlook());
        }else{
            mav=new ModelAndView("redirect:/login"); 
        }
        return mav;
    }  
    
    @RequestMapping("/employeeView")
    public ModelAndView employeeView(HttpServletRequest request) throws Exception {  
        ModelAndView mav = new ModelAndView("employeeview"); 
        List<Project> projects=new ArrayList<>();
        if(request.getSession().getAttribute("sessVar")!=null){
            int id = (int) request.getSession().getAttribute("resId");
            mav.addObject("title","RMS - Projects");
            projects=getMyProjects(id);
            mav.addObject("projects", projects);
        }else{
            mav=new ModelAndView("redirect:/login"); 
            mav.addObject("title","RMS - Log in"); 
        }
        if(projects!=null)
            return mav;
        return null;
    }    
    
    @RequestMapping("/pSummary")
    public ModelAndView viewPSummary(HttpServletRequest request) throws Exception {   
        ModelAndView mav = new ModelAndView("projectsummary"); 
        if(request.getSession().getAttribute("sessVar")!=null){
            mav.addObject("title","RMS - Project Summary");
            mav.addObject("projects", getSummary());
            mav.addObject("employees", getEmployees());
            mav.addObject("clients",getCSummary());
        }else{
            mav=new ModelAndView("redirect:/login"); 
        }
        return mav;
    }  
    
    @RequestMapping(value = "/resProject", method = RequestMethod.POST)
    public ModelAndView viewResProject(@ModelAttribute("project")Project project, ModelMap model, HttpServletRequest request) throws Exception {   
        ModelAndView mav = new ModelAndView("resprojectsummary"); 
        int id = project.getProjectId();
        String name = project.getName();
        if(request.getSession().getAttribute("sessVar")!=null){
            mav.addObject("title","RMS - "+name);
            mav.addObject("projectId", id);
            mav.addObject("projectName", name);
            mav.addObject("employees", getEmployees());
            mav.addObject("tasks",getTasks(id));
        }else{
            mav=new ModelAndView("redirect:/login"); 
            mav.addObject("title","RMS - Log in"); 
        }
        return mav;
    }  
    
    
    @RequestMapping("/rSummary")
    public ModelAndView viewRSummary(HttpServletRequest request) throws Exception {   
        ModelAndView mav = new ModelAndView("resourcesummary"); 
        if(request.getSession().getAttribute("sessVar")!=null){
            SimpleDateFormat sdf = new SimpleDateFormat("MMMM");
            Calendar c = Calendar.getInstance();
            Date now = c.getTime();
            String month = sdf.format(now);
            int year = c.get(Calendar.YEAR);
            mav.addObject("title","RMS | Resource Summary");
            mav.addObject("resources", getResources());
            mav.addObject("summary",getRSummary());
            mav.addObject("year",year);
            mav.addObject("month",month);
            mav.addObject("underload",getUnderload());
            mav.addObject("overload",getOverload());
        }else{
            mav=new ModelAndView("redirect:/login"); 
        }
        return mav;
    }  
    
    @RequestMapping("/cSummary")
    public ModelAndView viewCSummary(HttpServletRequest request) throws Exception { 
        ModelAndView mav = new ModelAndView("clientsummary"); 
        if(request.getSession().getAttribute("sessVar")!=null){
            mav.addObject("title","RMS - Client Summary");
            mav.addObject("clients", getCSummary());
        }else{
            mav=new ModelAndView("redirect:/login"); 
        }
        return mav;
    }  
    
    @RequestMapping(value = "/addOutlook", method = RequestMethod.POST)
    public ModelAndView addOutlook(@ModelAttribute("project")Project project, ModelMap model, HttpServletRequest request) throws Exception {
        ModelAndView mav = new ModelAndView("addprojectfailed", "title", "RMS - Add Project Failed");
        
        SimpleDateFormat sdf = new SimpleDateFormat("mm/dd/yyyy");
        Calendar c = Calendar.getInstance();
        Date now = c.getTime();
        
        String created_by = (String) request.getSession().getAttribute("sessVar");
        String created_date = sdf.format(now);
        
        if(dbModel.addOutlook(project.getName(),project.getStart(),project.getEnd(),project.getType(),project.getStatus(),project.getbUnit(),project.getResNeeded(),project.getReference(),created_by,created_date))
        {
            mav = new ModelAndView("redirect:/outlook"); 
        }
        return mav;
    } 
    
    @RequestMapping(value = "/addProject", method = RequestMethod.POST)
    public ModelAndView addProject(@ModelAttribute("project")Project project, ModelMap model, HttpServletRequest request) throws Exception {
        ModelAndView mav = new ModelAndView("addprojectfailed", "title", "RMS | Add Project Failed");
        
        SimpleDateFormat sdf = new SimpleDateFormat("mm/dd/yyyy");
        Calendar c = Calendar.getInstance();
        Date now = c.getTime();
        
        String created_by = (String) request.getSession().getAttribute("sessVar");
        String created_date = sdf.format(now);
        
        if(dbModel.addProject(project.getName(),project.getStart(),project.getEnd(),project.getType(),project.getStatus(),project.getbUnit(),project.getReference(),created_by,created_date))
        {
            mav = new ModelAndView("redirect:/pSummary"); 
        }
        return mav;
    }
    
    @RequestMapping(value = "/addTask", method = RequestMethod.POST)
    public ModelAndView addTask(@ModelAttribute("task")Task task, ModelMap model) throws Exception {
        ModelAndView mav = new ModelAndView("addprojectfailed", "title", "RMS | Add Project Failed");
        if(dbModel.addTask(task.getName(),task.getProjectId(),task.getStart(),task.getEnd()))
        {
            mav = new ModelAndView("redirect:/pSummary"); 
        }
        return mav;
    }
    
    @RequestMapping(value = "/delProject", method = RequestMethod.POST)
    public ModelAndView delProject(@ModelAttribute("project")Project project,ModelMap model) throws Exception{
        ModelAndView mav = new ModelAndView("addprojectfailed", "title", "RMS - Add Project Failed");
        
        if(dbModel.delProject(project.getProjectId())){
            mav = new ModelAndView("redirect:/outlook"); 
        }
        return mav;
    }
    
    @RequestMapping(value = "/delSummary", method = RequestMethod.POST)
    public ModelAndView delSummary(@ModelAttribute("project")Project project,ModelMap model) throws Exception{
        ModelAndView mav = new ModelAndView("addprojectfailed", "title", "RMS - Add Project Failed");
        
        if(dbModel.delSummary(project.getProjectId())){
            mav = new ModelAndView("redirect:/pSummary"); 
        }
        return mav;
    }
    
    @RequestMapping(value = "/editOutlook", method = RequestMethod.POST)
    public ModelAndView editOutlook(@ModelAttribute("project")Project project, ModelMap model) throws Exception {
        ModelAndView mav = new ModelAndView("addprojectfailed", "title", "RMS - Add Project Failed");
        
        if(dbModel.editOutlook(project.getName(),project.getStart(),project.getEnd(),project.getType(),project.getStatus(),project.getbUnit(),project.getResNeeded(),project.getProjectId()))
        {
            mav = new ModelAndView("redirect:/outlook"); 
        }
        return mav;
    } 
    
    @RequestMapping(value = "/editProjSumm", method = RequestMethod.POST)
    public ModelAndView editSummary(@ModelAttribute("project")Project project, ModelMap model) throws Exception {
        ModelAndView mav = new ModelAndView("addprojectfailed", "title", "RMS - Add Project Failed");
        
        if(dbModel.editSummary(project.getName(),project.getStart(),project.getEnd(),project.getType(),project.getbUnit(),project.getProjectId()))
        {
            mav = new ModelAndView("redirect:/pSummary"); 
        }
        return mav;
    } 
    
    @RequestMapping(value = "/addClient", method = RequestMethod.POST)
    public ModelAndView addClient(@ModelAttribute("client")Client client, ModelMap model) throws Exception {
        ModelAndView mav = new ModelAndView("addprojectfailed", "title", "RMS - Add Project Failed");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        if(dbModel.addClient(client.getName(),client.getAddedBy(),sdf.format(Calendar.getInstance().getTime())))
        {
            mav = new ModelAndView("redirect:/cSummary"); 
        }
        return mav;
    } 
    
    
    @RequestMapping(value = "/assignResource", method = RequestMethod.POST)
    public ModelAndView assignResource(@ModelAttribute("effort")Effort effort, ModelMap model) throws Exception
    {
        ModelAndView mav = new ModelAndView("addprojectfailed", "title", "RMS - Add Resource Failed");
        Boolean flag = true;
        for(int i=0;i<effort.getCount();i++){
            if(!dbModel.assignResource(effort.getEmpId(),effort.getTaskId(),effort.getProjId(),effort.getYear().get(i),effort.getJan().get(i),effort.getFeb().get(i),effort.getMar().get(i),effort.getApr().get(i),effort.getMay().get(i),effort.getJun().get(i),effort.getJul().get(i),effort.getAug().get(i),effort.getSep().get(i),effort.getOct().get(i),effort.getNov().get(i),effort.getDece().get(i))){
                flag=false;
            }
            if(flag==true){
                mav = new ModelAndView("redirect:/pSummary"); 
            }
        }
        return mav;
    }
    
    @RequestMapping(value = "/editResource", method = RequestMethod.POST)
    public ModelAndView editResource(@ModelAttribute("effort")Resource effort, ModelMap model) throws Exception
    {
        ModelAndView mav = new ModelAndView("addprojectfailed", "title", "RMS - Edit Resource Failed");
        System.out.println(effort.getEffortId()+"--"+effort.getYear()+"--"+effort.getJan()+"--"+effort.getFeb()+"--"+effort.getMar()+"--"+effort.getApr()+"--"+effort.getMay());
        if(dbModel.editResource(effort.getEffortId(),effort.getYear(),effort.getJan(),effort.getFeb(),effort.getMar(),effort.getApr(),effort.getMay(),effort.getJun(),effort.getJul(),effort.getAug(),effort.getSep(),effort.getOct(),effort.getNov(),effort.getDece())){
            mav = new ModelAndView("redirect:/pSummary");  
        }
        return mav;
    }
    
    @RequestMapping(value = "/deleteResource", method = RequestMethod.POST)
    public ModelAndView deleteResource(@ModelAttribute("effort")Effort effort, ModelMap model) throws Exception
    {
        ModelAndView mav = new ModelAndView("addprojectfailed", "title", "RMS - Edit Resource Failed");
        System.out.println(effort.getTaskId()+"--"+effort.getEmpId());
        if(dbModel.deleteResource(effort.getTaskId(),effort.getEmpId())){
            mav = new ModelAndView("redirect:/pSummary");  
        }
        return mav;
    }
    
    @RequestMapping(value = "/getSpecificEmployee")
    public @ResponseBody String getSpecificEmployee(@RequestParam("id")int id, ModelMap model) throws Exception
    {
        ResultSet rs =null,ds=null;
        String emp = null,proj;
        rs=dbModel.getSpecificEmployee(id);
        if(rs.first()){
            emp=rs.getString("first_name")+"%"+rs.getString("middle_name")+"%"+rs.getString("last_name")+"%"+rs.getString("business_unit")+"%"+rs.getString("date_hired");
            ds=dbModel.getEmployeeProjects(id);
            while(ds.next()){
                proj=dbModel.getProjectName(ds.getInt("project_id"));
                emp+="%"+proj;
            }
        }
        return emp;
    }
    
    
    @RequestMapping(value = "/getSpecificEffortMonth")
    public @ResponseBody String getSpecificEffortMonth(@RequestParam("year")int year,@RequestParam("noYears")int noYears,@RequestParam("resId")int resId, ModelMap model) throws Exception
    {
        ResultSet rs = null;
        String result="none";
        for(int i=0;i<noYears;i++){
            rs=dbModel.getSpecificEmployeeTotalEffort(year+i,resId);
            if(rs.first()){
                result+="%"+rs.getFloat("jan")+"%"+rs.getFloat("feb")+"%"+rs.getFloat("mar")+"%"+rs.getFloat("apr")+"%"+
                rs.getFloat("may")+"%"+rs.getFloat("jun")+"%"+rs.getFloat("jul")+"%"+rs.getFloat("aug")+"%"+
                rs.getFloat("sep")+"%"+rs.getFloat("oct")+"%"+rs.getFloat("nov")+"%"+rs.getFloat("dece");
            }
        }
        return result;
    }
    
    @RequestMapping(value = "/getTotalEffort")
    public @ResponseBody String getTotalEffort(@RequestParam("year")int year,@RequestParam("resId")int resId, ModelMap model) throws Exception
    {
        ResultSet rs = null;
        String result=null;
        rs = dbModel.getTotalResources(resId, year);
        if(rs.first()){
            result="troll"+"%"+rs.getFloat("jan")+"%"+rs.getFloat("feb")+"%"+rs.getFloat("mar")+"%"+rs.getFloat("apr")+"%"+
                rs.getFloat("may")+"%"+rs.getFloat("jun")+"%"+rs.getFloat("jul")+"%"+rs.getFloat("aug")+"%"+
                rs.getFloat("sep")+"%"+rs.getFloat("oct")+"%"+rs.getFloat("nov")+"%"+rs.getFloat("dece");
        }
        return result;
    }
    
}
