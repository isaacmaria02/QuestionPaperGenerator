package com.dao;
import java.util.*;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.model.*;
public class Jdbc {
	Connection con;
	PreparedStatement ps;
	int i;
	public Connection myConnection(){
		//1.load driver
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","system");
			System.out.println("Connection to db..");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("catch connection..");
		} catch (SQLException e) {
			System.out.println("catch connection..2");
			e.printStackTrace();
		}
		return con;
	}
	public int saveData(List<Registration> lst){
		Registration r =  lst.get(0);
		
		try {
			con=myConnection();
			ps=con.prepareStatement("insert into teacher values(?,?,?,?,?,?,?,?,?,?)");
			ps.setInt(1,r.getTid());
			ps.setString(2,r.getFname());
			ps.setString(3,r.getLname());
			ps.setString(4, r.getUser());
			ps.setString(5, r.getPass());
			ps.setString(6, r.getGender());
			ps.setString(7, r.getEmail());
			ps.setString(8, r.getPhone());
			ps.setString(9, r.getQuest());
			ps.setString(10, r.getAnswer());

			i = ps.executeUpdate();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("test11");
			e.printStackTrace();
		}
		catch(Exception e){
			System.out.println("global.."+e);
		}
		return i;
	}
	
	

	public int updatePassword(String email, String pass){
		try {
			con=myConnection();
			ps=con.prepareStatement("update teacher set pass=? where email=?");
			ps.setString(1,pass);
			ps.setString(2, email);
			i=ps.executeUpdate();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}
	
	
	
	
	
	
	
	
	
	public int deleteRecord(int no){
		try {
			con=myConnection();
			ps=con.prepareStatement("delete from teacher where tid=?");
			ps.setInt(1,no);
			i=ps.executeUpdate();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}
	public boolean searchRecord(List<Login> lst){
		Login l = lst.get(0);
		String str = "select * from teacher";
		boolean res=false;
		
		
		
		try {
			con=myConnection();
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(str);
			
			//skipping admin data
			rs.next();
			
			
			while(rs.next())
			{
				if(rs.getString(4).equals(l.getUsername()) && rs.getString(5).equals(l.getPassword()))
				{
					res = true;
				}
				
			}
			
			
		
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(res);
		return res;
	}
	
	public boolean searchEmail(String email){
		String str = "select * from teacher";
		boolean res=false;
		
		
		
		try {
			con=myConnection();
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(str);
			
			//skipping admin data
			rs.next();
			
			
			while(rs.next())
			{
				if(rs.getString(7).equals(email))
				{
					res = true;
					break;
				}
				
			}
			
			
		
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(res);
		return res;
	}
	
	
	public boolean searchAnswer(String answer){
		String str = "select * from teacher";
		boolean res=false;
		
		
		
		try {
			con=myConnection();
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(str);
			
			//skipping admin data
			rs.next();
			
			
			while(rs.next())
			{
				System.out.println(rs.getString(10)+" "+answer);
				if(rs.getString(10).equals(answer))
				{
					res = true;
					break;
				}
				
			}
			
			
		
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(res);
		return res;
	}
	
	
	public String searchQuestion(String email){
		String str = "select * from teacher";
		String question="";
		
		
		
		try {
			con=myConnection();
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(str);
			
			//skipping admin data
			rs.next();
			
			
			while(rs.next())
			{
				if(rs.getString(7).equals(email))
				{
					 question=rs.getString(9);
					 break;
				}
				
			}
			
			
		
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return question;
	}
	
	
	
	
	public boolean searchAdmin(List<Login> lst){
		Login l = lst.get(0);
		String str = "select * from teacher where rownum=1";
		boolean res=false;
		
		
		
		try {
			con=myConnection();
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(str);
			
			
			while(rs.next())
			{
				if(rs.getString(4).equals(l.getUsername()) && rs.getString(5).equals(l.getPassword()))
				{
					res = true;
				}
				
			}
			
			
		
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(res);
		return res;
	}
	
	
	
	
	
	
	
	
	
	public List<Registration> displayAll(){
		String str="select * from teacher";
		List<Registration> lst = new ArrayList<>();
		Registration r;
		try {
			con=myConnection();
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(str);

		
			while(rs.next())
			{
				r = new Registration();
				r.setTid(rs.getInt(1));
				r.setFname(rs.getString(2));
				r.setLname(rs.getString(3));
				r.setUser(rs.getString(4));
				r.setPass(rs.getString(5));
				r.setGender(rs.getString(6));
				r.setEmail(rs.getString(7));
				r.setPhone(rs.getString(8));
				r.setQuest(rs.getString(9));
				r.setAnswer(rs.getString(10));
				
				
				
				lst.add(r);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return lst;

	}
}




