<?php 
class groupsettings extends database{
	
	public function __construct($db){
		$this->database = $db;	
		$this->group_id = PROJECTGROUP_ID;
		$this->user_id = USER_ID;
		self::getGroupdata();
		self::checkStudentWage();
	}
	
	protected function getGroupdata(){
		$this->database->query('SELECT * FROM `projectgroup` WHERE projectgroup_id = :prjid');	
		$this->database->bind(':prjid', $this->group_id);
		$this->data = $this->database->resultset();
		
		foreach($this->data as $value){
			$this->image_path = $value['image_path'];
			$this->leader_id = $value['leader_id'];	
		}
		unset($this->data);
	}
	
	public function saveImage($image){
		if(!empty($image)){
			$this->database->query('UPDATE `projectgroup` SET `image_path`="'.$image.'" WHERE `projectgroup_id`='.$this->group_id.'');
			$this->database->execute();	
		}
	}
	
	public function hasPermission(){
		
		if($this->leader_id != $this->user_id){
			header('Location: /dashboard');	
		}
	}
	
	protected function checkStudentWage(){
		$this->database->query('SELECT * FROM `studentwage` WHERE project_group_id = :prjid');	
		$this->database->bind(':prjid', $this->group_id);
		$this->data = $this->database->single();
	
		if($this->data == false){
			$this->database->query("INSERT INTO `studentwage` (`wage`, `project_group_id`) VALUES ('0', '".$this->group_id."')");
			$this->database->execute();	
		}
		$this->studentwage = $this->data['wage'];	
	}
	
	public function getStudentWage(){
		return $this->studentwage;
	}
	
	public function getGroupImage(){
		if(empty($this->image_path)){
			$this->group_image = '_img/avatar1.png';
		}else{
			$this->group_image = '_img/uploads/group_avatar/'.$this->image_path.'';
		}
		return '<img src="'.$this->group_image.'" class="groupimage">';
	}
	
	public function save_wage($wage){
		var_dump($wage);
		if(empty($wage)){
			self::setError('Ongeldige invoer!');	
		}else{
			if(!preg_match('/^[0-9]+(\\.[0-9]+)?$/', $wage)) {
			  // invalid
			  self::setError('Ongeldige invoer!');
			}else{
				$this->database->query('UPDATE `studentwage` SET `wage`='.$wage.' WHERE `project_group_id`='.$this->group_id.'');
				$this->database->execute();
			  self::setNotification('De nieuwe data is succesvol opgeslagen!');
			}
		}
	}
	
	protected function setError($error){
		$this->error = $error;	
	}
	
	public function getError(){
		return $this->error;	
	}
	
	protected function setNotification($msg){
		$this->msg = $msg;	
	}
	
	public function getNotification(){
		return $this->msg;	
	}
}