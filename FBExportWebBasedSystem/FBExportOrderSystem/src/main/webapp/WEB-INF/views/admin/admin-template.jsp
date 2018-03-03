<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file = "../../lib/tags/tag-libraries.jsp" %>

<tiles:importAttribute name = "cssfiles" />
<tiles:importAttribute name = "javascriptfiles"/>
<tiles:importAttribute name = "sideBarActiveLink" />

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <title>Fong Bros</title>
	    <meta name="description" content="">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <link rel="short icon" href="/FBExportSystem/resources/admin/company_logo_icon.ico"/>

	    <meta name="robots" content="all,follow">
	    <meta name="_csrf" content="${_csrf.token}"/>
		<meta name="_csrf_header" content="${_csrf.headerName}"/>
	    
	    
		
		<c:forEach var = "cssfile" items = "${cssfiles}">
			<link href = "<c:url value ='${cssfile}' />" rel = "stylesheet" type = "text/css" />
		</c:forEach>
		
		<script src="<c:url value = '/resources/admin/fine-uploader/fine-uploader.min.js' />"></script>
   		  <script type="text/template" id="qq-template-manual-trigger">
        <div class="qq-uploader-selector qq-uploader" qq-drop-area-text="Drop files here">
            <div class="qq-total-progress-bar-container-selector qq-total-progress-bar-container">
                <div role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" class="qq-total-progress-bar-selector qq-progress-bar qq-total-progress-bar"></div>
            </div>
            <div class="qq-upload-drop-area-selector qq-upload-drop-area" qq-hide-dropzone>
                <span class="qq-upload-drop-area-text-selector"></span>
            </div>
            <div class="buttons">
                <div class="qq-upload-button-selector qq-upload-button" style = "width: 200px !important;">
                    <div>Select files</div>
                </div>
                <button type="button" id="trigger-upload" class="btn btn-primary ml-2">
                    <i class="icon-upload icon-white"></i> Upload
                </button>
            </div>
            <span class="qq-drop-processing-selector qq-drop-processing">
                <span>Processing dropped files...</span>
                <span class="qq-drop-processing-spinner-selector qq-drop-processing-spinner"></span>
            </span>
            <ul class="qq-upload-list-selector qq-upload-list" aria-live="polite" aria-relevant="additions removals">
                <li>
                    <div class="qq-progress-bar-container-selector">
                        <div role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" class="qq-progress-bar-selector qq-progress-bar"></div>
                    </div>
                    <span class="qq-upload-spinner-selector qq-upload-spinner"></span>
                    <img class="qq-thumbnail-selector" qq-max-size="100" qq-server-scale>
                    <span class="qq-upload-file-selector qq-upload-file"></span>
                    <span class="qq-edit-filename-icon-selector qq-edit-filename-icon" aria-label="Edit filename"></span>
                    <input class="qq-edit-filename-selector qq-edit-filename" tabindex="0" type="text">
                    <span class="qq-upload-size-selector qq-upload-size"></span>
                    <button type="button" class="qq-btn qq-upload-cancel-selector qq-upload-cancel">Cancel</button>
                    <button type="button" class="qq-btn qq-upload-retry-selector qq-upload-retry">Retry</button>
                    <button type="button" class="qq-btn qq-upload-delete-selector qq-upload-delete">Delete</button>
                    <span role="status" class="qq-upload-status-text-selector qq-upload-status-text"></span>
                </li>
            </ul>

            <dialog class="qq-alert-dialog-selector">
                <div class="qq-dialog-message-selector"></div>
                <div class="qq-dialog-buttons">
                    <button type="button" class="qq-cancel-button-selector">Close</button>
                </div>
            </dialog>

            <dialog class="qq-confirm-dialog-selector">
                <div class="qq-dialog-message-selector"></div>
                <div class="qq-dialog-buttons">
                    <button type="button" class="qq-cancel-button-selector">No</button>
                    <button type="button" class="qq-ok-button-selector">Yes</button>
                </div>
            </dialog>

            <dialog class="qq-prompt-dialog-selector">
                <div class="qq-dialog-message-selector"></div>
                <input type="text">
                <div class="qq-dialog-buttons">
                    <button type="button" class="qq-cancel-button-selector">Cancel</button>
                    <button type="button" class="qq-ok-button-selector">Ok</button>
                </div>
            </dialog>
        </div>
    </script>

    <style>
        #trigger-upload {
            color: white;
            background-color: #00ABC7;
            font-size: 14px;
            padding: 7px 20px;
            background-image: none;
        }

        #fine-uploader-manual-trigger .qq-upload-button {
            margin-right: 15px;
        }

        #fine-uploader-manual-trigger .buttons {
            width: 36%;
        }

        #fine-uploader-manual-trigger .qq-uploader .qq-total-progress-bar-container {
            width: 60%;
        }
    </style>
		
	</head>
	<body>
	
	
			
		<div class = "page">
			
			<tiles:insertAttribute name = "mainNavBar" />
				
			<div class = "page-content d-flex align-items-stretch">
			
				<nav class="side-navbar">

				    <div class="sidebar-header d-flex align-items-center">
				    <div class="avatar"><img src="https://scontent.fmnl4-3.fna.fbcdn.net/v/t1.0-1/c0.5.50.50/p50x50/20953362_1445195212229457_4994570052770081516_n.jpg?oh=1c7e4503215039586035544520617a1c&oe=5B4CB683" alt="..." class="img-fluid rounded-circle" /></div>
				    <div class="title">
				        <h1 class="h4">${sessionScope.employeeName}</h1>
				        <p>${sessionScope.position}</p>
				    </div>
				    </div>
				    <span class="heading text-muted">
				        <span class = "mr-2"> Main menu </span>
				        <i class="fa fa-bars" aria-hidden="true"></i>
				    </span>
				    <ul class="list-unstyled">
				       <li ${ (sideBarActiveLink eq "dashboard") ? "class = 'active'" : ''}><a href="<c:url value = '/admin/dashboard' />"> <i class="icon-presentation"></i>Dashboard </a></li>
				       <li ${ (sideBarActiveLink eq "inventory") ? "class = 'active'" : ''}><a href="<c:url value = '/admin/inventory' />"> <i class="icon-padnote"></i>Inventory </a></li>
				       <li ${ (sideBarActiveLink eq "orders") ? "class = 'active'" : ''}><a href="<c:url value = '/admin/orders' />"> <i class="fa fa-list-alt" aria-hidden="true"></i> Orders </a></li>
				       <li ${ (sideBarActiveLink eq "manage-accounts") ? "class = 'active'" : ''}><a href="<c:url value = '/admin/manage-accounts' />"> <i class="fa fa-users"></i> Manage Accounts </a></li>
				       <li ${ (sideBarActiveLink eq "report-logs") ? "class = 'active'" : ''}><a href="index.html"> <i class="fa fa-file-text" aria-hidden="true"></i> Report logs </a></li>
				       <li ${ (sideBarActiveLink eq "system-settings") ? "class = 'active'" : ''}><a href="index.html"> <i class="fa fa-cog" aria-hidden="true"></i> System Settings </a></li>
				    </ul>
				
				</nav>						

				<div class = "content-inner">
					<tiles:insertAttribute name = "main" />
					<tiles:insertAttribute name = "footer" />
				</div>
				
			</div>
			
		</div>
		
		<c:forEach var = "javascriptfile" items = "${javascriptfiles}">
			<script src = "<c:url value ='${javascriptfile}' />" type = "text/javascript"></script>
		</c:forEach> 
	
		<tiles:insertAttribute name = "templates" />
		
	</body>
</html>