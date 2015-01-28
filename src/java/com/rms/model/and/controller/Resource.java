/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rms.model.and.controller;

/**
 *
 * @author Sean Patrick T. Tan
 */
public class Resource {
    
    private String fname,lname,bUnit,dateHired;

    public String getbUnit() {
        return bUnit;
    }

    public void setbUnit(String bUnit) {
        this.bUnit = bUnit;
    }

    public String getDateHired() {
        return dateHired;
    }

    public void setDateHired(String dateHired) {
        this.dateHired = dateHired;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }
    
}
