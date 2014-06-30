<?php public function actionAjaxasigna($act){

		$act = $_GET['act'];

		$autoIdAll = $_POST['autoId'];
		$OfertaPractica=OfertaPractica::model()->findByPk($act);
		if(count($autoIdAll)>0){
			if(count($autoIdAll)<=$OfertaPractica->pr_vacantes){

	
					foreach($autoIdAll as $autoId){

						$OfertaPractica->pr_vacantes=$OfertaPractica->pr_vacantes-1;
						$OfertaPractica->pr_inscritos=$OfertaPractica->pr_inscritos+1;

						$incribe=new InscribePractica;
						$incribe->pr_identificador=$act;
						$incribe->us_rut=$autoId;
						$incribe->pr_fecha_inicio=date('Y-m-d');
						$incribe->pr_evaluacion_profesor=null;
						$incribe->pr_fecha_fin=null;
						$incribe->pr_evaluacion_empleador=null;

						if($OfertaPractica->save()&&$incribe->save()) echo 'OK';
						else throw new Exception('Error', 500);
					}

			
				
			}
			//else  throw new Exception("Sorry",500);
		}

	}?>