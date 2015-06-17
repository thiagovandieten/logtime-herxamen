<?php
class notification extends database{
	
	public function __construct($db, $id){
		$this->database = $db;	
		$this->id = $id;
	}
	
	public function getUserTypes(){
		$this->database->query('SELECT * FROM `usertypes`');	
		$data = $this->database->resultset();	
		echo '<select name="usertype">';
			if($this->database->rowCount() > 0){
				foreach($data as $value){
					echo '<option value="'.$value['usertype_id'].'">'.$value['usertype'].'</option>';	
				}
			}else{
				echo '<option value="'.$data['usertype_id'].'">'.$data['usertype'].'</option>';	
			}
		echo '</select>';
	}
	
	private function checkUserType($id){
		$this->database->query('SELECT `usertype_id` FROM `usertypes` WHERE `usertype_id`= :id');
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
	
	
	public function countNotifications(){
		$this->database->query('SELECT `to_id` FROM `notifications` WHERE `to_id`= :id AND `active`= 1');
		$this->database->bind(':id', $this->id);	
		$counting = $this->database->rowCount();
		if($counting > 0){
			return $counting;
		}else{
			return 0;	
		}
	}
	
	public function getUserNotifications(){
		$this->database->query('SELECT * FROM `notifications` WHERE `to_id`= "'.$this->id.'" AND `active` = "1"');
		return $this->database->resultset();
		
	}
	
	// VALIDATE VOOR DOCENTEN AREA
	public function Validate($post){
		if(empty($post['onderwerp'])){
			$this->setError('Je hebt geen onderwerp opgegeven!');
		}elseif(empty($post['description'])){
			$this->setError('Je hebt geen bericht opgegeven!');
		}elseif($this->checkUserType($post['usertype']) == false){
			$this->setError('Je hebt een ongeldig type opgegeven!');
		}else{
			$text = $post['decsription'];
			if(strlen($text) > 300){
				$this->setError('Je mag niet meer dan 300 tekens opgeven bij het bericht!');
			}elseif(strlen($post['onderwerp']) > 100){
				$this->setError('Je mag niet meer dan 100 tekens opgeven bij het onderwerp!');
			}else{
				$text = addslashes($text);
				$onderwerp = addslashes($post['description']);
				$this->database->query('SELECT `user_id` FROM `users` WHERE `usertype_id`='.$post['usertype']);	
				$data = $this->database->resultset();	
				$count = 0;
				
				foreach($data as $value){
					$this->database->query('INSERT INTO `notifications` (`notification_name`, `notification_description`, `from_id`, `to_id` ) VALUES ("'.$onderwerp.'", "'.$text.'", "'.$this->id.'", "'.$value['user_id'].'")');
					$this->database->execute();
					$count = $count + 1;
				}
				
				if($count > 0){
					$this->setNotification('De notificatie is naar '.$count.' gebruikers verstuurd!');	
				}else{
					$this->setError('De notificatie is niet verstuurd wegens een probleem met het versturen naar de gebruikers toe!');
				}
			}
		}
	}
}
?>