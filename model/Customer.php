<?php

/**
 * Created by PhpStorm.
 * User: OEM
 * Date: 07.12.2016
 * Time: 14:43
 */
class Customer extends Controller
{
    public function custRequest()
    {
        switch ($_REQUEST["action"]) {
//            case "tableJson":
//                $this->getDomainsJsonForSheetTable($_REQUEST["data"]["id"]);
        }
    }

    public function getCustomersWithDomains()
    {
        $customers = $this->getAll("customers", "cust_name");
        $domains = $this->getAll("domains", "duedate");

        $customers = $this->connectCustomerAndDomain($customers, $domains);

        return $customers;
    }

    public function connectCustomerAndDomain($customers, $domains){
        foreach ($customers as $custKey => $customer) {
            $customers[$custKey]["domains"] = [];
            foreach ($domains as $domain) {
                if ($domain["cid"] == $customers[$custKey]["id"])
                    array_push($customers[$custKey]["domains"], $domain);
            }
        }
        return $customers;
    }

    public function getOneCustomerWithDomains($id){
        $customer = $this->getByOne("customers", "id", $id, "nosort", "noshorten");
        $domains = $this->getByOne("domains", "cid", $id, "duedate", "noshorten");
        return $this->connectCustomerAndDomain($customer, $domains);
    }

//    public function getDomainsJsonForSheetTable($id){
//        $thisYear = date_format(date_create(), "Y");
//        $domains = $this->getByOne("domains", "cid", $id, "duedate", "noshorten");
////        var_dump($domains);
//        $tbody = [];
//        setlocale(LC_TIME, "C");
//        echo strftime("%A");
//        setlocale(LC_TIME, "fi_FI");
//        echo strftime(" in Finnish is %A,");
//        setlocale(LC_TIME, "fr_FR");
//        echo strftime(" in French %A and");
//        setlocale(LC_TIME, "de_DE");
//        echo strftime(" in German %A.\n");
////        foreach ($domains as $domain) {
////            $trow = [];
////            setlocale(LC_ALL, 'de_DE');
////            setlocale(LC_TIME, 'de_DE', 'deu_deu');
////            $titleMonth = date_format(date_create($domain["duedate"]), "F");
////            array_push($trow, "Domain");
////            array_push($trow, "Domain \"".$domain['domain_name']."\"<br> im Zeitraum von ".$titleMonth." ".($thisYear - 1)." bis ". $thisYear);
////            array_push($trow, "{{eintragen}} €");
////            array_push($trow, "{{eintragen}} Summe €");
////            array_push($tbody, $trow);
////        }
//
////        echo json_encode($tbody);
//    }

}