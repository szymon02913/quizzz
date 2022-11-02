<html lang="en">
<head>
    <title>Wynik quizu</title>
</head>
<body>
    <?php
        $suma=0;
        foreach($_POST as $key=>$value)
        { 
            $suma=$suma+$value;
        }
        echo "zdobyte punkty=$suma"
    ?>
</body>
</html>