<!DOCTYPE HTML>  
<html>
<head>
<style>
.error {color: #FF0000;}
</style>
</head>
<body>

<?php
// define variables and set to empty values
$yearofgamesErr = $cityofgamesErr = $commencedateErr = $enddateErr = $comnameErr= $medalErr= $recordErr= "";

$yearofgames = $cityofgames = $commencedate = $enddate = $comname = $medal = $record = "";

$com_r_1 = $country_r_1=  "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
	if (empty($_POST["YearOfGames"])) {
		$yearofgamesErr = "4 digit number is required";
	} else {
		$yearofgames = test_input($_POST["YearOfGames"]);
		//check if input is correct or not
		if (strlen($yearofgames) != 4) {
			$yearofgamesErr = "Only 4 digit number allowed";
		}
	}
	
    if (empty($_POST["CityOfGames"])) {
	    $cityofgamesErr = "Name of city is required";
    } else {
	    $cityofgames = test_input($_POST["CityOfGames"]);
	//check if the name of city is incorrect
	    if (!preg_match("/^[a-zA-Z ]*$/", $cityofgames)) {
		$cityofgamesErr = "Only letters and White space allowed";
		}
    }
	
	if (empty($_POST["CommenceDate"])) {
		$commencedateErr ="Invalid Date";
	} else {
		$commencedate = test_input($_POST["CommenceDate"]);
		
		if (!preg_match("^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)^", $commencedate)) {
			$commencedateErr ="Input valid date";
		}
	}
	
	if (empty($_POST["EndDate"])) {
		$enddateErr ="Invalid Date";
	} else {
		$enddate = test_input($_POST["EndDate"]);
	}
	
	if (empty($_POST["CompetitorName"])) {
	    $comnameErr = "Valid name is required";
    } else {
	    $comname = test_input($_POST["CompetitorName"]);
	//check if the name is Incorrect
	     if (!preg_match("/^[a-zA-Z ]*$/", $comname) ) {
			 $comnameErr ="No blank, no number and min 5";
		 }
        }
		
	if (empty($_POST["Medal"])) {
		$medalErr = "Invalid input";
	} else {
		$medal = test_input($_POST["Medal"]);
	
	}
	
	if (empty($_POST["WorldRecord"])) {
		$recordErr = "record is required";
	}else {
		$record = test_input($_POST["WorldRecord"]);
	}
	
	$com_r_1 = test_input($_POST["CompName_R_1"]);
   
   $country_r_1 = test_input ($_POST["CountryList_R_1"]);
	
}


  
  //$cityofgames = test_input($_POST["CityOfGames"]);
  //$commencedate = test_input($_POST["CommenceDate"]);
 // $enddate = test_input($_POST["EndDate"]);

function test_input($data) {
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
 
}
//include('PHPOlympicForm.php');


?>

<p><span class="error">* required field</span></p>
<form method="post" action="OL_Processor.php">
  YearOfGames: <input type="text" name="YearOfGames" value=" <?php echo $yearofgames; ?>">
  <span class="error">*<?php echo $yearofgamesErr; ?></span>
  <br><br>
  CityOfGames: <input type="text" name="CityOfGames">
  <span class="error">*<?php echo $cityofgamesErr; ?></span>
  <br><br>
  CommenceDate: <input type="text" name="CommenceDate" value=" <?php echo $commencedate; ?>">
  <span class="error"><?php echo $commencedateErr; ?></span>
  <br><br>
  EndDate: <input type="text" name="EndDate">
  <span class="error">*<?php echo $enddateErr; ?></span>
  CompititorName: <input type="text" name="CompetitorName">
  <span class="error">*<?php echo $comnameErr; ?></span>
  Medal: <input type="text" name="Medal">
  <span class="error">*<?php echo $medalErr; ?></span>
  WorldRecord: <input type="text" name="WorldRecord">
  <span class="error">*<?php echo $recordErr; ?></span>


<h1><?php
echo "<h2>Your Input:</h2>";
//echo $yearofgames;
echo "<br>";
echo $cityofgames;
echo "<br>";
//echo $commencedate;
echo "<br>";
echo $enddate;
echo "<br>";
echo $comname;
echo "<br>";
echo $medal;
echo "<br>";
echo $record;
echo "<br>";
echo $com_r_1 ;
echo "<br>";
echo $country_r_1 ;
echo "<br>";
?></h1>
</body>
</html>
