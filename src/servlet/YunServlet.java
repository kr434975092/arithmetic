package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Random;
import java.util.Scanner;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao;
import user.users;

public class YunServlet extends HttpServlet {
	/**
		 * Constructor of the object.
		 */
	public YunServlet() {
		super();
	}

	/**
		 * Destruction of the servlet. <br>
		 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
		 * The doGet method of the servlet. <br>
		 *
		 * This method is called when a form has its tag value method equals to get.
		 * 
		 * @param request the request send by the client to the server
		 * @param response the response send by the server to the client
		 * @throws ServletException if an error occurred
		 * @throws IOException if an error occurred
		 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request,response);
	}

	/**
		 * The doPost method of the servlet. <br>
		 *
		 * This method is called when a form has its tag value method equals to post.
		 * 
		 * @param request the request send by the client to the server
		 * @param response the response send by the server to the client
		 * @throws ServletException if an error occurred
		 * @throws IOException if an error occurred
		 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		dao.DBUtil db=new dao.DBUtil();
		Connection conn =db.getConn();
		Dao open=new Dao();
		int num=Integer.parseInt(request.getParameter("num"));
		int time=Integer.parseInt(request.getParameter("time"));
		HttpSession session = request.getSession();
		session.setAttribute("time", time);
		//HttpSession session=request.getSession(); 
		//session.setAttribute("num", num);
			Random r=new Random();
			for(int i=0;i<num;i++)
			{
				users u=new users();
				int r1=r.nextInt(100)+1;
				int r2=r.nextInt(100)+1;
				int r3=r.nextInt(4)+1;
				switch(r3)
				{
					case 1:
					{
						int x=r1+r2;
						while(x>100||x<0)
						{
							r1=r.nextInt(100)+1;
							 r2=r.nextInt(100)+1;
							 x=r1+r2;
						}
						u.num1=r1;
						u.num2=r2;
						u.symbol="+";
						u.find=x;
						
						try {
								open.add(conn, u);
								} catch (SQLException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}
						break;
					}
					case 2:
					{
						int x=r1-r2;
						while(x>100||x<0)
						{
							r1=r.nextInt(100)+1;
							 r2=r.nextInt(100)+1;
							 x=r1-r2;
						}
						u.num1=r1;
						u.num2=r2;
						u.symbol="-";
						u.find=x;
						try {
								open.add(conn, u);
						} catch (SQLException e) {
					// TODO Auto-generated catch block
							e.printStackTrace();
						}
						break;
					}
					case 3:
					{
						int x=r1*r2;
						while(x>100||x<0)
						{
							r1=r.nextInt(100)+1;
							 r2=r.nextInt(100)+1;
							 x=r1*r2;
						}
						u.num1=r1;
						u.num2=r2;
						u.symbol="*";
						u.find=x;
						try {
							open.add(conn, u);
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						break;
					}
					case 4:
					{
						int x=r1/r2;
						int root=r1%r2;
						while((x>100)||(root!=0)||(x<0)||(r1<r2))
						{
							r1=r.nextInt(100)+1;
							 r2=r.nextInt(100)+1;
							 x=r1/r2;
							 root=r1%r2;
						}
						u.num1=r1;
						u.num2=r2;
						u.symbol="/";
						u.find=x;
						try {
							open.add(conn, u);
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						break;
					}
				}
			}
			request.getRequestDispatcher("../MyJsp.jsp").forward(request,response);
		}


	/**
		 * Initialization of the servlet. <br>
		 *
		 * @throws ServletException if an error occurs
		 */
	public void init() throws ServletException {
		// Put your code here
	}
}
