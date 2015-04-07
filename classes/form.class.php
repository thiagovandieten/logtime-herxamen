<?php
class form{

	public function is_name($str){
		if(preg_match('~^[\p{L}\p{Z}]+$~u', $str) == true){
			return false;	
		}else{
			return true;	
		}
	}
	
	public function check(){
		return 'jaa';
	}
	
}