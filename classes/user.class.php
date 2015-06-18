<?php
class user extends database{
	
	private $img_path = '_img/uploads/personal_avatar/';
    public  $user_id,
            $firstname,
            $lastname,
            $user_image_path,
            $location_id,
            $user_type_id;
	
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
        $this->location_id = $data['location_id'];
        $this->user_type_id = $data['usertype_id'];
		
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
	
	public function nav(){
		if($_SESSION['user']['usertype_id'] == 1){
		 	return 'navigatie_student';
		}elseif($_SESSION['user']['usertype_id'] == 2){
			return 'navigatie_docent';	
		}
	}

	public function logbookData(){
		if($_SESSION['user']['usertype_id'] == 1){
		 	return "WHERE user_id = '".$this->user_id."'";
		}elseif($_SESSION['user']['usertype_id'] == 2){
			return '';	
		}
	}

	public function logbookData2(){
		if($_SESSION['user']['usertype_id'] == 1){
		 	return "AND user_id = '".$this->user_id."'";
		}elseif($_SESSION['user']['usertype_id'] == 2){
			return '';	
		}
	}

}
?>