package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.Jdbc;
import com.model.Question;

/**
 * Servlet implementation class AddQuestionServlet
 */
public class AddQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddQuestionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String question = request.getParameter("question");
		
		PrintWriter out = response.getWriter();

		
		List<String> choice = new ArrayList<>();
		choice.add(request.getParameter("c1"));
		choice.add(request.getParameter("c2"));
		choice.add(request.getParameter("c3"));
		choice.add(request.getParameter("c4"));

		
		List<String> ans = new ArrayList<>();
		ans = Arrays.asList(request.getParameterValues("ans"));
		

		
		String cat = request.getParameter("category");
		
		int difficulty = Integer.parseInt(request.getParameter("difficulty"));
		
		
		
		Question q = new Question();
		q.setQuestion(question);
		q.setChoice(choice);
		q.setAns(ans);
		q.setCategory(cat);
		q.setDifficulty(difficulty);
		
		
		System.out.println(q);
       
		List<Question> lq = new ArrayList<>();
		lq.add(q);
		
		

		Jdbc x = new Jdbc();
		int i = x.insertQuestion(lq);
		
		if(i>0)
		{
			out.println("<script language='javascript'>window.alert('Questions added successfully');window.location.href='AddQuestions.jsp';</script>");
		}
		else
		{
			out.println("<script language='javascript'>window.alert('Questions not added');window.location.href='AddQuestions.jsp';</script>");

		    response.sendRedirect("AddQuestions.jsp");	

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