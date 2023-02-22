<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>php-id-w10-title-edit</title>
        <!-- Bootstrap -->
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
        <link href="bootstrap/css/bootstrap-theme.css" rel="stylesheet" type="text/css">
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="bootstrap/js/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="bootstrap/js/bootstrap.min.js"></script>        
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="bootstrap/js/html5shiv.min.js"></script>
            <script src="bootstrap/js/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>        
        <div class="container">
            <div class="row"> 
                <div class="jumbotron" style="background-color: cornflowerblue;">
                    <?php include 'topbanner.php';?>
                </div>
            </div>
            <div class="row">
                <?php include 'menu.php';?>
            </div>
            <div class="row">
                <div class="col-sm-12 col-md-3 col-lg-3">
                    <p>Login Area</p>
                </div>  
                <div class="col-sm-12 col-md-9 col-lg-9">
                <h4>แก้ไขข้อมูลตำนำหน้าชื่อ</h4>    
                <?php
                        if(isset($_GET['submit'])){
                            $prj_id     = $_GET['prj_id'];
                            $prj_name_th = $_GET['prj_name_th'];
                            $prj_name_en = $_GET['prj_name_en'];
                            $prj_stt_id = $_GET['prj_stt_id'];
                            $prj_ptt_id = $_GET['prj_ptt_id'];
                            $prj_lct_id = $_GET['prj_lct_id'];
                            $tools = $_GET['tools'];
                            $student = $_GET['student'];
                            $sql1 = "update project set value";
                            $sql1 .= " ('null','$prj_name_th','$prj_name_en','$prj_stt_id','$prj_ptt_id','$prj_lct_id')";
                            echo $sql1."<br>";
                            include 'connectdb.php';
                            if(mysqli_query($conn,$sql1)){
                            $prj_id = mysqli_insert_id($conn);
                            foreach($tools as $tls){
                                $sql2 = "update project_tools set (pjt_prj_id,pjt_tls_id) value";
                                $sql2 .= "('$prj_id','$tls')";
                                mysqli_query($conn,$sql2);
                                echo $sql2."<br>";
                            }
                            foreach($student as $stds){
                                $sql3 = "update project_student set (pjs_prj_id,pjs_std_id) value";
                                $sql3 .= "('$prj_id','$stds')";
                                mysqli_query($conn,$sql2);
                                echo $sql3."<br>";
                            }
                            
                            echo "บันทึกโปรเจค $prj_name_th เรียบร้อย";

                            }else{
                            echo "บันทึกโปรเจค ผิดพลาด";
                            }
                            mysqli_close($conn);
                            
                    }else{
                        $fprj_id = $_REQUEST['prj_id'];
                        $sql =  "SELECT * FROM project_all where prj_id='$fprj_id'";
                        $result = mysqli_query($conn,$sql);
                        $row = mysqli_fetch_array($result, MYSQLI_ASSOC);
                        $fprj_name_th = $row['prj_name_th'];
                        mysqli_free_result($result);
                        mysqli_close($conn);      
                  
                ?>
                    <form class="form-horizontal" role="form" name="title_edit" action="<?php echo $_SERVER['PHP_SELF']?>">
                        <input type="hidden" name="ttl_id" id="ttl_id" value="<?php echo "$fttl_id";?>">
                        <div class="form-group">
                            <label for="ttl_name" class="col-md-2 col-lg-2 control-label">ชื่อเครื่องมือ</label>
                            <div class="col-md-10 col-lg-10">
                                <input type="text" name="ttl_name" id="ttl_name" class="form-control" value="<?php echo "$fttl_name";?>">
                            </div>    
                        </div>
                        <div class="form-group">
                            <div class="col-md-10 col-lg-10">
                                <input type="submit" name="submit" value="ตกลง" class="btn btn-default">
                            </div>    
                        </div>
                    </form>
                <?php
                    }
                ?>
                </div>    
            </div>
            <div class="row">
                <address>คณะวิทยาการคอมพิวเตอร์และเทคโนโลยีสารสนเทศ</address>
            </div>
        </div>    
    </body>
</html>