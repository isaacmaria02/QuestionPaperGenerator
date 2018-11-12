package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.Jdbc;

/**
 * Servlet implementation class DeleteServlet
 */
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		
		Jdbc x = new Jdbc();
		int tid = Integer.parseInt(request.getParameter("tid"));
		
		int i = x.deleteRecord(tid);
		
		if(i>0)
		{
			out.println("<script language='javascript'>window.alert('Record deleted successfully');window.location.href='AdminHome.jsp';</script>");

		//	response.sendRedirect("AdminHome.jsp");
		}
		else
		{
			out.println("<script language='javascript'>window.alert('Teacher ID does not exist');window.location.href='AdminHome.jsp';</script>");

		//	response.sendRedirect("AdminHome.jsp");
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
