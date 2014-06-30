<?php

public function validateRut($attribute, $params) {

        $rut = $this->us_rut;

        /* Separación del dígito verificador */
	   $r = substr($rut,0,-1);

	   $esEntero = filter_var($r,FILTER_VALIDATE_INT);

	   if($r == $esEntero){

	   	$dv = substr($rut,-1);
       
       if($dv == 'k' || $dv == filter_var($dv, FILTER_VALIDATE_INT)){

	    /* Ajustando valores en caso de que el dígito verificador sea 0 o K */	 
	   if($dv == 'k') {

	      $dv = 10;
	   }
	   else{
	     if($dv == 0) $dv = 11; 
	   }

	   $cont = 0;
	   $sum = 0;
	   $mul = 0;
	   while ($cont < strlen($r)){
	      
		  $mul = 2 + $cont;
		  if($mul > 7) $mul = $mul - 6;
		  
		  $dig = substr($r,-($cont+1),1);
		  
		  $sum = $sum + ($mul * $dig);
		  
		  $cont = $cont + 1;
	   }
	   
	   $dvC = 11 - ($sum % 11);

        if($dvC != $dv)
            $this->addError('us_rut', 'Rut inválido - Mala suma.');
      }

      else $this->addError('us_rut', 'Rut inválido - Formato inválido.');
     }

      else $this->addError('us_rut', 'Rut inválido - Formato inválido.');
   }

  ?>

  public function validateRut($attribute, $params) {

        $rut = $this->us_rut;

        /* Separación del dígito verificador */
	   $r = substr($rut,0,-1);
	   $dv = substr($rut,-1);

	    /* Ajustando valores en caso de que el dígito verificador sea 0 o K */	 
	   if($dv == 'k') {

	      $dv = 10;
	   }
	   else{
	     if($dv == 0) $dv = 11; 
	   }

	   $cont = 0;
	   $sum = 0;
	   $mul = 0;
	   while ($cont < strlen($r)){
	      
		  $mul = 2 + $cont;
		  if($mul > 7) $mul = $mul - 6;
		  
		  $dig = substr($r,-($cont+1),1);
		  
		  $sum = $sum + ($mul * $dig);
		  
		  $cont = $cont + 1;
	   }
	   
	   $dvC = 11 - ($sum % 11);

        if($dvC != $dv)
            $this->addError('us_rut', 'Rut inválido.');
    }