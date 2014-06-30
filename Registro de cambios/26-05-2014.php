Registro de cambios

26/05/2014

* Agregado el campo us_tipo en la tabla usuario. Servirá para identificar lógicamente el tipo de usuario dentro del sistema.
* Cambiado el sistema de login, se reemplazo lo siguiente:

<?php 
        $conexion = Yii::app()->db;

		$consulta="SELECT us_rut,us_password FROM USUARIO WHERE us_rut='".$this->username."' AND us_password='".$this->password."'";

		$resultado=$conexion->createCommand($consulta)->query();

		$resultado->bindColumn(1,$this->username);
		$resultado->bindColumn(2,$this->password);
		$id_usuario=$this->username;

		while($resultado->read()!==false){
			$this->errorCode=self::ERROR_NONE;
			Yii::app()->getSession()->add('id_usuario', $id_usuario);
			return!$this->errorCode;
		}
?>
por lo siguiente:

<?php 
        $usuario = Usuario::model()->find('us_rut=?',array($this->username));

		if($usuario == NULL) $this->errorCode=self::ERROR_USERNAME_INVALID;
		elseif($this->password != $usuario->us_password) $this->errorCode=self::ERROR_PASSWORD_INVALID;

		else {

			Yii::app()->getSession()->add('id_usuario', $usuario->us_rut);
			Yii::app()->getSession()->add('tipo_usuario', $usuario->us_tipo);

			$this->errorCode=self::ERROR_NONE;
		}

		return!$this->errorCode;
?>

* Agregada la tabla provincia. Poblado con datos fidedignos las tablas de comuna, provincia y región.