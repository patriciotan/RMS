/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rms.model.and.controller;

import java.util.List;

/**
 *
 * @author Sean Patrick T. Tan
 */
public class Effort {
    
    private int year,projId,empId;
    private List<Float> months;

    public List<Float> getMonths() {
        return months;
    }

    public void setMonths(List<Float> months) {
        this.months = months;
    }

    public int getProjId() {
        return projId;
    }

    public void setProjId(int projId) {
        this.projId = projId;
    }

    public int getEmpId() {
        return empId;
    }

    public void setEmpId(int empId) {
        this.empId = empId;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }
    
    
}
