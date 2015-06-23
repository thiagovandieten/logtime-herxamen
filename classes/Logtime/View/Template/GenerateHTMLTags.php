<?php
/**
 * Created by PhpStorm.
 * User: nktakumi
 * Date: 13/06/15
 * Time: 11:46
 */

namespace Logtime\View\Template;

class GenerateHTMLTags  {
    /**
     * @param Array $array Array met DB resultaten via DB's resultset()
     * @param String $prefix
     * @param String $rowName DB kolom met de data die je wilt gebruiken
     * @return String $string
     */
    public static function selectOption($array, $rowName, $prefix = '')  {
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

    public static function checkbox($name, $value, $checked = false, $alt = '') {
        if($checked === true) $checkedOutput = 'checked';
        else $checkedOutput = '';
        if (empty($alt)) $alt = $value;
        return "<input type=\"checkbox\" name=\"{$name}\" value=\"{$value}\" $checkedOutput >{$alt}</input>  \n";

    }

    public static function errorWarningSuccess() {
        global $melding, $succes, $waarschuwing;
        if(isset($_SESSION['melding']) || isset($_SESSION['success']) || isset($_SESSION['waarschuwing'])) {
            $melding = $_SESSION['melding'];
            $succes = $_SESSION['succes'];
            $waarschuwing = $_SESSION['waarschuwing'];

            unset($_SESSION['melding']);
            unset($_SESSION['succes']);
            unset($_SESSION['waarschuwing']);
        }

        $string = '';
        if($melding != '') $string .= '<p class="goed">'.$melding.'</p>';
        if($waarschuwing != '') $string .= $waarschuwing;
        if(isset($succes)) $string .= $succes;

        return $string;
    }
}