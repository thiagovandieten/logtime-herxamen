<?php
class login extends database{
	
	public function __construct($db){
		$this->database = $db;	
	}
	
	public function setLoginData($email, $password){
		$this->email = $email;
		$this->password = hash('sha512', $password);	
	}
	
	public function setError($error){
		$this->error = $error;	
	}
	
	public function getError(){
		return $this->error;	
	}
	
	public function setNotification($error){
		$this->error = $error;	
	}
	
	public function getNotification(){
		return $this->error;	
	}
	
	protected function emptyPost($var){
		if(empty($var)){
			return false;	
		}else{
			return true;	
		}
	}
	
	protected function is_email(){
		if(!filter_var($this->email, FILTER_VALIDATE_EMAIL)) {
			return false;
		}else{
			return true;
		}	
	}

	protected function checkFirstLogin(){
		$this->database->query('SELECT * FROM `users` WHERE email = :email OR usercode = :usercode');
		$this->database->bind(':email', $this->email);
		$this->database->bind(':usercode', $this->email);
		$data = $this->database->single();



		if($data['firstname'] == ''){
			$_SESSION['temp_user_id'] = $data['user_id'];
			return true;
		}else{
			return false;
		}

	}

	protected function user_code_exist(){
		$this->database->query('SELECT * FROM `users` WHERE usercode = :usercode AND password = :password');	
		$this->database->bind(':usercode', $this->email);
		$this->database->bind(':password', $this->password);
		$this->database->resultset();
		
		if(empty($this->database->resultset())){
			return 	false;
		}else{
			return true;	
		}
	}
	
	protected function checkEmail(){
		$this->database->query('SELECT * FROM `users` WHERE email = :email AND password = :password');	
		$this->database->bind(':email', $this->email);
		$this->database->bind(':password', $this->password);
		$this->database->resultset();
		
		if(empty($this->database->resultset())){
			return 	false;
		}else{
			return true;	
		}
	}
	
	protected function checkUserCode(){
		$this->database->query('SELECT * FROM `users` WHERE usercode = :usercode AND password = :password');	
		$this->database->bind(':usercode', $this->email);
		$this->database->bind(':password', $this->password);
		$this->database->resultset();
		
		if(empty($this->database->resultset())){
			return 	false;
		}else{
			return true;	
		}
	}
	
	protected function setupUser(){
		$this->database->query('SELECT * FROM `users` WHERE usercode = :usercode AND password = :password');	
		$this->database->bind(':usercode', $this->email);
		$this->database->bind(':password', $this->password);
		$data = $this->database->resultset();
		foreach($data as $key){
			## Sessie zetten
			$_SESSION['user'] = array(
				'user_id' => $key['user_id'],
				'usercode' => $key['usercode'],
				'email' => $key['email'],
				'voornaam' => $key['firstname'],
				'achternaam' => $key['lastname'],
				'usertype_id' => $key['usertype_id'],
				'projectgroup_id' => $key['projectgroup_id'],
				'location_id' => $key['location_id']
			);
		}
	}
	
	public function validateLogin(){
		if(self::emptyPost($this->email) == false){
			self::setError('Alle velden moeten worden ingevuld!');
		}elseif($this->checkFirstLogin() == true){
			header('location: login&firstlogin');
		}elseif(empty($this->password) OR $this->password == ''){
			self::setError('Alle velden moeten worden ingevuld!');
		}else{
			// Check of het email is of user code
			if(self::is_email() == true){
				// User logt in met een email
				if(self::checkEmail() == false){
					self::setError('Het email adres of het wachtwoord is onjuist!');
				}else{
					self::setupUser();
					self::setNotification('Succesvol ingelogd!');	
				}
			}elseif(self::user_code_exist() == true){
				if(self::checkUserCode() == false){
					self::setError('Het email adres of het wachtwoord is onjuist!');
				}else{
					self::setupUser();
					header('Location: login');
				}
			}else{
				self::setError('Het email adres of het wachtwoord is onjuist!');
			}
		}
	}
	
	public function loggedIn(){
		if(empty($_SESSION['user'])){
			header('Location: login');
		}
	}
	
	public function logged(){
		if(!empty($_SESSION['user'])){
			header('Location: dashboard');
		}
	}
	
	public function nav(){
		if($_SESSION['user']['usertype_id'] == 1){
		 	return 'navigatie_student';
		}elseif($_SESSION['user']['usertype_id'] == 2){
			return 'navigatie_docent';	
		}
	}

	public function firstLogin($post){
		$temp_id = $post['temp_id'];
		if($this->emptyPost($post['firstname']) == false){
			self::setError('Alle velden moeten worden ingevuld!');
		}elseif($this->emptyPost($post['lastname']) == false){
			self::setError('Alle velden moeten worden ingevuld!');
		}elseif($this->emptyPost($post['password']) == false){
			self::setError('Alle velden moeten worden ingevuld!');
		}elseif($this->emptyPost($post['password_re']) == false){
			self::setError('Alle velden moeten worden ingevuld!');
		}elseif(ctype_alpha($post['firstname']) == false){
			self::setError('Je naam en achternaam mogen alleen letters bevatten!');
		}elseif(ctype_alpha($post['lastname']) == false){
			self::setError('Je naam en achternaam mogen alleen letters bevatten!');
		}elseif($post['password'] != $post['password_re']){
			self::setError('De twee passworden matchen niet!');
		}else{
			$this->database->query('UPDATE `users` SET `firstname`="'.$post['firstname'].'", `lastname`="'.$post['lastname'].'", `password`="'.hash('sha512', $post['password']).'" WHERE `user_id`="'.$temp_id.'"');
			$this->database->execute();
			self::setNotification('Je heb succesvol je gegevens ingevoerd en kunt nu inloggen met je gegevens!');

		}
	}
	
}
?>