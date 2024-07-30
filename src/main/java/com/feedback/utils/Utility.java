package com.feedback.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import com.feedback.dto.DateDTO;



public class Utility {
	 public static DateDTO strToSQLDate (String date){
	        SimpleDateFormat sdf=new SimpleDateFormat("dd-MM");
	        try {
	            java.util.Date udate=sdf.parse(date);
	            java.sql.Date sdate=new java.sql.Date(udate.getTime());
	            DateDTO ddto=new DateDTO(true, "", null, sdate);
	            return ddto;
	        } catch (ParseException ex) {
	            //Logger.getLogger(Utility.class.getName()).log(Level.SEVERE, null, ex);
	             DateDTO ddto=new DateDTO(false, ex.getMessage(), ex, null);
	            return ddto;     
	        }
	    }
	    public static String sqlDateToString(java.sql.Date date){
	      SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy");
	            String sdate=sdf.format(date);
	            return sdate;
	       
	    }

}
