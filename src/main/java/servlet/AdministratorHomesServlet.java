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
import logic.AdministratorLogic;
import model.Apartment;
import model.ApartmentPK;
import model.User;


@WebServlet(
		urlPatterns="/administatorHomes",
		loadOnStartup=1,
		initParams={@WebInitParam(name="configuracion", value="es.uc3m.tiw")})
public class AdministratorHomesServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ServletConfig config;
	private List<Apartment> apartments;
	
		@Override
		public void init(ServletConfig config) throws ServletException {
			this.config = config;

		}
	       


		/**
		 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String emailOfLoggedUser = (String) request.getSession().getAttribute("emailOfLoggedUser"); 
			if (emailOfLoggedUser != null && emailOfLoggedUser.equals("admin") ) {
					apartments =  new ArrayList<Apartment>(DataAccess.getAllApartments());
					request.setAttribute("apartments", apartments);
					
					RequestDispatcher dispatcher = request.getRequestDispatcher("/administatorHomes.jsp"); 
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
			
			PrintWriter writer = response.getWriter();
			String action = request.getParameter("action");
			
			if ("updateApartment".equals(action))
			{	
				String email = request.getParameter("email");
				String placeName = request.getParameter("placeName");
				String cuntry= request.getParameter("cuntry");
				double	price = Double.parseDouble(request.getParameter("price"));
				String type = request.getParameter("type");
				int adults_beds = Integer.parseInt(request.getParameter("adults_beds"));
				int childeren_beds = Integer.parseInt(request.getParameter("childeren_beds"));
				String	description = request.getParameter("description");
				
				String buildingNumber = request.getParameter("building_number");
				String street = request.getParameter("street");
				String flatNumber = request.getParameter("flat_number");
				String	city = request.getParameter("city");
				
				
				ApartmentPK apartmentPK = new ApartmentPK(email, buildingNumber, street, flatNumber, city);
				
//				 Apartment apartmen = new Apartment(apartmentPK, adults_beds, childeren_beds, cuntry, description, placeName, price, type); change type
//				 User updatedUserData = new User(email, name, phoneNumber, surname);
//				 int userUpdatedStatus = AdministratorLogic.updateUserData(updatedUserData);
				
				
//				 writer.println(email + placeName + cuntry  + type + Double.toString(price) + Integer.toString(childeren_beds) + Integer.toString(adults_beds)
//						 + description + buildingNumber + street + flatNumber + city);
			}else if ("deletePlace".equals(action))
			{
				
				String email = request.getParameter("email");
				String buildingNumber = request.getParameter("building_number");
				String street = request.getParameter("street");
				String flatNumber = request.getParameter("flat_number");
				String	city = request.getParameter("city");
				
				
				
				writer.println(email + buildingNumber + street + flatNumber + city);
				
				
//				String email = request.getParameter("email");
//				int userDeletedStatus = AdministratorLogic.deleteUser(email);
//				writer.println(userDeletedStatus);
				
			}
			
		}
		
		



}











