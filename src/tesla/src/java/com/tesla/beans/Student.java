/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tesla.beans;

/**
 *
 * @author Jatin Rohilla
 */
public class Student {

    private String name;
    private int value;

    Student(String name, int value) {
        this.name = name;
         this.value = value;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }

    @Override
    public String toString() {
        return name + "::" + value;
    }

}