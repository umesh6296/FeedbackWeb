package com.feedback.utils;
import java.sql.*;
public class dbConnection {
	
	    private static final String UID="root";
		private static final String DB_NAME="fsdb";
		private static final String PWD="root";
		private static final String IP="localhost";
	    private static final String PORT="3306";
	    //added
	    
	    
	    private static final String URI="jdbc:mysql://"+IP+":"+PORT+"/"+DB_NAME;
      
	
	private static final String DRIVER_NAME="com.mysql.jdbc.Driver";
	public static Connection getConnection() throws ClassNotFoundException,SQLException {
		Class.forName(DRIVER_NAME);
		Connection con = DriverManager.getConnection(URI,UID,PWD);
		return con;
		
	}
	
	
	
	
	
	    public static void main(String[] args) {
	        try{  
	         System.out.println("trying to connect!!!!!!");
	 		Connection c =getConnection();
	 		System.out.println("db connected!!!!!!");
	 		c.close();
	        }
	        catch(ClassNotFoundException ex){
	            ex.printStackTrace();
	        }
	        catch(SQLException ex){
	            ex.printStackTrace();
	        }	       
	    }
}
