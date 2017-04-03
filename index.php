<?php
require "Controller.php";

setlocale(LC_TIME, 'de_DE', 'deu_deu');
$today = utf8_encode(strftime("%d. %m. %Y"));
?>

<!Doctype HTML>
<html lang="de">

<head>
    <title>Invoice</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=10; IE=9; IE=8; IE=7; IE=EDGE"/>


    <!--        JS-->
    <script src="js/plugin/jquery.js"></script>
    <script src="js/plugin/jquery-ui.js"></script>
    <script src="js/plugin/bootstrap.js"></script>
    <!--    STYLE-->
    <link href="style/css/bootstrap.min.css" rel="stylesheet">
    <link href="style/css/animate.css" rel="stylesheet">
    <link href="style/css/material.css" rel="stylesheet">


    <!--    SELF SELF SELF SELF SELF SELF SELF SELF SELF SELF SELF SELF SELF SELF SELF SELF SELF SELF-->
    <!-- JS -->
    <script> App = {};</script>

    <script src="js/behaviour.js"></script>
    <script src="js/functions.js"></script>


    <!--    STYLE-->
    <link href="style/mapOfAll.css" rel="stylesheet">


</head>


<body class="myFont-Aargh">

<div id="creator" class="height-200 width-1300 fixed bg-grey-800 bottom right font-weight-600">
    <div id="crTags" class="width-50 absolute height bg-blue-grey-400">
        <div class="height-35 width m-b-2">
            <div class="relative filler bg-grey-500 text-center line-height-35 hover">
                DIV
            </div>
        </div>
        <div class="height-35 width m-b-2">
            <div class="relative filler bg-grey-500 text-center line-height-35 hover">
                DIV
            </div>
        </div>
        <div class="height-35 width m-b-2">
            <div class="relative filler bg-grey-500 text-center line-height-35 hover">
                DIV
            </div>
        </div>
    </div>
    <div id="crBoxes" class="width-120 absolute height bg-blue-grey-400 no-overflow">
        <div class="filler relative">
            <div id="crBoxUp" class="absolute width shadow-inset-sm-t text-center z-md hover"><i
                    class="fa fa-arrow-up"></i></div>
            <div id="crBoxScroller" class="absolute filler">
                <?php
                $boxes = ["AJAX", "MODALS", "OPENERS", "IMAGE", "ANIMATE", "TEST", "IMAGE", "ANIMATE"];
                foreach ($boxes as $box) {
                    ?>
                    <div class="height-35 width m-b-2">
                        <div class="crBox relative filler bg-grey-500 text-center line-height-35 hover">
                            <?= $box ?>
                        </div>
                    </div>
                    <?php
                }
                ?>
            </div>
            <div id="crBoxDown" class="absolute bottom width shadow-inset-sm-b text-center z-md hover"><i
                    class="fa fa-arrow-down"></i></div>
        </div>
    </div>
    <div id="crOvalBox" class="absolute height width-400 right">
        <div id="crOval" class="absolute right-75 top-35 no-overflow">
            <div id="crOvalLeftContainer" class="absolute">

            </div>
            <div id="crCenterTopLeftTriang" class="absolute crOvalButton hover">

            </div>
            <div id="crCenterTopRightTriang" class="absolute crOvalButton hover">

            </div>
            <div id="crCenterBottomLeftTriang" class="absolute crOvalButton hover">

            </div>
            <div id="crCenterBottomRightTriang" class="absolute crOvalButton hover">

            </div>
            <div id="crCenterLeftTopTriang" class="absolute crOvalButton hover">

            </div>
            <div id="crCenterLeftBottomTriang" class="absolute crOvalButton hover">

            </div>
            <div id="crCenterRightTopTriang" class="absolute crOvalButton hover">

            </div>
            <div id="crCenterRightBottomTriang" class="absolute crOvalButton hover">

            </div>
            <div id="crOvalRightContainer" class="absolute">
                <div class="filler relative">
                    <div id="crOvalRightLeftUpper" class="absolute crOvalButton hover">

                    </div>
                    <div id="crOvalRightTopLeft" class="absolute crOvalButton hover">

                    </div>
                    <div id="crOvalRightTopRight" class="absolute crOvalButton hover">

                    </div>
                    <div id="crOvalRightRightUpper" class="absolute crOvalButton hover">

                    </div>
                    <div id="crOvalRightRightLower" class="absolute crOvalButton hover">

                    </div>
                    <div id="crOvalRightBottomRight" class="absolute crOvalButton hover">

                    </div>
                    <div id="crOvalRightBottomLeft" class="absolute crOvalButton hover">

                    </div>
                    <div id="crOvalRightLeftLower" class="absolute crOvalButton hover">

                    </div>
                </div>
            </div>

        </div>
    </div>

</div>


</body>
