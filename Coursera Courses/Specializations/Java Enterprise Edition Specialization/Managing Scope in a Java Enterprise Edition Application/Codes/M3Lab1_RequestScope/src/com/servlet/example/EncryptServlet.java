package com.servlet.example;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EncryptServlet
 */
@WebServlet("/encrypt")
public class EncryptServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Get the fname and lname, combine into string and reverse
		String revName = new StringBuilder(request.getParameter("fname") + request.getParameter("lname")).reverse()
				.toString();

		char[] unencryptedName = revName.toCharArray();
		String vowels = "AEIOUaeiou";

		for (int i = 0; i < unencryptedName.length; i++) {

			// if vowel replace with random letter
			if (vowels.indexOf(unencryptedName[i]) != -1) {
				Random rand = new Random();
				int x = rand.nextInt(95 - 35) + 35;
				unencryptedName[i] = (char) x;
			}
		}
		String encryptedName = new String(unencryptedName);
		StringBuilder returnString = new StringBuilder(200);
	
		// send back some HTML
		returnString.append(" <html><body><h3>Developer Starter Page</h3></br></br>"
				+ "<label name='enc_name'>Encrypted User Name:&nbsp&nbsp</label>");
		returnString.append(encryptedName);
		
		returnString.append("</br></body></html>");

		PrintWriter out = response.getWriter();
		out.print(returnString.toString());

		out.close();

	}

}
