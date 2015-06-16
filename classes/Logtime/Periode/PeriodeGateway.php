<?php
/**
 * Created by PhpStorm.
 * User: nktakumi
 * Date: 14/06/15
 * Time: 14:22
 */

namespace Logtime\Periode;


use Logtime\Contracts\Gateway\AbstractGateway;

class PeriodeGateway extends AbstractGateway {

    protected $tableName = 'periodes';

}