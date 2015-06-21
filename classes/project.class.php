<?php

/**
*
*/
class project extends database
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
	 * returns all projects from same location
	 * @return array contains all projects
	 */
	public function getAllProjects()
	{
		$this->database->query('SELECT * FROM `projects` WHERE location_id = :location_id');
		$this->database->bind(':location_id' , $this->location_id);
		return $this->database->resultset();
	}
}