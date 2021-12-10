<%@ page pageEncoding="UTF-8"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
 			<a class="sidebar-brand d-flex align-items-center justify-content-center" href="/server">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-bus-alt"></i>
                </div>
                <div class="sidebar-brand-text mx-3">無事坐Bus</div>
            </a>
            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item">
                <a class="nav-link" href="index.html">
                    <i class="fas fa-solid fa-address-card"></i>
                    <span>個人資料</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                工作項目
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-bus"></i>
                    <span>車次路線管理</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">車次路線管理:</h6>
                        <a class="collapse-item" href="http://localhost:8081/routes/routemain.controller">車次路線</a>
                        <a class="collapse-item" href="http://localhost:8081/busTimes/tempbustimemain.controller?tEx=9">申請案</a>
                    </div>
                </div>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="http://localhost:8081/memberOrderBackmain.controller">
                    <i class="fas fa-solid fa-clipboard-list"></i>
                    <span>訂單管理</span></a>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
           
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities2"
                    aria-expanded="true" aria-controls="collapseUtilities2">
                    <i class="fas fa-bullhorn"></i>
                    <span>公告管理</span>
                </a>
                <div id="collapseUtilities2" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Custom Utilities:</h6>
                        <a class="collapse-item" href="/saveAnnouncement">新增公告</a>
                        <a class="collapse-item" href="/showAnnouncement1">編輯公告</a>
                        <a class="collapse-item" href="/savelostandfound">新增遺失物</a>
                        <a class="collapse-item" href="/showlostandfound2">編輯遺失物</a>
                    
                    </div>
                </div>
            </li>
             <li class="nav-item">
                <a class="nav-link" href="/tourfindall">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>套票管理</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                其他項目
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>請假申請</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Login Screens:</h6>
                        <a class="collapse-item" href="login.html">Login</a>
                        <a class="collapse-item" href="register.html">Register</a>
                        <a class="collapse-item" href="forgot-password.html">Forgot Password</a>
                        <div class="collapse-divider"></div>
                        <h6 class="collapse-header">Other Pages:</h6>
                        <a class="collapse-item" href="404.html">404 Page</a>
                        <a class="collapse-item" href="blank.html">Blank Page</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Charts -->
            <li class="nav-item active">
                <a class="nav-link" href="charts.html">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>訂單統計</span></a>
            </li>

            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="/membersmain.controller">
                    <i class="fas fa-light fa-address-book"></i>
                    <span>會員管理</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>
        <!-- End of Sidebar -->