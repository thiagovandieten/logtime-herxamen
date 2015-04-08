<?php 
class groupsettings extends database{
	
	public function __construct($db, $formClass){
		$this->database = $db;	
		$this->group_id = PROJECTGROUP_ID;
		$this->user_id = USER_ID;
		self::setGroupdata();
		self::setLocationData();
	}
	
	protected function setGroupdata(){
		$this->database->query('SELECT * FROM `projectgroup` WHERE projectgroup_id = :prjid');	
		$this->database->bind(':prjid', $this->group_id);
		$this->data = $this->database->resultset();
		
		foreach($this->data as $value){
			$this->image_path = $value['image_path'];
			$this->leader_id = $value['leader_id'];	
			$this->groupname = $value['projectgroup_name'];
			$this->adress_id = $value['location_id'];
			$this->yearid = $value['year_id'];
		}
		unset($this->data);
	}
	
	protected function setLocationData(){
		$this->database->query('SELECT * FROM `adresses` WHERE adress_id = :id');	
		$this->database->bind(':id', $this->adress_id);
		$data = $this->database->single();
		
		$this->street = $data['street'];
		$this->city = $data['city'];
		$this->housenumber = $data['housenumber'];
		$this->zipcode = $data['zipcode'];
	}
	
	public function getGroupdata($type, $location = false, $locationswitch = false){
		if($location == false){
			switch ($type) {
				case 'leader_id' : return $this->leader_id; break;
				case 'projectgroup_name' : return $this->groupname; break;
				case 'location_id' : return $this->location_id; break;
				case 'yearid' : return $this->year_id; break; 	
			}
		}else{
			switch ($locationswitch) {
				case 'street' : return $this->street; break;
				case 'city' : return $this->city; break;
				case 'housenumber' : return $this->housenumber; break;
				case 'zipcode' : return $this->zipcode; break; 	
			}	
		}
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
		if(empty($wage)){
			return false;
		}else{
			if(!preg_match('/^[0-9]+(\\.[0-9]+)?$/', $wage)) {
			  // invalid
			  return false;
			}else{
				$this->database->query('UPDATE `studentwage` SET `wage`='.$wage.' WHERE `project_group_id`='.$this->group_id.'');
				$this->database->execute();
			  return true;
			}
		}
	}
	
	public function is_name($str){
		if(preg_match('~^[\p{L}\p{Z}]+$~u', $str) == true){
			return true;	
		}else{
			return false;	
		}
	}
	
	public function replaceSymbols($str){
		return preg_replace('/[^\p{L}\p{N}\s]/u', '', $str);
	}
	
	protected function searchAdress($straatnaam, $city, $housenumber){
		$this->database->query('SELECT * FROM `adresses` WHERE `street`="'.$straatnaam.'" AND `city` = "'.$city.'" AND `housenumber` = "'.$housenumber.'" ');
		$rows = $this->database->rowCount();

		if($rows == 0){
			return false;
		}else{
			return true;	
		}
	}
	
	protected function getAdress($straatnaam, $city, $housenumber){
		$this->database->query('SELECT * FROM `adresses` WHERE `street`="'.$straatnaam.'" AND `city` = "'.$city.'" AND `housenumber` = "'.$housenumber.'" ');
		$id = $this->database->single();
		return $id['adress_id'];
	}
	
	public function valildate_form($post){
		if(empty($post['groepsnaam'])){
			self::setError('Groepsnaam is een verplicht veld!');
		}elseif(empty($post['straatnaam'])){
			self::setError('Straatnaam is een verplicht veld!');
		}elseif(empty($post['huisnummer'])){
			self::setError('Huisnummer is een verplicht veld!');
		}elseif(empty($post['postcode'])){
			self::setError('Postcode is een verplicht veld!');
		}elseif(empty($post['woonplaats'])){
			self::setError('Woonplaats is een verplicht veld!');
		}elseif(self::is_name($post['groepsnaam']) == false){
			self::setError('Groepsnaam is ongeldig!');
		}elseif(self::is_name($post['straatnaam']) == false){
			self::setError('straatnaam is ongeldig!');
		}elseif(self::is_name($post['woonplaats']) == false){
			self::setError('woonplaats is ongeldig!');
		}elseif(self::save_wage($post['wage']) == false){
		self::setError('Je hebt een ongeldig uurloon opgegeven!');
		}else{
			if(self::searchAdress($post['straatnaam'], $post['woonplaats'], $post['huisnummer']) == false){
				// Adres bestaat niet dus vul hem in in het db.
				$this->database->query('INSERT INTO `adresses` (`street`, `housenumber`, `city`, `zipcode`) 
										VALUES ("'.$post['straatnaam'].'", "'.$post['huisnummer'].'", "'.$post['woonplaats'].'", "'.self::replaceSymbols($post['postcode']).'")  ');	
				$this->database->execute();
			
				$lastinsertID = $this->database->lastInsertId();
				
				$this->database->query('UPDATE `projectgroup` SET `adress_id`="'.$lastinsertID.'" 
										WHERE `projectgroup_id`="'.$this->group_id.'"');
				$this->database->execute();
			}else{
				$this->database->query('UPDATE `projectgroup` SET `adress_id`="'.self::getAdress($post['straatnaam'], $post['woonplaats'], $post['huisnummer']).'" 
										WHERE `projectgroup_id`="'.$this->group_id.'"');
				$this->database->execute();
				
			}
			$this->database->query('UPDATE `projectgroup` SET `projectgroup_name`="'.$post['groepsnaam'].'" 
										WHERE `projectgroup_id`="'.$this->group_id.'"');
			$this->database->execute();
			self::setNotification('De gegevens zijn succesvol geupdate!');
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