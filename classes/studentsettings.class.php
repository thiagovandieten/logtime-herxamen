<?php
class studentsettings extends database{
	
	public function __construct($db, $userid , $location_id){
		$this->location_id = $location_id;
		$this->database = $db;
		$this->user_id = $userid;
	}
	
	protected function getProjectGroup($id){
		$this->database->query('SELECT `projectgroup_name` FROM `projectgroup` WHERE `projectgroup_id` = :id');	
		$this->database->bind(':id', $id);
		$this->data = $this->database->single();
		
		if(!empty($this->data)){
			return $this->data['projectgroup_name'];	
		}else{
			return 'Geen';	
		}
	}
	
	protected function getAdress($id){
		$this->database->query('SELECT * FROM `adresses` WHERE `adress_id` = :id');	
		$this->database->bind(':id', $id);
		$this->data = $this->database->single();
		
		if(!empty($this->data)){
			return $this->data['street'].' '.$this->data['housenumber'].' '.$this->data['zipcode'].' '.$this->data['city'];	
		}else{
			return 'Geen';	
		}
	}
	
	public function returnAllUsers(){
		$this->database->query('SELECT * FROM `users`');	
		
		$this->data = $this->database->resultset();
		
		echo '<table class="order-table table" cellspacing="0">
            <thead>
            <tr class="border_bottom">
                <td style="color: #666;">#</td>
                <td style="color: #666;">Voornaam</td>
                <td style="color: #666;">Achternaam</td>
                <td style="color: #666;">Email</td>
                <td style="color: #666;">Telefoon</td>
				<td style="color: #666">Adres</td>
                <td style="color: #666">Project Groep</td>
				<td style="color: #666">Laatst Online</td>
            </tr>
            </thead><tbody>';
		foreach($this->data as $value){
			echo '<tr >
                <td><input type="checkbox" style="display: block"></td>
                <td>'.$value['firstname'].'</td>
                <td>'.$value['lastname'].'</td>
                <td>'.$value['email'].'</td>
                <td>'.$value['phone_number'].'</td>
                <td>'.self::getAdress($value['adress_id']).'</td>
				<td>'.self::getProjectGroup($value['projectgroup_id']).'</td>
                <td>'.$value['lasttime_online'].'</td>
            </tr>';
		}
        echo '</tbody></table>';
	}

	/**
	 * gets all users with user type student
	 * @return array multidimensional filled with all students
	 */
	public function getAllStudents()
	{
		$this->database->query("SELECT `user_id`, `firstname`, `lastname` FROM `users` WHERE usertype_id = 1 AND location_id = :location_id");
		$this->database->bind(':location_id' , $this->location_id);
		return $this->database->resultset();
	}

	public function allusertypes(){
		$this->database->query('SELECT * FROM `usertypes`');	
		$this->data = $this->database->resultset();
		return  $this->data;
	}
	
	public function checkUserType($id){
		$this->database->query('SELECT `usertype_id` FROM `usertypes` WHERE `usertype_id`= :id');
		$this->database->bind(':id', $id);	
		if($this->database->rowCount() > 0){
			return true;
		}else{
			return false;	
		}
	}
	
	public function checkUsercode($id){
		$this->database->query('SELECT `usercode` FROM `users` WHERE `usercode`= :id');
		$this->database->bind(':id', $id);	
		if($this->database->rowCount() > 0){
			return true;
		}else{
			return false;	
		}
	}
	
	private function setError($error){
		$this->error = $error;	
	}
	
	public function getError(){
		return $this->error;	
	}
	
	private function setNotification($notification){
		$this->notification = $notification;	
	}
	
	public function getNotification(){
		return $this->notification;	
	}
	
	public function newUser($post){
		if(!empty($post)){
			$userCode = $post['usercode'];
			$email = $post['email'];
			$sort = $post['sort'];
			
			if(empty($userCode) OR empty($email)){
				self::setError('Alle velden dienen ingevuld te worden!');	
			}else{
				if(!filter_var($email, FILTER_VALIDATE_EMAIL)){
					self::setError('Ongeldig E-Mail adres!');	
				}elseif(!is_numeric($userCode)){
					self::setError('Ongeldig student code!');	
				}elseif(self::checkUserType($sort) == false){
					self::setError('Ongeldig user level!');	
				}elseif(self::checkUsercode($userCode) == true){
					self::setError('Deze user code bestaat al!');		
				}else{
					$this->database->query('INSERT INTO `users` (`usercode`, `email`, `usertype_id`, `location_id` ,`adress_id`) VALUES ('.$userCode.', "'.$email.'", '.$sort.', 1, 1)');
					$this->database->execute();
					self::setNotification('Deze gebruiker is succesvol toegevoegd');	
				}
			}
				
		}
	}
	
}
?>