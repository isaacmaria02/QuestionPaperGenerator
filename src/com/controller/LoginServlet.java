package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.Jdbc;
import com.model.Login;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String user = request.getParameter("user");
		String pass = request.getParameter("pass");

		System.out.println(request.getParameter("type"));

		Login l = new Login();
		l.setUsername(user);
		l.setPassword(pass);

		List<Login> lst = new ArrayList<>();
		lst.add(l);

		HttpSession ses = request.getSession();
		ses.setAttribute("isLoggedIn",true);



		Jdbc x = new Jdbc();


		if(request.getParameter("type").equals("admin")) {
			if(x.searchAdmin(lst)) {
				ses.setAttribute("err", "false");
				ses.setAttribute("isLoggedIn",true);


				response.sendRedirect("AdminHome.jsp");
			}
			else {
				ses.setAttribute("err", "true");
				response.sendRedirect("index.jsp");
			}
		}
		else {

			if(x.searchRecord(lst)) {
				response.sendRedirect("TeacherHome.jsp");
			}
			else {
				response.sendRedirect("index.jsp");
			}

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