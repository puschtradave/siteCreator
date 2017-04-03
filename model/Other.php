<?php

/**
 * Created by PhpStorm.
 * User: OEM
 * Date: 07.12.2016
 * Time: 14:43
 *
 *
 */

require_once('dompdf/autoload.inc.php');
use Dompdf\Dompdf;


class Other extends Controller
{
    public function otherRequest()
    {
        switch ($_REQUEST["action"]) {
            case "downloadPDF":
                $this->downloadPDF($_REQUEST["data"]["html"]);
        }
    }

    public function downloadPDF($html)
    {

//        echo $html;
//        echo $this->getData("test.php");

//        $data = $this->getData("test.php");
//        echo $data;



        $dompdf = new Dompdf();
        $htmlEnd = "";
        $htmlEnd .= "<link href=\"style/css/bootstrap.min.css\" rel=\"stylesheet\" media=\"all\">";
        $htmlEnd .= "<link href=\"style/css/material.css\" rel=\"stylesheet\" media=\"all\">";
//
////        $htmlEnd .= "<link href=\"style/mapOfAll.css\" rel=\"stylesheet\" media=\"all\">";
//        $htmlEnd .= "<link href=\"style/less/design.css\" rel=\"stylesheet\" media=\"all\">";
//        $htmlEnd .= "<link href=\"style/less/elements.css\" rel=\"stylesheet\" media=\"all\">";
//        $htmlEnd .= "<link href=\"style/less/designIterations.css\" rel=\"stylesheet\" media=\"all\">";
        $htmlEnd .= "<link href=\"style/pdf/sheet.css\" rel=\"stylesheet\" media=\"all\">";
        $htmlEnd .= $html;

        $dompdf->loadHTML($htmlEnd);

        $dompdf->setPaper("A4");
//        $dompdf->setBasePath('localhost/exampls/style.css');
//        $dompdf->setBasePath('localhost/style/css/bootstrap.min.css');
//        $dompdf->setBasePath('localhost/style/css/animate.css');
//        $dompdf->setBasePath('localhost/style/css/material.css');
//        $dompdf->setBasePath('style/mapOfAll.css');
        $dompdf->render();

//        echo $dompdf->output();
//
////        $output = $dompdf->output();
//        $dompdf->stream("test", array("Attachment"=>"false"));

//        file_put_contents('test1.php', $output2);

        $file_to_save = 'file1.pdf';
//save the pdf file on the server
        file_put_contents($file_to_save, $dompdf->output());
//print the pdf file to the screen for saving
        header('Content-type: application/pdf');
        header('Content-Disposition: inline; filename="file12.pdf"');
        header('Content-Transfer-Encoding: binary');
        header('Content-Length: ' . filesize($file_to_save));
        header('Accept-Ranges: bytes');
        readfile($file_to_save);





//        $dompdf->stream("test", array("Attachment"=>0));

//        $file_to_save = 'test1.php';
////save the pdf file on the server
//        file_put_contents($file_to_save, $dompdf->output());
////print the pdf file to the screen for saving
//        header('Content-type: application/pdf');
//        header('Content-Disposition: inline; filename="test.pdf"');
//        header('Content-Transfer-Encoding: binary');
//        header('Content-Length: ' . filesize($file_to_save));
//        header('Accept-Ranges: bytes');
//        readfile($file_to_save);



//        require_once('mpdf/mpdf.php');
//
//
//        $mpdf = new mPDF("c", "A4");
//        $mpdf->writeHTML($html);
//        $mpdf->Output("report.pdf", "I");
    }


}