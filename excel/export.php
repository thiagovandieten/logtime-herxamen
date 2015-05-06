<?php
session_start();
/**
 * PHPExcel
 *
 * Copyright (C) 2006 - 2014 PHPExcel
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 * @category   PHPExcel
 * @package    PHPExcel
 * @copyright  Copyright (c) 2006 - 2014 PHPExcel (http://www.codeplex.com/PHPExcel)
 * @license    http://www.gnu.org/licenses/old-licenses/lgpl-2.1.txt	LGPL
 * @version    1.8.0, 2014-03-02
 */

/** Error reporting */
error_reporting(E_ALL);
ini_set('display_errors', TRUE);
ini_set('display_startup_errors', TRUE);
date_default_timezone_set('Europe/Amsterdam');

define('EOL',(PHP_SAPI == 'cli') ? PHP_EOL : '<br />');

/** Include PHPExcel */
require_once dirname(__FILE__) . '/../classes/PHPExcel.php';


// Create new PHPExcel object
echo date('H:i:s') , " Create new PHPExcel object" , EOL;
$objPHPExcel = new PHPExcel();

// Set document properties
echo date('H:i:s') , " Set document properties" , EOL;
$objPHPExcel->getProperties()->setCreator("Maarten Balliauw")
							 ->setLastModifiedBy("Maarten Balliauw")
							 ->setTitle("PHPExcel Test Document")
							 ->setSubject("PHPExcel Test Document")
							 ->setDescription("Test document for PHPExcel, generated using PHP classes.")
							 ->setKeywords("office PHPExcel php")
							 ->setCategory("Test result file");


// Add some data
echo date('H:i:s') , " Add some data" , EOL;
$objPHPExcel->setActiveSheetIndex(0)
            ->setCellValue('A1', 'Student')
            ->setCellValue('B1', 'Project')
            ->setCellValue('C1', 'Datum')
            ->setCellValue('D1', 'Taak')
            ->setCellValue('E1', 'Begintijd')
            ->setCellValue('F1', 'Eindtijd')
            ->setCellValue('G1', 'Totale uren')
            ->setCellValue('H1', 'Omschrijving');

// Miscellaneous glyphs, UTF-8
// Fill cells with data
if($_SESSION['user']['usertype_id'] == 1){
    $where = "WHERE `userlogs`.`user_id` = '".$_SESSION['user']['user_id']."'";
}elseif($_SESSION['user']['usertype_id'] == 2){
    $where = '';  
}

include('../classes/database.class.php');
$db = new database;

echo $query  = "SELECT * FROM `userlogs` INNER JOIN `users` ON `userlogs`.`user_id` = `users`.`user_id` ".$where." ORDER BY date DESC";
$db 	->query($query); 
$data 	= $db->resultset();
$count 	= $db->rowCount();

$i = 2;

foreach ($data as $value) {

	$objPHPExcel->setActiveSheetIndex(0)
    ->setCellValue('A'.$i, $value['firstname'].' '.$value['lastname'])
    ->setCellValue('B'.$i, $value['project'])
    ->setCellValue('C'.$i, $value['date'])
    ->setCellValue('D'.$i, $value['task'])
    ->setCellValue('E'.$i, $value['starttime'])
    ->setCellValue('F'.$i, $value['stoptime'])
    ->setCellValue('G'.$i, $value['totaltime'])
    ->setCellValue('H'.$i, $value['description']);

    echo $i++;
}



$objPHPExcel->getActiveSheet()->getStyle('H2:H'.$objPHPExcel->getActiveSheet()->getHighestRow())->getAlignment()->setWrapText(true);
$objPHPExcel->getActiveSheet()->getStyle('A1:H'.$count)->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_TOP);
$objPHPExcel->getActiveSheet()->getColumnDimension('H')->setWidth(40); 
foreach(range('A','H') as $column_id){
    $objPHPExcel->getActiveSheet()->getColumnDimension($column_id)->setAutoSize(true);
}

$objPHPExcel->getActiveSheet()->getStyle('A1')->getFont()->setBold(true);
$objPHPExcel->getActiveSheet()->getStyle('B1')->getFont()->setBold(true);
$objPHPExcel->getActiveSheet()->getStyle('C1')->getFont()->setBold(true);
$objPHPExcel->getActiveSheet()->getStyle('D1')->getFont()->setBold(true);
$objPHPExcel->getActiveSheet()->getStyle('E1')->getFont()->setBold(true);
$objPHPExcel->getActiveSheet()->getStyle('F1')->getFont()->setBold(true);
$objPHPExcel->getActiveSheet()->getStyle('G1')->getFont()->setBold(true);
$objPHPExcel->getActiveSheet()->getStyle('H1')->getFont()->setBold(true);

// Set filter
$objPHPExcel->getActiveSheet()->setAutoFilter('A1:H'.$count);

$website    = 'http://'.$_SERVER['HTTP_HOST'].'/logtime';
$today      = date("Y-m-d-H-i-s");
$filename   = $today."-logboek";
$filepath   = "../exports/excel/";
$filepath_2003   = "../exports/excel/excel-97-2003/";

// Rename worksheet
echo date('H:i:s') , " Rename worksheet" , EOL;
$objPHPExcel->getActiveSheet()->setTitle('Simple');


// Set active sheet index to the first sheet, so Excel opens this as the first sheet
$objPHPExcel->setActiveSheetIndex(0);


// Save Excel 2007 file
echo date('H:i:s') , " Write to Excel2007 format" , EOL;
$callStartTime = microtime(true);

$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
//$objWriter->save(str_replace('.php', '.xlsx', __FILE__));
$objWriter->save($filepath.$filename.".xlsx");
//$objWriter->save('php://output');
$callEndTime = microtime(true);
$callTime = $callEndTime - $callStartTime;

echo date('H:i:s') , " File written to " , $filepath , EOL;
echo 'Call time to write Workbook was ' , sprintf('%.4f',$callTime) , " seconds" , EOL;
// Echo memory usage
echo date('H:i:s') , ' Current memory usage: ' , (memory_get_usage(true) / 1024 / 1024) , " MB" , EOL;


// Save Excel 95 file
echo date('H:i:s') , " Write to Excel5 format" , EOL;
$callStartTime = microtime(true);

$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
//$objWriter->save(str_replace('.php', '.xls', __FILE__));
$objWriter->save($filepath_2003.$filename.".xls");
$callEndTime = microtime(true);
$callTime = $callEndTime - $callStartTime;

echo date('H:i:s') , " File written to " , $filepath , EOL;
echo 'Call time to write Workbook was ' , sprintf('%.4f',$callTime) , " seconds" , EOL;
// Echo memory usage
echo date('H:i:s') , ' Current memory usage: ' , (memory_get_usage(true) / 1024 / 1024) , " MB" , EOL;


// Echo memory peak usage
echo date('H:i:s') , " Peak memory usage: " , (memory_get_peak_usage(true) / 1024 / 1024) , " MB" , EOL;

// Echo done
echo date('H:i:s') , " Done writing files" , EOL;
echo 'Files have been created in ' , $website.$filepath , EOL;


$_SESSION['geslaagd'] = 'De excel export is gemaakt! Download <a href="'.$website.'/exports/excel/'.$filename.'.xlsx">hier</a> je excel';

header('Location: /logtime/logboek');
// exit();