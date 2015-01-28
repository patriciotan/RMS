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
    
    private String empName,projName;
    private int year;
    private List<Float> months;

    public List<Float> getMonths() {
        return months;
    }

    public void setMonths(List<Float> months) {
        this.months = months;
    }

    public String getProjName() {
        return projName;
    }

    public void setProjName(String projName) {
        this.projName = projName;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }
    
    
}
