<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html class="full" lang="ko">
<!-- Make sure the <html> tag is set to the .full CSS class. Change the background image in the full.css file. -->

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Nonstop</title>

    <!-- Bootstrap Core CSS -->
    <link href="../../resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../../resources/css/full.css" rel="stylesheet">
    
    <!-- jQuery -->
    <script src="../../resources/javascript/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../../resources/javascript/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

    <!-- Theme JavaScript -->
    <script src="../../resources/javascript/mainpage.js"></script>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <style>
    body {
    	padding-top: 0; 
    }
    
   	#center {
		margin-left:20%;
        margin-right:10%;
	}
    </style>
    <script type="text/javascript">
	//============= logout Event  처리 =============	
	 $(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	 	$("a:contains('Statistics')").on("click" , function() {
			$(self.location).attr("href","/user/logout");
			//self.location = "/user/logout"
		}); 
	 });
	
	//============= toolbar project 이동 Event 처리 =============	
	 $(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	 	$("#projDesigner").on("click" , function() {
			//$(self.location).attr("href","/user/logout");
			self.location = "/project/getProject?projNo=18"
		}); 
	 });
	
	//============= toolbar project 이동 Event 처리 =============
	 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("#projDeveloper").on("click" , function() {
				//$(self.location).attr("href","/user/logout");
				self.location = "/project/getProject?projNo=18"
			}); 
		 });
	
	//============= toolbar portfolio 이동 Event 처리 =============
	 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("#portDesigner").on("click" , function() {
				//$(self.location).attr("href","/user/logout");
				self.location = "/portfolio/listPortfolio"
			}); 
		 });
	
	//============= toolbar portfolio 이동 Event 처리 =============
	 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("#portDeveloper").on("click" , function() {
				//$(self.location).attr("href","/user/logout");
				self.location = "/portfolio/listPortfolio"
			}); 
		 });
	
	//=============  개인정보조회회 Event  처리 =============	
 	$( "a:contains('개인정보조회')" ).on("click" , function() {
 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$(self.location).attr("href","/user/getUser?userId=${sessionScope.user.userId}");
	});
			
			
	</script> 

</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">

<!-- ToolBar Start /////////////////////////////////////-->
<%-- <jsp:include page="/view/common/toolbar.jsp" /> --%>
<!-- ToolBar End   /////////////////////////////////////-->

    <!-- Navigation -->
    <nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse">
                    Menu <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top">
                    <i class="fa fa-play-circle"></i> NONSTOP
                </a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-main-collapse">
                <ul class="nav navbar-nav" id="center">
                    <!-- Hidden li included to remove active class from about link when scrolled up past about section -->
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    
                    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Portfolio</a>
				       <ul class="dropdown-menu">
				         <li><a href="#" id="portDesigner">Designer</a></li>
				         <li><a href="#" id="portDeveloper">Developer</a></li>
				       </ul>
				    </li>

				    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Project </a>
				       <ul class="dropdown-menu">
				         <li><a href="#" id="projDesigner">Designer</a></li>
				         <li><a href="#" id="projDeveloper">Developer</a></li>
				       </ul>
				    </li>
				      
				      
				    <li><a href="#">Statistics</a></li>
				</ul>
				
				<ul class="nav navbar-nav navbar-right">
			      <%-- <c:if test="${sessionScope.user.role == '1' || ${sessionScope.user.role == '2' || ${sessionScope.user.role == '3'}"> --%>
				   	  <li><a href="#"><span class="glyphicon glyphicon-user"></span>김준영님 환영합니다.</a></li>
				   	  <li><a href="#"><span class="glyphicon glyphicon-envelope"></span></a></li>
				      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-align-justify"></span></a>
				        <ul class="dropdown-menu">
				          <li><a href="#">프로필</a></li>
				          <li><a href="#">내정보보기</a></li>
				          <li><a href="#">내정보수정</a></li>
				          <li><a href="#">팔로우 목록보기</a></li>
				          <li><a href="#">로그아웃</a></li>
				        </ul>
				      </li>
				      
				      
				      
				     <!--  <li><a href="#"><span class="glyphicon glyphicon-align-justify"></span></a></li> -->
			     <%--  </c:if> --%>
			      
			      <%-- <c:if test="${sessionScope.user.role != '1' || ${sessionScope.user.role != '2' || ${sessionScope.user.role != '3'}">
			      	  <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
				      <li><a href="#"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>
				  </c:if> --%>
			    </ul>
	         </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Intro Header -->
    <header class="intro">
        <div class="intro-body">
            <div class="container">
                <div class="row">
                	<div class="col-md-8 col-md-offset-2">
                        <h1 class="brand-heading">NONSTOP</h1>
                        <p class="intro-text">A free, responsive, one page Bootstrap theme.
                            <br>Created by Start Bootstrap.</p> -->
                        <a href="#about" class="btn btn-circle page-scroll">
                            <i class="fa fa-angle-double-down animated"></i>
                        </a>
                	</div>
                </div>
            </div>
        </div>
    </header>

    <!-- About Section -->
    <section id="about" class="about">
        <div class="about-section">
       		<div class="container">
	      		<div class="col-lg-8 col-lg-offset-2">
	                <h2>About Grayscale</h2>
	                <p>Grayscale is a free Bootstrap 3 theme created by Start Bootstrap. It can be yours right now, simply download the template on <a href="http://startbootstrap.com/template-overviews/grayscale/">the preview page</a>. The theme is open source, and you can use it for any purpose, personal or commercial.</p>
	                <p>This theme features stock photos by <a href="http://gratisography.com/">Gratisography</a> along with a custom Google Maps skin courtesy of <a href="http://snazzymaps.com/">Snazzy Maps</a>.</p>
	                <p>Grayscale includes full HTML, CSS, and custom JavaScript files along with LESS files for easy customization.</p>
	            </div> 
	         </div> 
        </div>
    </section>

    <!-- Download Section -->
    <section id="download" class="download">
        <div class="download-section">
            <div class="container">
            </div>
        </div>
    </section>

    <!-- Contact Section -->
    <section id="contact" class="contact">
        <div class="contact-section">
            <div class="container">             
            </div>
        </div>
    </section>

  
    <!-- Footer -->
    <footer>
        <div class="container text-center">
            <p>Copyright &copy; Your Website 2016</p>
        </div>
    </footer>



</body>

</html>