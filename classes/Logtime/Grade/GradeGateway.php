<?php
/**
 * Created by PhpStorm.
 * User: nktakumi
 * Date: 13/06/15
 * Time: 10:44
 */

namespace Logtime\Grade;
use Logtime\Contracts\Gateway\AbstractGateway;

class GradeGateway extends AbstractGateway {
    protected $tableName = 'grade';

}