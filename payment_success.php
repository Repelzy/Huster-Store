<?php
<<<<<<< HEAD
session_start();
if (!isset($_SESSION["uid"])) {
    header("location:index.php");
}

include_once("db.php");

if (isset($_GET["order_id"])) {
    $order_id = $_GET["order_id"];
    $sql = "SELECT * FROM orders_info WHERE order_id = '$order_id'";
    $query = mysqli_query($con, $sql);

    // Debugging: Check if the query returns any rows
    if (mysqli_num_rows($query) > 0) {
        $order = mysqli_fetch_array($query);
        $user_id = $order['user_id'];
        $trx_id = $order['trx_id']; 
        $p_st = "Completed"; 
        $amt = $order['total_amt'];
        $cm_user_id = $user_id;
        $c_amt = $amt;

        
        $update_sql = "UPDATE orders_info SET p_status = '$p_st' WHERE order_id = '$order_id'";
        if (!mysqli_query($con, $update_sql)) {
            
            echo "Error updating p_status: " . mysqli_error($con);
        }

        $sql = "SELECT p_id, qty FROM cart WHERE user_id = '$cm_user_id'";
        $query = mysqli_query($con, $sql);
        if (mysqli_num_rows($query) > 0) {
            while ($row = mysqli_fetch_array($query)) {
                $product_id[] = $row["p_id"];
                $qty[] = $row["qty"];
            }

            for ($i = 0; $i < count($product_id); $i++) {
                $sql = "INSERT INTO order_products (order_id, product_id, qty, amt) VALUES ('$order_id', '" . $product_id[$i] . "', '" . $qty[$i] . "', '$c_amt')";
                mysqli_query($con, $sql);
            }

            $sql = "DELETE FROM cart WHERE user_id = '$cm_user_id'";
            mysqli_query($con, $sql);
        }
    } else {
        
        echo "No order found with order_id: $order_id";
    }
} else {
    
    echo "No order_id set in the GET request";
}
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Huster Store</title>
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <script src="js/jquery2.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="main.js"></script>
    <style>
        table tr td {padding:10px;}
    </style>
</head>
<body>
    <div class="navbar navbar-inverse navbar-fixed-top">
        <div class="container-fluid">    
            <div class="navbar-header">
                <a href="#" class="navbar-brand">Huster Store</a>
            </div>
            <ul class="nav navbar-nav">
                <li><a href="index.php"><span class="glyphicon glyphicon-home"></span>Home</a></li>
            </ul>
        </div>
    </div>
    <p><br/></p>
    <p><br/></p>
    <p><br/></p>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <div class="panel panel-default">
                    <div class="panel-heading"></div>
                    <div class="panel-body">
                        <h1>Thank you</h1>
                        <hr/>
                        <p>Hello <?php echo "<b>" . $_SESSION["name"] . "</b>"; ?>, Your payment process is successfully completed and your Transaction ID is <b><?php echo $trx_id; ?></b><br/>
                        You can continue your shopping.<br/></p>
                        <a href="index.php" class="btn btn-success btn-lg">Continue Shopping</a>
                    </div>
                    <div class="panel-footer"></div>
                </div>
            </div>
            <div class="col-md-2"></div>
        </div>
    </div>
</body>
</html>
=======

session_start();
if(!isset($_SESSION["uid"])){
	header("location:index.php");
}

if (isset($_GET["st"])) {

	# code...
	$trx_id = $_GET["tx"];
		$p_st = $_GET["st"];
		$amt = $_GET["amt"];
		$cc = $_GET["cc"];
		$cm_user_id = $_GET["cm"];
		$c_amt = $_COOKIE["ta"];
	if ($p_st == "Completed") {

		

		include_once("db.php");
		$sql = "SELECT p_id,qty FROM cart WHERE user_id = '$cm_user_id'";
		$query = mysqli_query($con,$sql);
		if (mysqli_num_rows($query) > 0) {
			# code...
			while ($row=mysqli_fetch_array($query)) {
			$product_id[] = $row["p_id"];
			$qty[] = $row["qty"];
			}

			for ($i=0; $i < count($product_id); $i++) { 
				$sql = "INSERT INTO orders (user_id,product_id,qty,trx_id,p_status) VALUES ('$cm_user_id','".$product_id[$i]."','".$qty[$i]."','$trx_id','$p_st')";
				mysqli_query($con,$sql);
			}

			$sql = "DELETE FROM cart WHERE user_id = '$cm_user_id'";
			if (mysqli_query($con,$sql)) {
				?>
					<!DOCTYPE html>
					<html>
						<head>
							<meta charset="UTF-8">
							<title>Huster Store</title>
							<link rel="stylesheet" href="css/bootstrap.min.css"/>
							<script src="js/jquery2.js"></script>
							<script src="js/bootstrap.min.js"></script>
							<script src="main.js"></script>
							<style>
								table tr td {padding:10px;}
							</style>
						</head>
					<body>
						<div class="navbar navbar-inverse navbar-fixed-top">
							<div class="container-fluid">	
								<div class="navbar-header">
									<a href="#" class="navbar-brand">Huster Store</a>
								</div>
								<ul class="nav navbar-nav">
									<li><a href="index.php"><span class="glyphicon glyphicon-home"></span>Home</a></li>
									
								</ul>
							</div>
						</div>
						<p><br/></p>
						<p><br/></p>
						<p><br/></p>
						<div class="container-fluid">
						
							<div class="row">
								<div class="col-md-2"></div>
								<div class="col-md-8">
									<div class="panel panel-default">
										<div class="panel-heading"></div>
										<div class="panel-body">
											<h1>Thank you </h1>
											<hr/>
											<p>Hello <?php echo "<b>".$_SESSION["name"]."</b>"; ?>,Your payment process is 
											successfully completed and your Transaction id is <b><?php echo $trx_id; ?></b><br/>
											you can continue your Shopping <br/></p>
											<a href="index.php" class="btn btn-success btn-lg">Continue Shopping</a>
										</div>
										<div class="panel-footer"></div>
									</div>
								</div>
								<div class="col-md-2"></div>
							</div>
						</div>
					</body>
					</html>

				<?php
			}
		}else{
			header("location:index.php");
		}
		
	}
}



?>

















































>>>>>>> c770efb3c9fe1cadd440c0a939d699cd31ecf3b9
