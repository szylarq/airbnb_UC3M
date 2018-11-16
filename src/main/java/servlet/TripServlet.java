package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.DataAccess;
import logic.TripLogic;
import logic.UserLogic;
import model.Trip;
import model.User;


@WebServlet(
		urlPatterns="/trips",
		loadOnStartup=1,
		initParams={@WebInitParam(name="configuracion", value="es.uc3m.tiw")}
		)
public class TripServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ServletConfig config;
	
		@Override
		public void init(ServletConfig config) throws ServletException {
			this.config = config;	
			
		}
	       


		/**
		 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {			
			
			String emailOfLoggedUser = (String) request.getSession().getAttribute("emailOfLoggedUser"); 
			if (emailOfLoggedUser != null) {
				List<Trip> tripsList = TripLogic.getUserTrips(DataAccess.getUserByEmail(emailOfLoggedUser));
				request.setAttribute("userTrips", tripsList);
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("/trips.jsp"); 
				dispatcher.forward(request, response); 
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp"); 
				dispatcher.forward(request, response); 
			}
		}

		/**
		 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			
		}


}
