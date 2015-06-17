<?php
/*
*	@author : Yannick Berendsen
*/
class database extends PDO{
	private $host = 'localhost';
	private $user = 'root';
	private $pass = '';
	private $dbname = 'logtime';
	private $dbh;
	private $error;
	private $stmt;

    /**
     * @param $dbname
     * @param $user
     * @param $pass
     */
    //public function __construct($dbname, $user, $pass)
    public function __construct()
	{
        //$this->dbname = $dbname;
        //$this->user = $user;
        //$this->pass = $pass;
		// Set DSN
		$dsn = 'mysql:host=' . $this->host . ';dbname=' . $this->dbname;	
		
		// Set options
		$options = array(
			PDO::ATTR_PERSISTENT => true, 
			PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
		);
		
		try {
			$this->dbh = new PDO($dsn, $this->user, $this->pass, $options);
		}// Catch any errors
		catch (PDOException $e) {
			echo $this->error = $e->getMessage();
		}
	}
	
	public function classConnectTest()
	{
		return "Connected";	
	}
	
	public function query($query){
    	$this->stmt = $this->dbh->prepare($query);
	}
	
	public function bind($param, $value, $type = null){
		 if (is_null($type)) {
			switch (true) 
			{
				case is_int($value):
				  $type = PDO::PARAM_INT;  
				  break;
				case is_bool($value):
				  $type = PDO::PARAM_BOOL;
				  break;
				case is_null($value):
				  $type = PDO::PARAM_NULL;
				  break;
				default:
				  $type = PDO::PARAM_STR;
			}
			$this->stmt->bindValue($param, $value, $type);
		 }
	}
	
	public function execute(){
		return $this->stmt->execute();
	}
	
	public function resultset(){
    	$this->execute();
    	return $this->stmt->fetchAll(PDO::FETCH_ASSOC);
	}
	
	public function single(){
		$this->execute();
		return $this->stmt->fetch(PDO::FETCH_ASSOC);
	}
	
	public function rowCount(){
		$this->execute();
		return $this->stmt->rowCount();
	}
	
	public function lastInsertId(){
		return $this->dbh->lastInsertId();
	}
	
	public function beginTransaction(){
   		return $this->dbh->beginTransaction();
	}
	
	public function endTransaction(){
    	return $this->dbh->commit();
	}
	public function cancelTransaction(){
    	return $this->dbh->rollBack();
	}
	
	public function debugDumpParams(){
    	return $this->stmt->debugDumpParams();
	}
	
	##UPDATE CLASS
	public function setTable($table){
		$this->table = $table;	
	}
	
	public function setWhere($where){
		$this->where = $where;	
	}
	
	public function dataWhere($isWhere){
		$this->isWhere = $isWhere;	
	}
	
	public function overwrite_update($row, $data){
		if($row == 0 OR $data == 0){
			$this->row = $row;
			$this->data = $data;
			
			if(empty($this->where)){
				self::query("UPDATE `".$this->table."` SET `".$this->row."`=:row");
				self::bind(":row",$this->data);
				self::execute();
				return true;
			}else{
				self::query("UPDATE `".$this->table."` SET `".$this->row."`=:row WHERE `".$this->where."`=:where");
				self::bind(":row",$this->data);
				self::bind(":where",$this->isWhere);
				self::execute();
				return true;
			}
		}else{
			return false;	
		}
	}
	
}