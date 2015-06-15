<?php
/**
 * Created by PhpStorm.
 * User: nktakumi
 * Date: 13/06/15
 * Time: 12:19
 */

namespace Logtime\Contracts\View;


interface SelectOptionInterface {
    public static function generate($array, $rowName, $prefix = '');
}