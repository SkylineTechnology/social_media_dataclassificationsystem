<?php
session_start();
include 'includes/connection.php';
include 'includes/functions.php';
include 'phpInsight-master/autoload.php';


$role = isset($_SESSION["urole"]) ? $_SESSION["urole"] : "";
$userid = isset($_SESSION["userid"]) ? $_SESSION["userid"] : "";
$deptid = isset($_SESSION["dept_id"]) ? $_SESSION["dept_id"] : "";

if (!$_SESSION) {
    header("location:login");
}
?>

﻿<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" type="image/png" href="favicon.png" sizes="16x16">

        <title><?php echo $sitename; ?></title>

        <!-- Vendors Style-->
        <link rel="stylesheet" href="css/vendors_css.css">

        <!-- Style-->  
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/skin_color.css">

    </head>

    <body class="hold-transition light-skin sidebar-mini theme-primary">

        <div class="wrapper">

            <?php
            include 'includes/header.php';
            ?>

            <!-- Left side column. contains the logo and sidebar -->
            <?php
            include 'includes/sidebar.php';
            ?>

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <div class="container-full">
                    <!-- Content Header (Page header) -->	  
                    <div class="content-header">
                        <div class="d-flex align-items-center">
                            <div class="mr-auto">
                                <h3 class="page-title">Chat Menu</h3>
                                <div class="d-inline-block align-items-center">
                                    <nav>
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="#"><i class="mdi mdi-home-outline"></i></a></li>
                                            <li class="breadcrumb-item" aria-current="page">Chat Menu</li>
                                            <li class="breadcrumb-item active" aria-current="page">Chat app</li>
                                        </ol>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>  

                    <!-- Main content -->
                    <section class="content">
                        <div class="row">
                            <div class="col-lg-3 col-12">
                                <div class="box">
                                    <form action="" method="post">
                                        <div class="box-header with-border p-0">
                                            <div class="form-element lookup">
                                                <input name="search_value" class="form-control p-20 w-p100" type="text" placeholder="Find Department Members">
                                            </div>
                                        </div>
                                    </form>
                                    <div class="box-body p-0">
                                        <div id="chat-contact" class="media-list media-list-hover media-list-divided ">
                                            <?php
                                            $get_dept_members = mysqli_query($conn, "select * from members");
                                            while ($row = mysqli_fetch_array($get_dept_members)) {
                                                $member_id = $row["memberid"];
                                                $fullname = $row["fullname"];
                                                $email = $row["email"];
                                                $gender = $row["gender"];
                                               
                                                $reg_date = date_format(date_create($row["reg_date"]), "d, M Y H:i");
                                                if ($email == $userid) {
                                                    continue;
                                                }
                                                ?>
                                                <div class="media media-single">
                                                    <a href="chatting?chat='<?php echo base64_encode($email) ?>'" class="avatar avatar-lg status-success">
                                                        <img src="../images/icon2.jpg" alt="...">
                                                    </a>

                                                    <div class="media-body">
                                                        <h6><a href="#='<?php echo base64_encode($email) ?>'"><?php echo $fullname; ?></a></h6>
                                                        <small class="text-green">Online</small>
                                                    </div>
                                                </div>   
                                                <?php
                                            }
                                            ?>


                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-9 col-12">
                                <div class="box direct-chat">
                                    <div class="box-header with-border">
                                        <h4 class="box-title">Chat Department Members</h4>
                                    </div>
                                    <!-- /.box-header -->
                                    <div class="box-body">
                                        <!-- Conversations are loaded here -->
                                        <div class="mailbox-messages">
                                            <div class="table-responsive">
                                                <table class="table no-border">
                                                    <tbody>
                                                        <?php
                                                        $get_dept_members = mysqli_query($conn, "select * from members");
                                                        while ($row = mysqli_fetch_array($get_dept_members)) {
                                                            $member_id = $row["memberid"];
                                                            $fullname = $row["fullname"];
                                                            $email = $row["email"];
                                                            $nationality = $row['nationality'];
                                                            $gender = $row["gender"];
                                                            
                                                            
                                                            $reg_date = date_format(date_create($row["reg_date"]), "d, M Y H:i");
                                                            if ($email == $userid) {
                                                                continue;
                                                            }
                                                            
                                                            ?>
                                                            <tr>
                                                                <td class="w-80"><a href="chatting?chat=<?php echo base64_encode($email) ?>"><img class="avatar" src="../images/icon2.jpg" alt="..."></a></td>
                                                                <td class="mailbox-name"><a href="chatting?chat=<?php echo base64_encode($email) ?>"><?php echo $fullname; ?></a></td>
                                                                <td class="mailbox-date"><?php echo $nationality; ?></td>
                                                            </tr>      
                                                            <?php
                                                        }
                                                        ?>
                                                    </tbody>
                                                </table>
                                                <!--/.direct-chat-messages-->
                                            </div>
                                            <!-- /.box-body -->

                                            <!-- /.box-footer-->
                                        </div>
                                    </div>								
                                </div>
                                </section>
                                <!-- /.content -->
                            </div>
                        </div>
                        <!-- /.content-wrapper -->
                        <?php
                        include 'includes/footer.php';
                        ?>
                        <!-- Control Sidebar -->

                        <!-- /.control-sidebar -->

                        <!-- Add the sidebar's background. This div must be placed immediately after the control sidebar -->
                        <div class="control-sidebar-bg"></div>

                </div>
                <!-- ./wrapper -->


                <!-- Vendor JS -->
                <script src="js/vendors.min.js"></script>

                <script src="../assets/vendor_components/apexcharts-bundle/irregular-data-series.js"></script>
                <script src="../assets/vendor_components/apexcharts-bundle/dist/apexcharts.js"></script>
                <script src="../assets/vendor_components/echarts/dist/echarts-en.min.js"></script>

                <!-- Famosa Admin App -->
                <script src="js/template.js"></script>
                <script src="js/pages/dashboard.js"></script>


                </body>

                <!-- Mirrored from html.psdtohtmlexpert.com/admin/famosa-admin/main/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 23 Dec 2020 08:41:47 GMT -->
                </html>
