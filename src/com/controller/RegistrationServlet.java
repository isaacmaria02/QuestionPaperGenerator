package com.controller;
import com.model.Registration;
import com.model.Login;
import com.dao.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class RegistrationServlet
 */
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int tid = Integer.parseInt(request.getParameter("tid"));
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String user = request.getParameter("user");
		String pass = request.getParameter("pass");
		String gender= request.getParameter("gender");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String quest = request.getParameter("quest");
		String answer = request.getParameter("answer");

		
		PrintWriter out = response.getWriter();
		//out.println(user+" "+pass);
		
		Registration r = new Registration();
		r.setTid(tid);
		r.setFname(fname);
		r.setLname(lname);
		r.setUser(user);
		r.setPass(pass);
		r.setGender(gender);
		r.setEmail(email);
		r.setPhone(phone);
		r.setQuest(quest);
		r.setAnswer(answer);
		
		
		List<Registration> lst = new ArrayList<>();
		lst.add(r);
		
		System.out.println("INside registration servlet "+lst.get(0));
		
		
		HttpSession ses = request.getSession();
		
		
		Jdbc x = new Jdbc();
		int i = x.saveData(lst);
		
		System.out.println("VAlue of i "+i);
		
		if(i>0)
		{
			ses.setAttribute("registered", "true");

			response.sendRedirect("AdminHome.jsp");

		}
		else
		{
			ses.setAttribute("registered", "false");

			response.sendRedirect("AdminHome.jsp");
		}
         		
		
		
	  
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}