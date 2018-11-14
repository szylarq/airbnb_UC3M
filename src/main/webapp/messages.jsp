
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
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

	<link rel="stylesheet" href="css/messaging.css">

	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

	</head>
	<body>
		<div id="fh5co-wrapper">
		<div id="fh5co-page">

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
				document.getElementById("tab-messages").classList.add("active");
			</script>

		<!-- end:header-top -->
     <div id="message-container" class="fh5co-section-gray">	
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
						<h3>Messages</h3>
						<p>These are the messages you have received</p>
				</div>
			</div>
			
			<div class="row row-bottom-padded-md">			
				<div class="col-md-8 col-md-offset-2">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="pull-right">
								<div class="btn-group">
									<button type="button" class="btn btn-success btn-filter" data-target="leido">Read</button>
									<button type="button" class="btn btn-warning btn-filter" data-target="no-leido">Unread</button>
									<button type="button" class="btn btn-default btn-filter" data-target="all">All</button>
								</div>
							</div>
							<div class="table-container">
								<table class="table table-filter">
									<tbody>
										<tr data-status="no-leido" class="no-leido">
											<td>
												<a href="javascript:;" class="star">
													<i class="glyphicon glyphicon-star"></i>
												</a>
											</td>
											<td>
												<div class="media">
													<h4 class="title">
																User Identifier
													</h4>
												</div>
											</td>                                        
											<td>      
													<div class="media">
														<p class="summary">Ut enim ad minim veniam, quis nostrud exercitation...</p>
														<p class="meta">Febrero 13, 2018</p>                                                
													</div>
											</td>
										</tr>    
										<tr data-status="no-leido" class="no-leido">
											<td>
												<a href="javascript:;" class="star">
													<i class="glyphicon glyphicon-star"></i>
												</a>
											</td>
											<td>
												<div class="media">
													<h4 class="title">
																User Identifier
													</h4>
												</div>
											</td>                                        
											<td>      
													<div class="media">
														<p class="summary">Ut enim ad minim veniam, quis nostrud exercitation...</p>
														<p class="meta">Febrero 13, 2018</p>                                                
													</div>
											</td>
										</tr>    
										<tr data-status="leido" class="leido">
											<td>
												<a href="javascript:;" class="star">
													<i class="glyphicon glyphicon-star"></i>
												</a>
											</td>
											<td>
												<div class="media">
													<h4 class="title">
																User Identifier
													</h4>
												</div>
											</td>                                        
											<td>      
													<div class="media">
														<p class="summary">Ut enim ad minim veniam, quis nostrud exercitation...</p>
														<p class="meta">Febrero 13, 2018</p>                                                
													</div>
											</td>
										</tr> 
										<tr data-status="leido" class="leido">
											<td>
												<a href="javascript:;" class="star">
													<i class="glyphicon glyphicon-star"></i>
												</a>
											</td>
											<td>
												<div class="media">
													<h4 class="title">
																User Identifier
													</h4>
												</div>
											</td>                                        
											<td>      
													<div class="media">
														<p class="summary">Ut enim ad minim veniam, quis nostrud exercitation...</p>
														<p class="meta">Febrero 13, 2018</p>                                                
													</div>
											</td>
										</tr>    
										<tr data-status="leido" class="leido">
											<td>
												<a href="javascript:;" class="star">
													<i class="glyphicon glyphicon-star"></i>
												</a>
											</td>
											<td>
												<div class="media">
													<h4 class="title">
																User Identifier
													</h4>
												</div>
											</td>                                        
											<td>      
													<div class="media">
														<p class="summary">Ut enim ad minim veniam, quis nostrud exercitation...</p>
														<p class="meta">Febrero 13, 2018</p>                                                
													</div>
											</td>
										</tr>                                        
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	 	
    <jsp:include page="footer.jsp"/>

	</div>
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

        
<!-- Main JS -->
	<script src="js/main.js"></script>


     <script type="text/javascript">
        $(document).ready(function () {

	$('.star').on('click', function () {
      $(this).toggleClass('star-checked');
    });


    $('.btn-filter').on('click', function () {
      var $target = $(this).data('target');
      if ($target != 'all') {
        $('.table tr').css('display', 'none');
        $('.table tr[data-status="' + $target + '"]').fadeIn('slow');
      } else {
        $('.table tr').css('display', 'none').fadeIn('slow');
      }
    });

 });
</script>
        
	</body>
</html>

