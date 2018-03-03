<%@ include file = "../../lib/tags/tag-libraries.jsp" %>

<header class="page-header pb-3">
    <div class="container-fluid">

        <div class = "row">
        <div class = "col-lg">
            <span class="h3 no-margin-bottom mr-2">System Settings</span>
        </div>
        </div>

    </div>
    </header>

    <section class = "no-padding-top p-0">
        
        <div class = "row">
            <div class = "col-lg">
            <div class = "card mb-0">
            	<c:if test="${not empty systemSettings }">
                	
	                <div class = "card-body ml-2">
	                <h3> Log out timeout </h3>
	                <hr />
	                <div class="form-inline">
	                    <label class="mr-sm-3" for="inlineFormCustomSelect">Log out Every: </label>
	                    <select class="custom-select mb-2 mr-sm-2 mb-sm-0" id="inlineFormCustomSelect" style = "width: 200px;">
	                    	<option selected disabled value="">${logoutTime} minutes</option>
		                    <option value="3">3 minutes</option>
		                    <option value="5">5 minutes</option>
		                    <option value="10">10 minutes</option>
		                    <option value="30">30 minutes</option>
	                    </select>
	                </div>
	
	                <br />
	                <br />
	
	                <h3> System backup </h3>
	                <hr />
	                <div class="form-inline">
	                    <label class="mr-sm-3" for="inlineFormCustomSelect">Backup every: </label>
	                    <input type = "text" value = "${systemSettings[0]}:${systemSettings[1]} ${systemSettings[3]}" class = "form-control timepicker mr-2" 
	                            data-timepicki-tim="${systemSettings[0]}" data-timepicki-mini="${systemSettings[1]}" data-timepicki-meri="${systemSettings[3]}"  style = "width: 100px;" />
	                    
	                    <button type="button" class="btn btn-primary btn-sm mr-1">Backup data</button>
	                    <button type="button" class="btn btn-primary btn-sm">Restore data</button>
	
	                </div>
	
	                <br />
	                
	                <button type="button" class="btn btn-primary float-right">Apply changes</button>
	
	                </div>
               
               </c:if>
            </div>
            

        </div>

    </div>
   </section> 