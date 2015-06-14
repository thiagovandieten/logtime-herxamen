<?php
/**
 * Created by PhpStorm.
 * User: nktakumi
 * Date: 13/06/15
 * Time: 11:46
 */

namespace Logtime\View\Template;
use Logtime\Contracts\View\SelectOptionInterface;

class SelectOption implements SelectOptionInterface {
    /**
     * @param Array $array Array met DB resultaten via DB's resultset()
     * @param String $prefix
     * @param String $rowName DB kolom met de data die je wilt gebruiken
     * @return String $string
     */
    public static function generate($array, $rowName, $prefix = '')  {
        $string = "";
        $string .= "<select class=\"light-table-filter\" data-table=\"order-table\"> \n";
        if (!empty($prefix)) $string .= "\t <option>{$prefix}</option> \n";
        foreach ($array as $item) {
            $string .= "<option value=\"{$prefix} ".$item[$rowName]."\">{$prefix} "
                    .$item[$rowName]."</option> \n";
        }
        $string .= "</select> \n";
        return $string;
    }
}