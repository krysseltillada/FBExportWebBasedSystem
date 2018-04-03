<%@ include file = "../../lib/tags/tag-libraries.jsp" %>

<section class = "no-padding-top p-0">
    <div class = "container-fluid p-0">

    <div class = "row">
        <div class = "col-lg">
        <div class = "card mb-0">
            <div class = "card-body ml-2">

            <ul class="nav nav-tabs">
            <li class="nav-item">
                <a class="nav-link" href="<c:url value = '/admin/report-logs' />">System logs</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="<c:url value = '/admin/report-logs/user-access-logs' />">User access logs</a>
            </li>
            
            </ul>

            <br />

            <table id="userAccessLog" class="table" cellspacing="0" width="100%">
                <thead>
                    <tr>
                        <th>User</th>
                        <th>Name</th>
                        <th>Position</th>
                        <th>Description</th>
                        <th>IP address</th>
                        <th>Date occured </th>
                        <th>Time occured </th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>User</th>
                        <th>Name</th>
                        <th>Position</th>
                        <th>Description</th>
                        <th>IP address</th>
                        <th>Date occured </th>
                        <th>Time occured </th>
                    </tr>
                </tfoot>
                <tbody>
					<c:forEach var = "userAccessLog" items = "${userAccessLogList}">
	                    <tr>
	                        <td>${userAccessLog.employee.username}</td>
	                        <td>${userAccessLog.employee.firstname} ${userAccessLog.employee.lastname}</td>
	                        <td>${userAccessLog.employee.position}</td>
	                        <td>${userAccessLog.description}</td>
	                        <td>${userAccessLog.ipAddress}</td>
	                        <td><fmt:formatDate value = "${userAccessLog.dateOccured}" type = "date" dateStyle = "LONG" /></td>
	                        <td><fmt:formatDate value = "${userAccessLog.timeOccured}" type = "time" timeStyle = "MEDIUM" /></td>
	                    </tr>
                    </c:forEach>
                </tbody>
            </table>

            </div>
        </div>
        

    </div>

</div>
</section>   
          