
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->

<%@ page import="model.*" %>
<%@ page import=" java.util.*"%>
<%@ page import="logic.*" %>

	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>TIWbnb</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
	<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
	<meta name="author" content="FREEHTML5.CO" />

  	<!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">

	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>

	<!-- Animate.css -->
	<link rel="stylesheet" href="css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="css/bootstrap.css">
	<!-- Superfish -->
	<link rel="stylesheet" href="css/superfish.css">
	<!-- Magnific Popup -->
	<link rel="stylesheet" href="css/magnific-popup.css">
	<!-- Date Picker -->
	<link rel="stylesheet" href="css/bootstrap-datepicker.min.css">
	<!-- CS Select -->
	<link rel="stylesheet" href="css/cs-select.css">
	<link rel="stylesheet" href="css/cs-skin-border.css">

	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/manageProfile.css">


	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
	<script type="text/javascript" src="js/manageProfile.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

	</head>
	<body>
		<div id="fh5co-wrapper">
		<div id="fh5co-page">

			<!-- start:header-top -->
			<%
			String emailOfLoggedUser = (String) request.getSession().getAttribute("emailOfLoggedUser"); 		
			if (emailOfLoggedUser != null) { 
				if (!emailOfLoggedUser.equals("admin")) {%>
				<jsp:include page="headerLogin.jsp"/> 
				<%} else { %>
				<jsp:include page="headerAdmin.jsp"/>
			<% } 
			} else {  %>
				<jsp:include page="headerLogout.jsp"/>
			<% } %>
			<script type="text/javascript">
				document.getElementById("tab-profile").classList.add("active");
			</script>

			<!-- end:header-top -->

		<div id="fh5co-tours" class="fh5co-section-gray">
			<div class="container" id="user-data-container">
				<h1>Your Profile</h1>
				<div id="profile-picture">

				</div>
				<form action="updateUserServlet" id="user-data-form" method="POST">
				<% User user =  (User)request.getAttribute("user");
					if(user != null)
					{		%>
					<label for="email">Email</label>
					<input type="text" id="user-email" name="email" value="<%= user.getEmail() %>"  readonly >
					<label for="name">Name</label>
					<input type="text" id="user-name" name="name" value="<%= user.getName() %>" >
					<label for="name" > Surname</label>
					<input type="text" id="user-surname" name="surname" value="<%= user.getSurname() %>" >
					<label for="phone" > Phone Number</label>
					<input type="number" id="user-phone" name="phoneNumber" value="<%= user.getPhone() %>" >
					<input type="hidden"  name="action" value="updateUser" >
					
					<input type="submit" class="btn btn-success" id="save-changes-button" value="save">
				<% }	%> 
				</form>
				<button type="button" class="btn btn-warning" id="change-password-button" onclick="changePassword()">Change Password</button>
		 		<button type="button" class="btn btn-danger"  id="delete-acount-button"onclick="deleteAccount()">Delete Account</button>

			</div>



			<div class="container" id="user-houses-container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
						<h3>Your Apartments</h3>
					</div>
				</div>
				<div class="row row-bottom-padded-md">
				
				
				
					<%
							ArrayList<Apartment> userApartments = (ArrayList<Apartment>) request.getAttribute("userApartments");
							if(userApartments != null)
							{
								for (int i = 0; i < userApartments.size(); i++)
								{ %>
									
								<div class="col-md-4 col-sm-6 fh5co-tours animate-box" data-animate-effect="fadeIn">
									<div href="#"><img src="images/place-1.jpg" alt="Free HTML5 Website Template by FreeHTML5.co" class="img-responsive">
										<div class="desc user-apartment">
											<span></span>
											<h3 class="user-apartment-title"> <%=userApartments.get(i).getName() %></h3>
											<span><%=userApartments.get(i).getType() %></span>
											<span class="price"><%=userApartments.get(i).getPrice() + "E" %></span>
											<a class="btn btn-primary btn-outline" href="#">Edit <i class="icon-arrow-right22"></i></a>
										</div>
									</div>
								</div>
							
						<%		 }
							} %>
					
					
					
					
					<div class="col-md-4 col-sm-6 fh5co-tours animate-box" data-animate-effect="fadeIn" id="add-apartemnt-square">
						<div href="#"><img src="images/place-2.jpg" alt="Free HTML5 Website Template by FreeHTML5.co" class="img-responsive">
							<div class="desc">
								<h1 id="add-new-apartment-plus"><a href="addApartment.jsp">+</a></h1>
							</div>
						</div>
					</div>


				</div>

			</div>
		</div>


	<jsp:include page="footer.jsp"/></div>
	<!-- END fh5co-page -->

	</div>
	<!-- END fh5co-wrapper -->


	<!-- jQuery -->

	<script src="js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/sticky.js"></script>

	<!-- Stellar -->
	<script src="js/jquery.stellar.min.js"></script>
	<!-- Superfish -->
	<script src="js/hoverIntent.js"></script>
	<script src="js/superfish.js"></script>
	<!-- Magnific Popup -->
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/magnific-popup-options.js"></script>
	<!-- Date Picker -->
	<script src="js/bootstrap-datepicker.min.js"></script>
	<!-- CS Select -->
	<script src="js/classie.js"></script>
	<script src="js/selectFx.js"></script>

	<!-- Main JS -->
	<script src="js/main.js"></script>


    <script>

    </script>

	</body>
</html>
