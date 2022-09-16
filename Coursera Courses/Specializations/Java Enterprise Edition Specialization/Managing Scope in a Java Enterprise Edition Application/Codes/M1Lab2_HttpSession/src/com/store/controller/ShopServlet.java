package com.store.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ShopServlet
 */
@WebServlet("/shop")
public class ShopServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String item = request.getParameter("item");
		session.setAttribute(item.toLowerCase(),item);
		
		response.setContentType("text/html");  
	    PrintWriter out = response.getWriter();  
	    
	    StringBuilder strOut = new StringBuilder(200);
	    strOut.append("<html><body><div id='cart'><h3> Shopping Cart </h3><ul>");
	    
	    Enumeration<String> items = request.getSession().getAttributeNames();
	    while (items.hasMoreElements()) {
	        String anItem = (String) items.nextElement();
	      strOut.append("<li>");  
	      strOut.append(request.getSession().getAttribute(anItem));
	      strOut.append("</li>");
	    }
	    strOut.append("</br><a href='shop.html'>Yum, I Want To Shop Some More</a></br>");
	    strOut.append("</ul></div></body></html>");
	    
	    out.print(strOut.toString());
	    
	    out.close();
	}

}
