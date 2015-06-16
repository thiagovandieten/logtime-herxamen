<?php
/**
 * Created by PhpStorm.
 * User: nktakumi
 * Date: 14/06/15
 * Time: 15:55
 */

namespace Logtime\ProjectGroup;


use Logtime\Contracts\Gateway\AbstractGateway;

class ProjectGroupGateway extends AbstractGateway {
    protected $tableName = 'projectgroup';
}