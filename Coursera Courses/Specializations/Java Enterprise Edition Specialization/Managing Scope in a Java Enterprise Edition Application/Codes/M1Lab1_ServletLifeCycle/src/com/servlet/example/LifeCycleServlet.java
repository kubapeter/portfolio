package com.servlet.example;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LifeCycleServlet
 */
@WebServlet("/LifeCycleServlet")
public class LifeCycleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public LifeCycleServlet() {
       System.out.println("Default constructor in LifeCycleServlet called");
    }
    
   
    public void init() throws ServletException{
    	System.out.println("init method in LifeCycleServlet called");
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet method in LifeCycleServlet called");
		
		request.getSession().invalidate();
		System.out.println("invalidate called");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost method in LifeCycleServlet called");
	}
	
	public void destroy() {
		System.out.println("destroy method in LifeCycleServlet called");
	}
	
	

}
