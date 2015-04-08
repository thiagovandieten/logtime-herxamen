<?php
class user extends database{
	
	private $img_path = '_img/';
	
	public function __construct($db, $userid){
		$this->database = $db;
		$this->user_id = $userid;	
		self::getUserData();
	}
	
	public function getUserData(){
		$this->database->query('SELECT * FROM `users` WHERE user_id = :id');	
		$this->database->bind(':id', $this->user_id);
		$data = $this->database->single();
		
		// data
		$this->firstname = $data['firstname'];
		$this->lastname = $data['lastname'];
		$this->user_image_path = $data['user_image_path'];
		
		unset($data);
	}
	
	public function getName(){
		if(!empty($this->firstname)){
			return $this->firstname;
		}else{
			return 'Geen Naam';	
		}
	}
	
	public function getFullName(){
		if(!empty($this->firstname) && !empty($this->lastname)){
			return $this->firstname.' '.$this->lastname;
		}else{
			return 'Geen Naam';	
		}	
	}
	
	public function getUserImage(){
		if(!empty($this->user_image_path)){
			return $this->img_path.''.$this->user_image_path;
		}else{
			return $this->img_path.'avatar1.png';	
		}
	}
	
}
?>