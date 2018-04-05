<%@ include file = "../../lib/tags/tag-libraries.jsp" %>

<section class="dashboard-counts no-padding-bottom pt-0">
    <div class="container-fluid">

        <div class = "row pl-0 pb-2 pt-3">
        <div class = "col-lg-2 pl-0">
            <div class = "card mb-0">
            <div class = "card-header p-2">
                <h3 class = "text-center m-1">
                <span class = "mr-1"> Orders </span>
                <i class="fa fa-list-alt" aria-hidden="true"></i>
                </h3>
            </div>
            </div>
        </div>

        </div>

        <div class="row bg-white has-shadow p-0" style = "font-size: 14px;">
		
        <div class="col-xl-3 col-sm-4">
            <div class="item d-flex align-items-center">
                <div class="icon bg-orange"><i class="fa fa-tasks" aria-hidden="true"></i></div>
                <div class="title"><span>Pending<br>Orders</span>
                </div>
                <div class="number"><strong>${not empty orderCount.get('PENDING') ? orderCount.get('PENDING') : 0}</strong></div>
            </div>
        </div>
        
        
        <div class="col-xl-3 col-sm-4">
            <div class="item d-flex align-items-center">
            <div class="icon bg-green"><i class="fa fa-check" aria-hidden="true"></i></div>
            <div class="title"><span>Approved<br>Orders</span>
            </div>
            <div class="number"><strong>${not empty orderCount.get('APPROVED') ? orderCount.get('APPROVED') : 0}</strong></div>
            </div>
        </div>

        <div class="col-xl-3 col-sm-4">
            <div class="item d-flex align-items-center">
            <div class="icon bg-yellow"><i class="fa fa-usd" aria-hidden="true"></i></div>
            <div class="title"><span>Paid<br>Orders</span>
            </div>
            <div class="number"><strong>${not empty orderCount.get('PAID') ? orderCount.get('PAID') : 0}</strong></div>
            </div>
        </div>

            <div class="col-xl-3 col-sm-6">
            <div class="item d-flex align-items-center">
            <div class="icon bg-red"><i class="fa fa-times" aria-hidden="true"></i></div>
            <div class="title"><span>Rejected<br>Orders</span>
            </div>
            <div class="number"><strong>${not empty orderCount.get('REJECTED') ? orderCount.get('REJECTED') : 0}</strong></div>
            </div>
        </div>

        </div>

    </div>
    </section>

    <section class="dashboard-header pt-2 no-padding-bottom">
    <div class="container-fluid">

        <div class="row">

        <div class="chart col-lg-8 col-12">
            <div class="line-chart bg-white d-flex align-items-center justify-content-center has-shadow no-padding-top">
            <canvas id="lineCahrt" width="592" height = "350" class="chartjs-render-monitor"></canvas>
            </div>
        </div>

        <div class = "col-lg-4 pl-0">

            <div class = "row">
            <div class = "col-lg">
                <div class="daily-feeds card">

                <div class="card-header">
                    <h3 class="h4">Latest orders
                    <i class="fa fa-list-ul ml-2" aria-hidden="true"></i>

                    </h3>
                </div>
                <div class="card-body no-padding" style = "max-height: 305px; overflow-y: auto;">
					
					<c:choose>
						<c:when test="${not empty latestOrders}">
							<c:forEach var="order" items="${latestOrders}">
								<div class="item">
				                    <div class="feed d-flex justify-content-between">
				                        <div class="feed-body d-flex justify-content-between"><a href="#" class="feed-profile"><img style="width: 50px; height: 50px;" src="<c:url value = "${not empty order.getCustomer().getProfileImageLink() ? order.getCustomer().getProfileImageLink() : order.getCustomer().getGender() == 'MALE' ? '/resources/customer/img/profile-male.jpg' : '/resources/customer/img/profile-female.jpg' }" />" alt="${order.getCustomer().getUsername()}" class="img-fluid rounded-circle"></a>
				                        <div class="content">
				                            <h5>${order.getCustomer().getFirstname()} ${order.getCustomer().getLastname()}</h5><span>Status : ${ order.getOrderStatus() } </span>
				                            <div class="full-date"><small><fmt:formatDate value = "${order.getDateOrdered()}" type = "date" dateStyle = "LONG" /></small></div>
				                        </div>
				                        </div>
				                        
				                    </div>
				                 </div>
							</c:forEach>
						</c:when>
						<c:otherwise>
						<div class="item">
				        	<div class="feed d-flex justify-content-between">
				        		<h4>No Latest Orders</h4>
				            </div>
				        </div>
							
						</c:otherwise>
					</c:choose>
                    

                </div>
                </div>
            </div>
            </div>

        </div>

        </div>
    </div>
    </section>
    
    <section class = "dashboard-counts no-padding-bottom pt-0">
            <div class = "container-fluid">
                <div class="row bg-white has-shadow p-0 mt-2" style = "font-size: 14px;">

                <div class="col-xl-3 col-sm-6">
                  <div class="item d-flex align-items-center">
                    <div class="icon bg-violet"><i class="fa fa-ship" aria-hidden="true"></i></div>
                    <div class="title"><span>To ship <br>Orders</span>
                    </div>
                    <div class="number"><strong>${not empty orderCount.get('TO_SHIP') ? orderCount.get('TO_SHIP') : 0}</strong></div>
                  </div>
                </div>

                <div class="col-xl-3 col-sm-6">
                  <div class="item d-flex align-items-center">
                    <div class="icon bg-blue"><i class="icon-padnote"></i></div>
                    <div class="title"><span>Received<br>Orders</span>
                    </div>
                    <div class="number"><strong>${not empty orderCount.get('RECEIVED') ? orderCount.get('RECEIVED') : 0}</strong></div>
                  </div>
                </div>

                <div class="col-xl-3 col-sm-6">
                  <div class="item d-flex align-items-center">
                    <div class="icon bg-red"><i class="fa fa-times" aria-hidden="true"></i></div>
                    <div class="title"><span>Cancelled<br>Orders</span>
                    </div>
                    <div class="number"><strong>${not empty orderCount.get('CANCELLED') ? orderCount.get('CANCELLED') : 0}</strong></div>
                  </div>
                </div>

                 <div class="col-xl-3 col-sm-6">
                  <div class="item d-flex align-items-center">
                    <div class="icon bg-red"><i class="fa fa-arrow-left" aria-hidden="true"></i></div>
                    <div class="title"><span>Returned<br>Orders</span>
                    </div>
                    <div class="number"><strong>${not empty orderCount.get('RETURNED') ? orderCount.get('RETURNED') : 0}</strong></div>
                  </div>
                </div>


              </div>
            </div>
          </section>

    <section class="dashboard-header pt-3 no-padding-bottom">
        <div class="container-fluid">
        <div class = "row pb-2">
            <div class = "col-lg-2">
                <div class = "card mb-0">
                <div class = "card-header p-2">
                    <h3 class = "text-center m-1">
                    <span class = "mr-2"> Users </span>
                    <i class="fa fa-users" aria-hidden="true"></i>
                    </h3>
                </div>
                </div>
            </div>
        </div>

        <div class = "row">
            <div class="statistics col-lg-3 col-12">
            <div class="statistic d-flex align-items-center bg-white has-shadow mb-2">
                <div class="icon bg-red"><i class="fa fa-user" aria-hidden="true"></i></div>
                <div class="text"><strong>${onlineUsers.get(true) > 0 ? onlineUsers.get(true) : 0}</strong><br><small>online users</small></div>
            </div>
            <div class="statistic d-flex align-items-center bg-white has-shadow mb-2">
                <div class="icon bg-green"><i class="fa fa-users" aria-hidden="true"></i></div>
                <div class="text"><strong>${onlineUsers.get(true) + onlineUsers.get(false)}</strong><br><small>registered users</small></div>
            </div>
            <div class="statistic d-flex align-items-center bg-white has-shadow">
                <div class="icon bg-orange"><i class="fa fa-user-times" aria-hidden="true"></i></div>
                <div class="text"><strong>${onlineUsers.get(false) > 0 ? onlineUsers.get(false) : 0}</strong><br><small>offline users</small></div>
            </div>
            </div>

            <div class="chart col-lg-9 col-12 pl-0">
            <div class="line-chart-example card">

            <div class="card-body"><div class="chartjs-size-monitor" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;"><div class="chartjs-size-monitor-expand" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div></div><div class="chartjs-size-monitor-shrink" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:200%;height:200%;left:0; top:0"></div></div></div>
                <canvas id="lineChartExample" width="592" height="215" class="chartjs-render-monitor" style="display: block; width: 592px; height: 296px;"></canvas>
            </div>
            </div>
            </div>
        </div>
        </div>
    </section>


    <section class = "products-section pt-0 no-padding-bottom">
    <div class = "container-fluid">

        <div class = "row pb-2 pt-0">
        <div class = "col-lg-3">
            <div class = "card mb-0">
            <div class = "card-header p-2">
                <h3 class = "text-center m-1">
                <span class = "mr-2"> Top products </span>
                <i class="fa fa-list-ol" aria-hidden="true"></i>
                </h3>
            </div>
            </div>
        </div>

        </div>

        <div class = "row">
        <div class = "col-lg pr-1">
            <div class="articles card">

            <div class="card-header d-flex align-items-center">
                <h2 class="h3">
                <span class = "mr-2"> Paid products </span>
                <i class="fa fa-check-square-o" aria-hidden="true"></i>
                </h2>
            </div>
            <div class="card-body no-padding">
                <c:choose>
            		<c:when test="${not empty mostPaidProduct}">
	                	<c:forEach var="paid" items="${mostPaidProduct}">
	                		<div class="item d-flex align-items-center">
	                		<div class="image"><img style="width: 50px; height: 50px;" src="<c:url value='${paid.key.getProductImageLink()}' />" alt="${paid.key.getName()}" class="img-fluid rounded-circle"></div>
			                	<div class="text">
			                    	<a href="#"><h3 class="h5" >${paid.key.getName()}</h3></a><small>Total Paid : <span>${paid.value}</span></small>
			                	</div>
			                </div>
			                
	                	</c:forEach>
            		</c:when>
            		<c:otherwise>
	            		<div class="item d-flex align-items-center">
	            			<div class="feed d-flex justify-content-between">
					        	<h4>No Most Paid Products</h4>
					        </div>
					    </div>
            		</c:otherwise>
            	</c:choose>
            </div>
            </div>
        </div>
        <div class = "col-lg pl-1 pr-1">
            <div class="articles card">

            <div class="card-header d-flex align-items-center">
                <h2 class="h3">
                <span class = "mr-2"> Rated Products </span>
                <i class="fa fa-star" aria-hidden="true"></i>
                <i class="fa fa-star" aria-hidden="true"></i>
                <i class="fa fa-star" aria-hidden="true"></i>
                <i class="fa fa-star" aria-hidden="true"></i>
                <i class="fa fa-star-half-o" aria-hidden="true"></i>
                </h2>
            </div>
            <div class="card-body no-padding">
            	<c:choose>
            		<c:when test="${not empty mostRatedProduct}">
	                	<c:forEach var="rating" items="${mostRatedProduct}">
	                		<div class="item d-flex align-items-center">
	                		<div class="image"><img style="width: 50px; height: 50px;" src="<c:url value='${rating.getProduct().getProductImageLink()}' />" alt="${rating.getProduct().getName()}" class="img-fluid rounded-circle"></div>
			                	<div class="text">
			                    	<a href="#"><h3 class="h5">${rating.getProduct().getName()}</h3></a><small>Total Stars : <fmt:formatNumber value="${rating.getRate()}" type="NUMBER" minFractionDigits="0"></fmt:formatNumber></small><br><small>Total Views : ${rating.getViews()}</small>
			                	</div>
			                </div>
			                
	                	</c:forEach>
            		</c:when>
            		<c:otherwise>
	            		<div class="item d-flex align-items-center">
	            			<div class="feed d-flex justify-content-between">
					        	<h4>No Most Rated Products</h4>
					        </div>
					    </div>
            		</c:otherwise>
            	</c:choose>
            </div>
            </div>
        </div>
        <div class = "col-lg pl-1">
            <div class="articles card">

            <div class="card-header d-flex align-items-center">
                <h2 class="h3">
                <span class = "mr-2"> Viewed Products </span>
                <i class="fa fa-user" aria-hidden="true"></i>
                </h2>
            </div>
            <div class="card-body no-padding">
                <c:choose>
            		<c:when test="${not empty mostViewedProduct}">
	                	<c:forEach var="views" items="${mostViewedProduct}">
	                		<div class="item d-flex align-items-center">
	                		<div class="image"><img style="width: 50px; height: 50px;" src="<c:url value='${views.getProduct().getProductImageLink()}' />" alt="${views.getProduct().getName()}" class="img-fluid rounded-circle"></div>
			                	<div class="text">
			                    	<a href="#"><h3 class="h5">${views.getProduct().getName()}</h3></a><small>Total Stars : <fmt:formatNumber value="${views.getRate()}" type="NUMBER" minFractionDigits="0"></fmt:formatNumber></small><br><small>Total Views : ${views.getViews()}</small>
			                	</div>
			                </div>
			                
	                	</c:forEach>
            		</c:when>
            		<c:otherwise>
	            		<div class="item d-flex align-items-center">
	            			<div class="feed d-flex justify-content-between">
					        	<h4>No Most Viewed Products</h4>
					        </div>
					    </div>
            		</c:otherwise>
            	</c:choose>
            </div>
            </div>
        </div>
        </div>
    </div>
    </section>

    <section class = "no-padding-top no-padding-bottom">
    <div class = "container-fluid">
        <div class = "row">
        <div class = "col-lg-8">
        <div class = "card">
            <div class = "card-body p-1">
            <iframe src="https://investingwidgets.com/live-currency-cross-rates?theme=lightTheme&pairs=9922,9923,9924,9925,9927,9928,9929,9930,9931,9932,9933,9934,9935,9936,9937,9938,9939,9940,9941,9942,9943,9944,9945,9946,9947,9948,9949,9950,9951,9952" width="100%" height="500px" frameborder="0" allowtransparency="true" marginwidth="0" marginheight="0"></iframe>
            </div>
        </div>
        </div>
        <div class = "col-lg-4">
        <div class = "card">
            <div class = "card-body p-1">
            <a class="weatherwidget-io" href="https://forecast7.com/en/40d71n74d01/new-york/" data-label_1="MANILA" data-label_2="WEATHER" data-icons="Climacons Animated" data-theme="pure" >NEW YORK WEATHER</a>
            <script>
            !function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="https://weatherwidget.io/js/widget.min.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","weatherwidget-io-js");
            </script>
            </div>
        </div>
        </div>
    </div>
</section>  
