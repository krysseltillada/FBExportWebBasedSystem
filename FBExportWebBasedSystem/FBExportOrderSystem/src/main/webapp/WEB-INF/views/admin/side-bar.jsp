

<nav class="side-navbar">
    <!-- Sidebar Header-->
    <div class="sidebar-header d-flex align-items-center">
    <div class="avatar"><img src="img/avatar-1.jpg" alt="..." class="img-fluid rounded-circle"></div>
    <div class="title">
        <h1 class="h4">Kryssel tillada</h1>
        <p>System Admin</p>
    </div>
    </div>
    <!-- Sidebar Navidation Menus-->
    <span class="heading text-muted">
        <span class = "mr-2"> Main menu </span>
        <i class="fa fa-bars" aria-hidden="true"></i>
    </span>
    <ul class="list-unstyled">
    <h1> tae ${sideBarActiveLink} </h1>
            <li ${ (sideBarActiveLink == "dashboard") ? "class = 'active'" : 'tae' }><a href="index.html"> <i class="icon-presentation"></i>Dashboard </a></li>
            <li><a href="index.html"> <i class="icon-padnote"></i>Inventory </a></li>
            <li><a href="index.html"> <i class="fa fa-list-alt" aria-hidden="true"></i> Orders </a></li>
            <li><a href="index.html"> <i class="fa fa-file-text" aria-hidden="true"></i> Report logs </a></li>
            <li><a href="index.html"> <i class="fa fa-cog" aria-hidden="true"></i> System Settings </a></li>
    </ul>

    <!-- <span class="heading">Extras</span>
    <ul class="list-unstyled">
    <li> <a href="#"> <i class="icon-flask"></i>Demo </a></li>
    <li> <a href="#"> <i class="icon-screen"></i>Demo </a></li>
    <li> <a href="#"> <i class="icon-mail"></i>Demo </a></li>
    <li> <a href="#"> <i class="icon-picture"></i>Demo </a></li>
    </ul> -->

</nav>