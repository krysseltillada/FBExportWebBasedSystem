<%@ include file = "../../lib/tags/tag-libraries.jsp" %>

<header class="page-header pb-3">
    <div class="container-fluid">

        <div class = "row">
            <div class = "col-lg">
                <span class="h3 no-margin-bottom mr-2">Report logs</span>
            </div>
        </div>

    </div>
</header>   

 <section class = "no-padding-top p-0">
    <div class = "container-fluid p-0">

        <div class = "row">
            <div class = "col-lg">
            <div class = "card mb-0">
                <div class = "card-body ml-2">

                <ul class="nav nav-tabs">
                <li class="nav-item">
                    <a class="nav-link active" href="<c:url value = '/admin/report-logs' />">System logs</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value = '/admin/report-logs/user-access-logs' />">User access logs</a>
                </li>
                
                </ul>

                <br />

                <table id="systemLog" class="table">
                    <thead>
                        <tr>
                            <th>Action Type</th>
                            <th>Description</th>
                            <th>Date occured</th>
                            <th>Time occured</th>
                            
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>Action Type</th>
                            <th>Description</th>
                            <th>Date occured</th>
                            <th>Time occured</th>
                            
                        </tr>
                    </tfoot>
                    <tbody>
                    	<c:forEach var = "systemLog" items = "${systemLogList}">
                    		
	                        <tr>
	                            <td>${systemLog.actionType}</td>
	                            <td>${systemLog.description}</td>
	                            <td><fmt:formatDate value = "${systemLog.dateOccured}" type = "date" dateStyle = "LONG" /></td>
	                            <td><fmt:formatDate value = "${systemLog.timeOccured}" type = "time" timeStyle = "MEDIUM" /></td>
	                        </tr>
                        </c:forEach>
                    </tbody>
                </table>

                </div>
            </div>
            

        </div>

    </div>
</section>  