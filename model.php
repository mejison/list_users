<?php
	class Model {
		var $_db = NULL;
		
		public function __construct()
		{
			$this->_db = new mysqli("localhost", "root", "", "test_app");
		}
		
		public function get_users_all($post)
		{
			$users = array();
			$sql = "SELECT * FROM `users`";
			$result = $this->_db->query($sql);
			foreach($result->fetch_all(1) as $row)
			{
				$row['date'] = date("Y.m.d", $row['data_add']);
				$users[$row['id']] = $row;
			}
			
			$sql = "SELECT * FROM `reviews`";
			$result = $this->_db->query($sql);
			foreach($result->fetch_all(1) as $row)
			{
				$users[$row['users_id']]['reviews'][] = $row;
			}
			
			foreach($users as $row)
			{
				$users[$row['id']]['count_reviews'] = count($row['reviews']);
			}
			
			return $users;
		}
		
		public function remove_user($post)
		{
			$sql = "DELETE FROM `test_app`.`users` WHERE `id` = '" . $post['id'] . "';";
			$this->_db->query($sql);
			
			$sql = "SELECT * FROM `test_app`.`reviews` WHERE `users_id` = '" . $post['id'] . "';";
			$result = $this->_db->query($sql);
			if ($result->num_rows)
			{
				$sql = "DELETE FROM `test_app`.`reviews` WHERE `users_id` = '" . $post['id'] . "';";
				if ($this->_db->query($sql))
				{
					return true;
				}
			}
			
		}
		
		public function save_user($post)
		{
			$check = false;
			if ( ! empty($post['id']))
			{
				$id = $post['id'];
				unset($post['id']);
				$sql = "UPDATE `test_app`.`users` SET ";
				foreach($post as $key => $value)
				{
					$sql .= "`" . $key . "` = '" . $value . "'";
					if ($value != end($post))
					{
						$sql .= ", ";
					}
				}
				
				$sql .= " WHERE `id` = '" . $id . "';";
				
				if ($this->_db->query($sql))
				{
					$check = true;
				}
			}
			else
			{
				$post['add_date'] = time();
				$sql = "INSERT INTO `users` (`";
				$sql .= implode("`, `", array_keys($post)) . "`) VALUES ('";
				$sql .= implode("', '", array_values($post)) . "');";
				if ($this->_db->query($sql))
				{
					$check = true;
				}				
			}
			return $check;
		}
	}
	
	
	$response = array();
	$model = new Model();
	if (method_exists($model, $action = $_GET['action']))
	{
		$response['data'] = $model->$action($_POST);
	}
	echo json_encode($response);
	
	