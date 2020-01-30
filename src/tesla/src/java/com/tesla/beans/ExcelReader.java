/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tesla.beans;

import static com.tesla.beans.ReadExcelFileToList.readExcelData;
import java.util.List;
import javax.ejb.Stateless;

/**
 *
 * @author Jatin
 */
@Stateless
public class ExcelReader {

    private String name;
    private int value;
    private String path;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getValue() {
        //  List<Student> list = readExcelData("Sample.xlsx");
        // convert the obtained path(filename) to absolute one
        List<Student> list = readExcelData(path);

        /*
         use bean to set path of the file,
         then read and extract a List and fetch the required value.
         // TEST IT FIRST SOMEHOW
         // First check, if this function returns required format
         // fetch the required value from this list, and boom, return the attendance or marks
         // is all this really needed ??
         // cant we just store in database and fetch and display
         // NO, this is a abstraction level simplicity
         */
        return value;
    }

    public void setPath(String path) {
        this.path = path;
    }

}
