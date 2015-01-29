/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rms.model.and.controller;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Sean Patrick T. Tan
 */
public class Effort {
    
    private int projId,empId,count;
    private List<Float> jan = new ArrayList<Float>(),feb = new ArrayList<Float>(),mar = new ArrayList<Float>(),apr = new ArrayList<Float>(),may = new ArrayList<Float>(),jun = new ArrayList<Float>(),jul = new ArrayList<Float>(),aug = new ArrayList<Float>(),sep = new ArrayList<Float>(),oct = new ArrayList<Float>(),nov = new ArrayList<Float>(),dece = new ArrayList<Float>();
    private List<String> year = new ArrayList<String>();

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public List<Float> getApr() {
        return apr;
    }

    public void setApr(List<Float> apr) {
        this.apr = apr;
    }

    public List<Float> getAug() {
        return aug;
    }

    public void setAug(List<Float> aug) {
        this.aug = aug;
    }

    public List<Float> getDece() {
        return dece;
    }

    public void setDece(List<Float> dece) {
        this.dece = dece;
    }

    public int getEmpId() {
        return empId;
    }

    public void setEmpId(int empId) {
        this.empId = empId;
    }

    public List<Float> getFeb() {
        return feb;
    }

    public void setFeb(List<Float> feb) {
        this.feb = feb;
    }

    public List<Float> getJan() {
        return jan;
    }

    public void setJan(List<Float> jan) {
        this.jan = jan;
    }

    public List<Float> getJul() {
        return jul;
    }

    public void setJul(List<Float> jul) {
        this.jul = jul;
    }

    public List<Float> getJun() {
        return jun;
    }

    public void setJun(List<Float> jun) {
        this.jun = jun;
    }

    public List<Float> getMar() {
        return mar;
    }

    public void setMar(List<Float> mar) {
        this.mar = mar;
    }

    public List<Float> getMay() {
        return may;
    }

    public void setMay(List<Float> may) {
        this.may = may;
    }

    public List<Float> getNov() {
        return nov;
    }

    public void setNov(List<Float> nov) {
        this.nov = nov;
    }

    public List<Float> getOct() {
        return oct;
    }

    public void setOct(List<Float> oct) {
        this.oct = oct;
    }

    public int getProjId() {
        return projId;
    }

    public void setProjId(int projId) {
        this.projId = projId;
    }

    public List<Float> getSep() {
        return sep;
    }

    public void setSep(List<Float> sep) {
        this.sep = sep;
    }

    public List<String> getYear() {
        return year;
    }

    public void setYear(List<String> year) {
        this.year = year;
    }

    
}
