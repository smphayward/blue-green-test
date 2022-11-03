<?php

  $jsonContents = file_get_contents("http://nginx/info.php");

  echo "Received from east/west call:<br>";
  echo $jsonContents;

?>