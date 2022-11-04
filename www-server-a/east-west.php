<?php

  echo "I am: " . gethostname() . "<br>";

  $jsonContents = file_get_contents("http://nginx/info.php");
  $jsonDecoded = json_decode($jsonContents);
  $jsonPretty = json_encode($jsonDecoded, JSON_PRETTY_PRINT);

  echo '<div style="white-space: pre-wrap;">';
  echo "Received from east/west call:<br>";
  echo $jsonPretty;
  echo '</div>'

?>