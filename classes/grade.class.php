<?php
/**
 * class for the grade interactions
 */
class grade extends database
{

	/**
	 * sets db and location
	 * @param object $db database object set in config
	 */
	public function __construct($db,$location_id)
	{
		$this->location_id = $location_id;
		$this->database = $db;
	}

	/**
	 * returns all grade from same location
	 * @return array contains all grades
	 */
	public function getAllGrades()
	{
		$this->database->query('SELECT * FROM `grade` WHERE location_id = :location_id');
		$this->database->bind(':location_id' , $this->location_id);
		return $this->database->resultset();
	}
}