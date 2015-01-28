/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.rms.model.and.controller;

import java.sql.Date;

/**
 *
 * @author Owner
 */
public class Project {
    
    private String name,type,status,bUnit,start,end,reference;
    private int resNeeded,projectId;

    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }
    

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getbUnit() {
        return bUnit;
    }

    public void setbUnit(String bUnit) {
        this.bUnit = bUnit;
    }

    public int getResNeeded() {
        return resNeeded;
    }

    public void setResNeeded(int resNeeded) {
        this.resNeeded = resNeeded;
    }

    public String getStart() {
        return start;
    }

    public void setStart(String start) {
        this.start = start;
    }

    public String getEnd() {
        return end;
    }

    public void setEnd(String end) {
        this.end = end;
    }

    public String getReference() {
        return reference;
    }

    public void setReference(String reference) {
        this.reference = reference;
    }
    
    
    
}
