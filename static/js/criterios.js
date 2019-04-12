function verificarAllSelect(){

	var ok = 1;

	$( ".uni_select" ).each(function() {
		value1 = $(this).val();
		if(value1 == undefined){
			ok = 0;
			return false;
		}
	});

	if(ok == 0) return false;

	$( ".mul_select" ).each(function() {
		value2 = $(this).val();		
		if(value2.length == 0){
			ok = 0;
			return false;
		}
	});

	return (ok == 1);	
}

function evaluar(){
	//validarSelects = verificarAllSelect();	
	var lista = []; 
	validarSelects = true;
	if( validarSelects ){
		alert("Procesando Datos ...!!");
		var totalF = 0.0;
		var totalP = 0.0;

		$( ".uni_select" ).each(function() {
			value1 = $(this).val();
			pos1 = value1.indexOf("/");
			
			ponde1 = value1.substring(0,pos1);
			nombre1 = value1.substring(pos1+1,value1.length);
			
			if(ponde1 != undefined){
				lista.push(nombre1);
				totalP = parseFloat(ponde1);
				totalF += parseFloat(totalP.toFixed(4));
			}
		});
		
		$( ".mul_select" ).each(function() {
			value2 = $(this).val();
			if(value2 != undefined ){
				for (i = 0; i < value2.length; i++) {
					pos2 = value2[i].indexOf("/");
					ponde2 = value2[i].substring(0,pos2);
					nombre2 = value2[i].substring(pos2+1,value2[i].length);
					lista.push(nombre2);
					totalP = parseFloat(ponde2);
					//alert(value2[i]);
					totalF += parseFloat(totalP.toFixed(4));
				}
			}
		}); 
		
		totEval = (totalF.toFixed(4))*100;
		nuevototEval = totEval.toFixed(2);
		//alert(totEval)
		//alert(lista);
		//alert(nuevototEval);
		
		if(totEval >= 0.0 && totEval <= 25.0){

			//alert("TOTAL: "+(totalF.toFixed(4)*100)+" "+"CATEGORIA IV");
			window.location.replace("resultado/categoryD?value="+nuevototEval+"&condicion="+lista);
			
		} else if(totEval >= 26.0 && totEval <= 50.0){

			//alert("TOTAL: "+(totalF.toFixed(4)*100)+" "+"CATEGORIA III");
			window.location.replace("resultado/categoryC?value="+nuevototEval+"&condicion="+lista);
			
		} else if(totEval >= 51.0 && totEval <= 75.0){

			//alert("TOTAL: "+(totalF.toFixed(4)*100)+" "+"CATEGORIA II");
			window.location.replace("resultado/categoryB?value="+nuevototEval+"&condicion="+lista);
			
		}else if(totEval >= 76.0 && totEval <= 100.0){

			//alert("TOTAL: "+(totalF.toFixed(4)*100)+" "+"CATEGORIA I");
			window.location.replace("resultado/categoryA?value="+nuevototEval+"&condicion="+lista);
			
		} else{
			alert("ERROR: Vuelva a Intentarlo");
		}
	} else{
		alert("Complete todos los campos!");		
	}
}

function restaurar(){	
	window.location.replace("../form_eval");
}

function regresar(){
	alert("regresar ...");
}

function RedirectToForm(){
	window.location.replace("../form_eval");
}