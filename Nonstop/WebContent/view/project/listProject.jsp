<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">

<head>

	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>프로젝트 목록보기</title>

    <!-- Bootstrap Core CSS -->
    <link href="../../resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../../resources/css/full.css" rel="stylesheet">
	<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>
	<!-- jQuery -->
    <script src="../../resources/javascript/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../../resources/javascript/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<!--     <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<link href="/css/animate.min.css" rel="stylesheet">
	<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
	<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link href="../../resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="../../resources/css/full.css" rel="stylesheet">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	  jQuery
    <script src="../../resources/javascript/jquery.js"></script>

    Bootstrap Core JavaScript
    <script src="../../resources/javascript/bootstrap.min.js"></script> -->
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

	<style>
	
		table {
        	border-collapse: collapse;
		    border: collapse;
		    width: 100%;
            padding-left : 20px;
            table-layout : fixed;
		}
		
		th, tr {
		    padding: 8px;
		    text-align: left;
		   
		    text-overflow:ellipsis;
		    overflow:hidden;
		}
		
		.breadcrumb{
			margin : 0;
		}
		
	    .thumbnail:hover{
	    	background-color:#ffffe6;
	    	border: 2px solid orange;
	    }
        
        .thumbnail{
        	/* background-color:#fffffa; */
        }
        
        .glyphicon.glyphicon-plus-sign{
        	background-color: rgba( 255, 255, 255, 0.5 );
      		float : right;
      		border : 0;
     	}
     	
     	.glyphicon.glyphicon-star{
        	background-color: rgba( 255, 255, 255, 0.5 );
      		border : 0;
     	}
     	
     	#shape1{
        	margin:0;
        	padding:5px;
        	background-color: #dddddd;
     	}
     	#shape2{
        	margin:0;
        	padding:5px;
        	background-color: orange;
     	}
     	
     	/* scrap button */
     	.fa-star.inbox-started, .fa-star:hover {
          color: #f78a09;
    	}
      
       .fa-star {
          color: #d5d5d5;
        }
        
        form{
          float : right;
          margin : 0;
        }
        /*  회색 부분 all,web,app */
        .navbar-static-top {
		  padding-top: 30px;
		  height: 120px;
		}
		
		::selection { color:white; background:blue; }
		::-moz-selection { color:white; background:blue; }
     	
     	
	</style>
	<!-- 筌�占쏙옙占쏙옙占� 占쏙옙占쏙옙 prev/next 甕곤옙占쏙옙 -->
	<script type="text/javascript">
		/*검색 펑션*/
		function fncGetList(currentPage) {
			$("#currentPage").val(currentPage);
			var projDivision = $("#projDivision").val();
			var sortFlag = $("#sortFlag").val();
			alert(projDivision);
	            if(projDivision == 1 || projDivision == 11 || projDivision == 12){
	               $("form").attr("method" , "POST").attr("action" , "/project/listProject?projDivision=1&sortFlag=0").submit();
	            }else{
	               $("form").attr("method" , "POST").attr("action" , "/project/listProject?projDivision=2&sortFlag=0").submit();
	            }
			
		
		}
		
		function fncSortList1(){
			var projDivision = $("#projDivision").val();
			var sortFlag = $("#sortFlag").val();
			sortFlag = 1;
			alert(sortFlag);
			
			if(projDivision == 1 || projDivision == 11 || projDivision == 12){
	               $("form").attr("method" , "POST").attr("action" , "/project/listProject?projDivision=1&sortFlag="+sortFlag).submit();
	            }else{
	               $("form").attr("method" , "POST").attr("action" , "/project/listProject?projDivision=2&sortFlag="+sortFlag).submit();
	            }
		}
				
		/*최신등록순*/	
		$(function() {
			$( "#projAnnoStart1" ).on("click" , function() {
				fncSortList1();
			});
		});
		
		/*마감임박순*/
		function fncSortList2(){
			var projDivision = $("#projDivision").val();
			var sortFlag = $("#sortFlag").val();
			sortFlag = 2;
			alert(sortFlag);
			if(projDivision == 1 || projDivision == 11 || projDivision == 12){
	               $("form").attr("method" , "POST").attr("action" , "/project/listProject?projDivision=1&sortFlag="+sortFlag).submit();
	            }else{
	               $("form").attr("method" , "POST").attr("action" , "/project/listProject?projDivision=2&sortFlag="+sortFlag).submit();
	            }
		}
	
		/*마감임박순*/	
		$(function() {
			$( "#projDday1" ).on("click" , function() {
				fncSortList2();
			});
		});
		
		/*조회순*/
		function fncSortList4(){
			var projDivision = $("#projDivision").val();
			var sortFlag = $("#sortFlag").val();
			sortFlag = 4;
			alert(sortFlag);
			if(projDivision == 1 || projDivision == 11 || projDivision == 12){
	               $("form").attr("method" , "POST").attr("action" , "/project/listProject?projDivision=1&sortFlag="+sortFlag).submit();
	            }else{
	               $("form").attr("method" , "POST").attr("action" , "/project/listProject?projDivision=2&sortFlag="+sortFlag).submit();
	            }
		}
	
		/*조회순*/	
		$(function() {
			$( "#projViewCount1" ).on("click" , function() {
				fncSortList4();
			});
		});
			
		
		/*검색기능*/		
		$(function() {
			$( "button.btn.btn-default" ).on("click" , function() {
				fncGetList(1);
			});
		});
		/*검색기능 엔터첬을때 넘어가기*/	
		$(function() {
			$( "#searchKeyword" ).keypress( function(e) {
				if(e.keyCode==13){
					fncGetList(1);
				}
			});
		});
	
		
		$(document).ready(function() {
		    $('#Carousel').carousel({
		        interval: 5000
		    })
		});
		
		
		$(function() {
			$(".glyphicon.glyphicon-plus-sign").on("click", function(){
				self.location ="/view/project/addProjectView.jsp"
			});
			
			$(".detailButton").on("click", function(){
				self.location ="/project/getProject?projNo="+$(this).attr("value");
			});
			
			$("#button-all").on("click" , function() {
	            var projDivision = $(this).val();
	            
	            if(projDivision == 1 || projDivision == 10 || projDivision == 11 || projDivision == 12){
	               self.location="/project/listProject?projDivision=1&sortFlag=0";
	            }else{
	               self.location="/project/listProject?projDivision=2&sortFlag=0";
	            }
	         });
		         
	         $("#button-web").on("click" , function() {
	            var projDivision = $(this).val();
	            
	            if(projDivision == 1 || projDivision == 10 || projDivision == 11 || projDivision == 12){
	               self.location="/project/listProject?projDivision=11&sortFlag=0";
	            }else{
	               self.location="/project/listProject?projDivision=21&sortFlag=0";
	            }
	         });
	         
	         $("#button-app").on("click" , function() {
	            var projDivision = $(this).val();
	            
	            if(projDivision == 1 || projDivision == 10 || projDivision == 11 || projDivision == 12){
	               self.location="/project/listProject?projDivision=12&sortFlag=0";
	            }else{
	               self.location="/project/listProject?projDivision=22&sortFlag=0";
	            }
	         });
			
		
		});
		
		
		   $(function() {
	            /* 스크랩추가 */
	            $("i.fa").on("click" , function() {

	                  var flag = $(this).attr('scrap');
	                  var requestTarget;
	                  alert(flag);

	                  if(flag==0){
	                     requestTarget = "addJsonProjScrap";
	                  }else{
	                     requestTarget = "deleteJsonProjScrap";
	                  }
	                   var projNo=$(this).attr('projNo');
	                   $.ajax(
	                      {
	                         url : "/profile/"+requestTarget+"/"+projNo,
	                         method : "GET",
	                         dateType : "json",
	                         headers : {
	                            "Accept" : "application/json",
	                           "Content-Type" : "application/json"   
	                       },
	                         context : this,
	                         success : function(JSONData , status){
	                          
	                            if(flag==0){
	                               $(this).removeClass('fa fa-star').addClass('fa fa-star inbox-started');
	                               $(this).attr('scrap','1');
	                            }else{
	                               $(this).removeClass('fa fa-star inbox-started').addClass('fa fa-star');
	                           $(this).attr('save','0');
	                            }
	                         }
	                      });
	                   });
	            });

	</script>


</head>

<body>

<jsp:include page="/view/common/toolbar.jsp" />

<!-- Second Navigation -->
<nav class="navbar navbar-default navbar-static-top" role="navigation">
	<div class="container">
		<!-- ALL/WEB/APP -->
		<div class="row">	
			<div class="col-md-6 col-md-offset-3" align="center">
				<input type="hidden" id="projDivision" name="projDivision" value="${param.projDivision}"/>
	        	<button class="button button-neutral" type="button" id="button-all" value="${param.projDivision}">All</button>
	        	<button class="button button-neutral" type="button" id="button-web" value="${param.projDivision}">Web</button>
	        	<button class="button button-neutral" type="button" id="button-app" value="${param.projDivision}">App</button>
			</div>
		</div>
	</div>
</nav>



<!-- Ranking -->
<!-- type -->
<div class="container">
  <input type="hidden" class="projNo" name="projNo" id="projNo" value="${project.projNo}" />
  <input type="hidden" class="projUserId" name="projUserId" id="projUserId" value="${project.projUserId}" />
  <div class="row">
	  <div class="margin-top-20">
		  <div class="text">	
		     <h2 class="text">Project<c:if test="${sessionScope.user.role == 3}"><button type="button" class="glyphicon glyphicon-plus-sign" style="font-size: 35px"/></c:if></h2>
		  </div>
	  </div>
  </div>
</div>

<div class="container">
	<hr class="margin-top-10"/>
</div>
            
<div class="container">
	<div class="row">
		<div class="col-md-6">	
		<form class="form-inline" name="detailForm">
			<ol class="breadcrumb" >
			  <li><a href="#" id="projAnnoStart1">최신등록순</a></li>
			  <li><a href="#" id="projDday1">마감임박순</a></li>
			  <li><a href="#" id="">지원자순</a></li>
			  <li><a href="#" id="projViewCount1" >조회순</a></li>
			</ol>
		</form>
		</div>
		
		<div class="col-md-6">
	    <form class="form-inline" name="detailForm">
		  <div class="form-group">
		    <select class="form-control" name="searchCondition" >
				<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>제목</option>
				<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>개발기술</option>
				<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>개발지역</option>
			</select>
		  </div>
		  
		  <div class="form-group">
		    <label class="sr-only" for="searchKeyword">검색어</label>
		    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword" 
		    	   value="${! empty search.searchKeyword ? search.searchKeyword : '' }" >
		  </div>
		  
		  <button type="button" class="btn btn-default">검색</button>
		  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
		  <input type="hidden" id="currentPage" name="currentPage" value="${search.currentPage}"/>
		</form>
		</div>
	</div>
</div>


    <!-- Page Content -->
    <div class="margin-bottom-40">
    	<div class="container">   	
        	<div class="row">
        		<c:set var="i" value="0" />
				<c:forEach var="project" items="${list}">
				<c:set var="i" value="${ i+1 }" />
					<div class="col-md-6 col-sm-6 hero-feature" style="margin-top: 30px; margin-bottom: 20px; height: 400px">
						<input type="hidden" class="projNo" name="projNo" id="projNo" value="${project.projNo}" />
						<input type="hidden" name="projAnnoStart" id="projAnnoStart" value="${project.projAnnoStart}" /> 
						<input type="hidden" name="projAnnoEnd" id="projAnnoEnd" value="${project.projAnnoEnd}" /> 
						<input type="hidden" name="projStartDate" id="projStartDate" value="${project.projStartDate}" /> 
						<input type="hidden" name="projEndDate" id="projEndDate" value="${project.projEndDate}" />
						<input type="hidden" name="sortFlag" id="sortFlag" class="sortFlag" value="${project.sortFlag}" />
						<div class="thumbnail">
							<table style="height: 400px; overflow:hidden;">
								<tr style="height: 40px; border-bottom: 1px solid #ddd">
									<th colspan="10" style="font-size: 25px; table-layout: fixed; height: 40px;  white-space:nowrap;">
										<c:if test="${project.scrapNo==0}">
			                               <i class="fa fa-star" projNo="${project.projNo}" scrap="${project.scrapNo}"></i>
			                            </c:if>
			                            <c:if test="${project.scrapNo!=0}">
			                               <i class="fa fa-star inbox-started"  projNo="${project.projNo}" scrap="${project.scrapNo}"></i>
			                            </c:if>
										${project.projTitle}
									</th>
									<th colspan="2" style="text-align: center">
										<c:choose>
											<c:when test="${project.projDday<=0}">
												<div class="w3-panel w3-round-large" id="shape1">
												    <font color=black>마감</font>
												</div>
											</c:when>
											<c:when test="${project.projDday>=1}">
												<div class="w3-panel w3-round-large" id="shape2">
													<font color=white>모집중</font>
												</div>
											</c:when>
										</c:choose>
									</th>
								</tr>

								<tr style="height: 10px; font-size: 15px; text-align: center">
									<td colspan="3">공고기간</td>
									<td colspan="3">예상기간</td>
									<td colspan="3">지원자수</td>
									<td colspan="3">개발지역</td>
								</tr>

								<tr style="height: 50px">

									<!-- <th colspan="3" style="border-right: 1px solid #ddd; text-align: center" id="thatDay" value=""><script language=javascript>d_day()</script>일 남음</th>
									<th colspan="3" style="border-right: 1px solid #ddd; text-align: center" id="expectDay" value=""><script language=javascript>expect_day()</script>일</th> -->
									<th colspan="3" style="border-right: 1px solid #ddd; text-align: center" id="thatDay" value="">
										<c:choose>
											<c:when test="${project.projDday<=0}">
												<font color=#ff607f>마감</font>
											</c:when>
											<c:when test="${project.projDday==1}">
												<font color=#ff607f>마감 임박</font>
											</c:when>
											<c:when test="${project.projDday>1}">
												<font color=#ff607f>${project.projDday}</font>일 남음
											</c:when>
										</c:choose>
									</th>
									<th colspan="3" style="border-right: 1px solid #ddd; text-align: center" id="expectDay" value="">${project.projExpectDate}일</th>
									<th colspan="3" style="border-right: 1px solid #ddd; text-align: center">sdsdfsdf</th>
									<th colspan="3" style="text-align: center">${project.projLocation}</th>
								</tr>

								<tr style="height: 10px; border-bottom: 1px solid #ddd">
									<th colspan="12"></th>
								</tr>

								<tr style="height: 20px">
									<th colspan="12">
									<c:choose>
										<c:when test="${project.projDivision==11}">
									  		개발 분야 : 개발>WEB
									  	</c:when>
										<c:when test="${project.projDivision==12}">
									  		개발 분야 : 개발>APP
									  	</c:when>
										<c:when test="${project.projDivision==21}">
									  		개발 분야 : 디자이너>WEB
									  	</c:when>
										<c:when test="${project.projDivision==22}">
									  		개발 분야 : 디자이너>APP
									  	</c:when>
									</c:choose></th>
								</tr>


								<tr style="height: 20px; border-bottom: 1px solid #ddd">
									<th colspan="12">개발 기술 : java ${project.projAnnoStart}</th>
								</tr>

								<tr style="height: 150px; text-align: top-left;" class="projDetail">
									<td colspan="12">
										<p>
											<strong>상세내용</strong>
										</p> 
									${project.projDetail}
									</td>
								</tr>

								<tr>
									<th colspan="4" ></th>
									<th colspan="4" style="background-color: #dddddd; text-align: center" class="detailButton" value="${project.projNo}">상세보기</th>
									<th colspan="4" ></th>
								</tr>
							</table>
						</div>
					</div>
				</c:forEach>
	            </div>
	         </div>
	      </div>

</body>

</html>


<!-- pagination -->
  <!--      <nav align="center">
	  <ul class="pagination">
	    <li>
	      <a href="#" aria-label="Previous">
	        <span aria-hidden="true">&laquo;</span>
	      </a>
	    </li>
	    <li><a href="#">1</a></li>
	    <li><a href="#">2</a></li>
	    <li><a href="#">3</a></li>
	    <li><a href="#">4</a></li>
	    <li><a href="#">5</a></li>
	    <li>
	      <a href="#" aria-label="Next">
	        <span aria-hidden="true">&raquo;</span>
	      </a>
	    </li>
	  </ul>
	</nav>
 -->
    


<!-- // 기술 제이슨으로 보내기

	function aaa(jsondata){
		for(i=0;i<jsondata;i++){
			'<input type="checkbox" value='+jsondata[i].techNo+'>'+jsondata[i]techName
		}
	}



안녕하세요김준영입니다새롭게보게되   타이틀 최대숫자



	        
	             
	<div class="container text-center">
		 
		 <nav>
		  <ul class="pagination" >
		    
		  	<c:if test="${ resultPage.currentPage <= resultPage.pageUnit }">
		 		<li class="disabled">
			</c:if>
			<c:if test="${ resultPage.currentPage > resultPage.pageUnit }">
				<li>
			</c:if>
		      <a href="javascript:fncGetList('${ resultPage.currentPage-1}')" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		    
			<c:forEach var="i"  begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" step="1">
				
				<c:if test="${ resultPage.currentPage == i }">
				    <li class="active">
				    	<a href="javascript:fncGetList('${ i }');">${ i }<span class="sr-only">(current)</span></a>
				    </li>
				</c:if>	
				
				<c:if test="${ resultPage.currentPage != i}">	
					<li>
						<a href="javascript:fncGetList('${ i }');">${ i }</a>
					</li>
				</c:if>
			</c:forEach>
		    
		     <c:if test="${ resultPage.endUnitPage >= resultPage.maxPage }">
		  		<li class="disabled">
			</c:if>
			<c:if test="${ resultPage.endUnitPage < resultPage.maxPage }">
				<li>
			</c:if>
		      <a href="javascript:fncGetList('${resultPage.endUnitPage+1}')" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		  </ul>
		</nav>
		
	</div>


 -->

