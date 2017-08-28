// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require bootstrap-sprockets
//= require bootstrap-datepicker
//= require turbolinks
//= require jquery_nested_form
//= require rails.validations
//= require rails.validations.nested_form
//= require chosen-jquery
//= require scaffold
//= require ckeditor/init
//= require_tree .

//$( document ).ready(function() { alert("Hello, world!") });

function agregarP (opcion) {
    if (opcion == "a") {
        document.getElementById("archivo").style.display = 'block';
        document.getElementById("manual").style.display = 'none';     
    }
    else {
        document.getElementById("archivo").style.display = 'none';
        document.getElementById("manual").style.display = 'block';
    }
}

function mostrar_proy_inv(opcion) {
    if(opcion.value == "proyectoi") {
        document.getElementById('proyectoGI').style.display = 'block';
        document.getElementById('colabooradores').style.display = 'none';
        document.getElementById('estudiantes').style.display = 'none';
        document.getElementById('documentos').style.display = 'none';
    }
    else if(opcion.value == "docent") {
        document.getElementById('colabooradores').style.display = 'block';
        document.getElementById('proyectoGI').style.display = 'none';
        document.getElementById('estudiantes').style.display = 'none'; 
        document.getElementById('documentos').style.display = 'none';
    }
    else if(opcion.value == "estudiante") {
        document.getElementById('estudiantes').style.display = 'block';
        document.getElementById('proyectoGI').style.display = 'none';
        document.getElementById('colabooradores').style.display = 'none'; 
        document.getElementById('documentos').style.display = 'none';
    }
    else if(opcion.value == "doc") {
        document.getElementById('documentos').style.display = 'block';
        document.getElementById('estudiantes').style.display = 'none';
        document.getElementById('proyectoGI').style.display = 'none';
        document.getElementById('colabooradores').style.display = 'none';    
    }
}


function agregarSNI(opcion)
{
    if(opcion == "si_sni"){
        document.getElementById("evidencia_sni").style.display = 'block';
    }
    else {
        document.getElementById("evidencia_sni").style.display = 'none';
    }  
}

function agregarDatos(opcion) {
    if(opcion == "si_oficio"){
        document.getElementById("datos_oficio").style.display = 'block';
    }
    else {
        document.getElementById("datos_oficio").style.display = 'none';
    }  
}

function agregarPRODEP(opcion) { 
    if(opcion == "si_prodep") {
        document.getElementById("evidencia_prodep").style.display = 'block';
    }
    else {
        document.getElementById("evidencia_prodep").style.display = 'none';
    }
}
function muestraPanel(nombre){
    if(document.getElementById(nombre).style.display == 'block'){
        document.getElementById(nombre).style.display = 'none';
    }else{
        document.getElementById(nombre).style.display = 'block';
    }
}

function muestraPanelMat(){
    if(document.getElementById("marco").style.display == 'block'){
        document.getElementById("marco").style.display = 'none';
    }else{
        document.getElementById("marco").style.display = 'block';
    }
}
function validarCampoVacio() {
    var campoCurp = document.getElementById("usuario_curp").value;
    var campoRfc = document.getElementById("usuario_rfc").value;
    var campoNumControl = document.getElementById("usuario_numControl").value;
    
    if( campoCurp == null || campoCurp.length == 0 || /^\s+$/.test(campoCurp))
        {
            alert("Revise algunos campos no se rellenaron correctamente!!!");
        }
    else if( campoRfc == null || campoRfc.length == 0 || /^\s+$/.test(campoRfc))
        {
            alert("Revise algunos campos no se rellenaron correctamente!!!");
        }
    else if( campoNumControl == null || campoNumControl.length == 0 || /^\s+$/.test(campoNumControl))
        {
            alert("Revise algunos campos no se rellenaron correctamente!!!");
        }
}

function validarExpirationDate()
{
    anio = document.getElementById('actividad_fechaInicio_1i').value
    mes = document.getElementById('actividad_fechaInicio_2i').value
    dia = document.getElementById('actividad_fechaInicio_3i').value
    
    var fecha_actual = new Date();
    
    var meses = Array("Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre");
    
    var day = fecha_actual.getDate();
    var month = fecha_actual.getMonth() + 1;
    var year = fecha_actual.getFullYear();
    
    if(dia < day)
        {
            alert("Se está registrando el curso una fecha anterior a la de hoy");
        }
}

function validarFechaIguales()
{
    dia1 = document.getElementById('actividad_fechaInicio_1i').value
    dia2 = document.getElementById('actividad_fechaTermino_1i').value
    mes1 = document.getElementById('actividad_fechaInicio_2i').value
    mes2 = document.getElementById('actividad_fechaTermino_2i').value
    anio1 = document.getElementById('actividad_fechaInicio_3i').value
    anio2 = document.getElementById('actividad_fechaTermino_3i').value

    if (dia1 == dia2 && mes1 == mes2 && anio1 == anio2)
    {
        alert("El curso sólo dura un día");
    }
}

function tipoDocente(opcion)
{
    if(opcion == "t")
    {
        document.getElementById("to").style.display ='block';
        document.getElementById("plaza").style.display ='none';
        document.getElementById("ho").style.display ='none';         
    } 
    if(opcion == "p")
    {
        document.getElementById("plaza").style.display ='block';
        document.getElementById("to").style.display ='none';
        document.getElementById("ho").style.display ='none';         
    } 
    if(opcion == "h")
    {
        document.getElementById("ho").style.display ='block'; 
        document.getElementById("to").style.display ='none';
        document.getElementById("plaza").style.display ='none';        
    } 
}

function mostrar(opcion)
{
    if(opcion.value == "ho") {
        document.getElementById('honorario').style.display = 'block';
        document.getElementById('plaza').style.display = 'none';
    }
    else if (opcion.value == "pl")
    {
        document.getElementById('plaza').style.display = 'block';
        document.getElementById('honorario').style.display = 'none';
    }
    else if(opcion.value == "evi")
    {
        document.getElementById('evidencia').style.display = 'block';
        document.getElementById('actviat').style.display = 'none';
        document.getElementById('indevi').style.display = 'none';
    }
    else if(opcion.value == "ind")
    {
        document.getElementById('indevi').style.display = 'block';
        document.getElementById('actviat').style.display = 'none';
        document.getElementById('evidencia').style.display = 'none';
    }
    else if(opcion.value == "viat")
    {
        document.getElementById('actviat').style.display = 'block';
        document.getElementById('evidencia').style.display = 'none';
        document.getElementById('indevi').style.display = 'none';
    }
    else if(opcion.value == "Añadir grupo")
    {
        document.getElementById('grupviaje').style.display = 'block';
    }
    else if(opcion.value == "Generar anexo")
    {
        document.getElementById('anexoIII').style.display = 'block';
        document.getElementById('verAnexoIII').style.display = 'none';
        document.getElementById('datoG').style.display = 'none';
        document.getElementById('solicitud').style.display = 'none';
        
    }
    else if(opcion.value == "Ver solicitud")
    {
        document.getElementById('solicitud').style.display = 'block';
        document.getElementById('anexoIII').style.display = 'none';
        document.getElementById('verAnexoIII').style.display = 'none';
        document.getElementById('datoG').style.display = 'none';
    }
    else if(opcion.value == "Ver anexo")
    {
        document.getElementById('verAnexoIII').style.display = 'block';
        document.getElementById('anexoIII').style.display = 'none';
        document.getElementById('datoG').style.display = 'none';
        document.getElementById('solicitud').style.display = 'none';
    }
    else if(opcion.value == "Generar liberacion")
    {
        document.getElementById('terminacion').style.display = 'block';
    }
    else if(opcion.value == "datos")
    {
        document.getElementById('datoG').style.display = 'block';
        document.getElementById('omvi').style.display = 'none';
        document.getElementById('comision').style.display = 'none';
        document.getElementById('pasaje').style.display = 'none';
        document.getElementById('liquidacion').style.display = 'none';
        document.getElementById('comisionsv').style.display = 'none';
        document.getElementById('informe').style.display = 'none';
        document.getElementById('modulo').style.display = 'none';
        document.getElementById('Vmodulo').style.display = 'none';
        document.getElementById('Eindividual').style.display = 'none';
        document.getElementById('Eequipo').style.display = 'none';
        document.getElementById('doc').style.display = 'none';
        document.getElementById('comisionver').style.display = 'none';
        document.getElementById('VerOmvi').style.display = 'none';
        document.getElementById('VerPasaje').style.display = 'none';
        document.getElementById('VerLiquidacion').style.display = 'none';
        document.getElementById('VerInforme').style.display = 'none';
        document.getElementById('comisionAct').style.display = 'none';
        document.getElementById('verComisionAct').style.display = 'none';
        document.getElementById('informeComision').style.display = 'none';
        document.getElementById('verInformeComision').style.display = 'none';
        document.getElementById('liquidacionAct').style.display = 'none';
        document.getElementById('verLiquidacionAct').style.display = 'none';
        document.getElementById('omviAct').style.display = 'none';
        document.getElementById('verOmviAct').style.display = 'none';
        document.getElementById('pasajeAct').style.display = 'none';
        document.getElementById('verPasajeAct').style.display = 'none';
        document.getElementById('verAnexoIII').style.display = 'none';
        document.getElementById('datoG').style.display = 'none';
        document.getElementById('solicitud').style.display = 'none';
    }
    else if(opcion.value == "docent")
    {
        document.getElementById('doc').style.display = 'block';
        document.getElementById('datoG').style.display = 'none';
        document.getElementById('omvi').style.display = 'none';
        document.getElementById('comision').style.display = 'none';
        document.getElementById('pasaje').style.display = 'none';
        document.getElementById('liquidacion').style.display = 'none';
        document.getElementById('comisionsv').style.display = 'none';
        document.getElementById('informe').style.display = 'none';
        document.getElementById('modulo').style.display = 'none';
        document.getElementById('Eequipo').style.display = 'none';
        document.getElementById('Vmodulo').style.display = 'none';
        document.getElementById('Eindividual').style.display = 'none';
        document.getElementById('comisionver').style.display = 'none';
        document.getElementById('VerOmvi').style.display = 'none';
        document.getElementById('VerPasaje').style.display = 'none';
        document.getElementById('VerLiquidacion').style.display = 'none';
        document.getElementById('VerInforme').style.display = 'none';
        document.getElementById('comisionAct').style.display = 'none';
        document.getElementById('verComisionAct').style.display = 'none';
        document.getElementById('informeComision').style.display = 'none';
        document.getElementById('verInformeComision').style.display = 'none';
        document.getElementById('liquidacionAct').style.display = 'none';
        document.getElementById('verLiquidacionAct').style.display = 'none';
        document.getElementById('omviAct').style.display = 'none';
        document.getElementById('verOmviAct').style.display = 'none';
        document.getElementById('pasajeAct').style.display = 'none';
        document.getElementById('verPasajeAct').style.display = 'none';
    }
    else if(opcion.value == "individual")
    {
        document.getElementById('Eindividual').style.display = 'block';
        document.getElementById('datoG').style.display = 'none';
        document.getElementById('omvi').style.display = 'none';
        document.getElementById('comision').style.display = 'none';
        document.getElementById('pasaje').style.display = 'none';
        document.getElementById('liquidacion').style.display = 'none';
        document.getElementById('comisionsv').style.display = 'none';
        document.getElementById('informe').style.display = 'none';
        document.getElementById('modulo').style.display = 'none';
        document.getElementById('Eequipo').style.display = 'none';
        document.getElementById('Vmodulo').style.display = 'none';
        document.getElementById('doc').style.display = 'none';
        document.getElementById('comisionver').style.display = 'none';
        document.getElementById('VerOmvi').style.display = 'none';
        document.getElementById('VerPasaje').style.display = 'none';
        document.getElementById('VerLiquidacion').style.display = 'none';
        document.getElementById('VerInforme').style.display = 'none';
        document.getElementById('comisionAct').style.display = 'none';
        document.getElementById('verComisionAct').style.display = 'none';
        document.getElementById('informeComision').style.display = 'none';
        document.getElementById('verInformeComision').style.display = 'none';
        document.getElementById('liquidacionAct').style.display = 'none';
        document.getElementById('verLiquidacionAct').style.display = 'none';
        document.getElementById('omviAct').style.display = 'none';
        document.getElementById('verOmviAct').style.display = 'none';
        document.getElementById('pasajeAct').style.display = 'none';
        document.getElementById('verPasajeAct').style.display = 'none';
    }
    else if(opcion.value == "Equipo")
    {
        document.getElementById('Eequipo').style.display = 'block';
        document.getElementById('datoG').style.display = 'none';
        document.getElementById('omvi').style.display = 'none';
        document.getElementById('comision').style.display = 'none';
        document.getElementById('pasaje').style.display = 'none';
        document.getElementById('liquidacion').style.display = 'none';
        document.getElementById('comisionsv').style.display = 'none';
        document.getElementById('informe').style.display = 'none';
        document.getElementById('modulo').style.display = 'none';
        document.getElementById('Eindividual').style.display = 'none';
        document.getElementById('Vmodulo').style.display = 'none';
        document.getElementById('doc').style.display = 'none';
        document.getElementById('comisionver').style.display = 'none';
        document.getElementById('VerOmvi').style.display = 'none';
        document.getElementById('VerPasaje').style.display = 'none';
        document.getElementById('VerLiquidacion').style.display = 'none';
        document.getElementById('VerInforme').style.display = 'none';
        document.getElementById('comisionAct').style.display = 'none';
        document.getElementById('verComisionAct').style.display = 'none';
        document.getElementById('informeComision').style.display = 'none';
        document.getElementById('verInformeComision').style.display = 'none';
        document.getElementById('liquidacionAct').style.display = 'none';
        document.getElementById('verLiquidacionAct').style.display = 'none';
        document.getElementById('omviAct').style.display = 'none';
        document.getElementById('verOmviAct').style.display = 'none';
        document.getElementById('pasajeAct').style.display = 'none';
        document.getElementById('verPasajeAct').style.display = 'none';
    }
    else if(opcion.value == "Registrar Modulo")
    {
        document.getElementById('modulo').style.display = 'block';
        document.getElementById('datoG').style.display = 'none';
        document.getElementById('omvi').style.display = 'none';
        document.getElementById('comision').style.display = 'none';
        document.getElementById('pasaje').style.display = 'none';
        document.getElementById('liquidacion').style.display = 'none';
        document.getElementById('comisionsv').style.display = 'none';
        document.getElementById('informe').style.display = 'none';
        document.getElementById('Vmodulo').style.display = 'none';
        document.getElementById('Eindividual').style.display = 'none';
        document.getElementById('Eequipo').style.display = 'none';
        document.getElementById('doc').style.display = 'none';
        document.getElementById('comisionver').style.display = 'none';
        document.getElementById('VerOmvi').style.display = 'none';
        document.getElementById('VerPasaje').style.display = 'none';
        document.getElementById('VerLiquidacion').style.display = 'none';
        document.getElementById('VerInforme').style.display = 'none';
    }
    else if(opcion.value == "Ver modulo")
    {
        document.getElementById('Vmodulo').style.display = 'block';
        document.getElementById('datoG').style.display = 'none';
        document.getElementById('omvi').style.display = 'none';
        document.getElementById('comision').style.display = 'none';
        document.getElementById('pasaje').style.display = 'none';
        document.getElementById('liquidacion').style.display = 'none';
        document.getElementById('comisionsv').style.display = 'none';
        document.getElementById('informe').style.display = 'none';
        document.getElementById('modulo').style.display = 'none';
        document.getElementById('Eindividual').style.display = 'none';
        document.getElementById('Eequipo').style.display = 'none';
        document.getElementById('doc').style.display = 'none';
        document.getElementById('comisionver').style.display = 'none';
        document.getElementById('VerOmvi').style.display = 'none';
        document.getElementById('VerPasaje').style.display = 'none';
        document.getElementById('VerLiquidacion').style.display = 'none';
        document.getElementById('VerInforme').style.display = 'none';
    }
    else if(opcion.value == "Generar OMVI")
    {
        document.getElementById('omvi').style.display = 'block';
        document.getElementById('datoG').style.display = 'none';
        document.getElementById('comision').style.display = 'none';
        document.getElementById('pasaje').style.display = 'none';
        document.getElementById('liquidacion').style.display = 'none';
        document.getElementById('comisionsv').style.display = 'none';
        document.getElementById('informe').style.display = 'none';
        document.getElementById('modulo').style.display = 'none';
        document.getElementById('Vmodulo').style.display = 'none';
        document.getElementById('Eindividual').style.display = 'none';
        document.getElementById('Eequipo').style.display = 'none';
        document.getElementById('doc').style.display = 'none';
        document.getElementById('comisionver').style.display = 'none';
        document.getElementById('VerOmvi').style.display = 'none';
        document.getElementById('VerPasaje').style.display = 'none';
        document.getElementById('VerLiquidacion').style.display = 'none';
        document.getElementById('VerInforme').style.display = 'none';
    }
    else if(opcion.value == "Ver OMVI")
    {
        document.getElementById('VerOmvi').style.display = 'block';
        document.getElementById('omvi').style.display = 'none';
        document.getElementById('datoG').style.display = 'none';
        document.getElementById('comision').style.display = 'none';
        document.getElementById('pasaje').style.display = 'none';
        document.getElementById('liquidacion').style.display = 'none';
        document.getElementById('comisionsv').style.display = 'none';
        document.getElementById('informe').style.display = 'none';
        document.getElementById('modulo').style.display = 'none';
        document.getElementById('Vmodulo').style.display = 'none';
        document.getElementById('Eindividual').style.display = 'none';
        document.getElementById('Eequipo').style.display = 'none';
        document.getElementById('doc').style.display = 'none';
        document.getElementById('comisionver').style.display = 'none';
        document.getElementById('VerPasaje').style.display = 'none';
        document.getElementById('VerLiquidacion').style.display = 'none';
        document.getElementById('VerInforme').style.display = 'none';
    }
    else if(opcion.value == "Generar Comision")
    {
        document.getElementById('comision').style.display = 'block';
        document.getElementById('omvi').style.display = 'none';
        document.getElementById('datoG').style.display = 'none';
        document.getElementById('pasaje').style.display = 'none';
        document.getElementById('liquidacion').style.display = 'none';
        document.getElementById('comisionsv').style.display = 'none';
        document.getElementById('informe').style.display = 'none';
        document.getElementById('modulo').style.display = 'none';
        document.getElementById('Vmodulo').style.display = 'none';
        document.getElementById('Eindividual').style.display = 'none';
        document.getElementById('Eequipo').style.display = 'none';
        document.getElementById('doc').style.display = 'none';
        document.getElementById('comisionver').style.display = 'none';
        document.getElementById('VerOmvi').style.display = 'none';
        document.getElementById('VerPasaje').style.display = 'none';
        document.getElementById('VerLiquidacion').style.display = 'none';
        document.getElementById('VerInforme').style.display = 'none';
    }  
    else if(opcion.value == "Ver Comision")
    {
        document.getElementById('comisionver').style.display = 'block';
        document.getElementById('comision').style.display = 'none';
        document.getElementById('omvi').style.display = 'none';
        document.getElementById('datoG').style.display = 'none';
        document.getElementById('pasaje').style.display = 'none';
        document.getElementById('liquidacion').style.display = 'none';
        document.getElementById('comisionsv').style.display = 'none';
        document.getElementById('informe').style.display = 'none';
        document.getElementById('modulo').style.display = 'none';
        document.getElementById('Vmodulo').style.display = 'none';
        document.getElementById('Eindividual').style.display = 'none';
        document.getElementById('Eequipo').style.display = 'none';
        document.getElementById('doc').style.display = 'none';
        document.getElementById('VerOmvi').style.display = 'none';
        document.getElementById('VerPasaje').style.display = 'none';
        document.getElementById('VerLiquidacion').style.display = 'none';
        document.getElementById('VerInforme').style.display = 'none';
    }    
    else if(opcion.value == "Generar Orden pasaje")
    {
        document.getElementById('pasaje').style.display = 'block';
        document.getElementById('datoG').style.display = 'none';
        document.getElementById('comision').style.display = 'none';
        document.getElementById('omvi').style.display = 'none';
        document.getElementById('liquidacion').style.display = 'none';
        document.getElementById('comisionsv').style.display = 'none';
        document.getElementById('informe').style.display = 'none';
        document.getElementById('modulo').style.display = 'none';
        document.getElementById('Vmodulo').style.display = 'none';
        document.getElementById('Eindividual').style.display = 'none';
        document.getElementById('Eequipo').style.display = 'none';
        document.getElementById('doc').style.display = 'none';
        document.getElementById('comisionver').style.display = 'none';
        document.getElementById('VerOmvi').style.display = 'none';
        document.getElementById('VerPasaje').style.display = 'none';
        document.getElementById('VerLiquidacion').style.display = 'none';
        document.getElementById('VerInforme').style.display = 'none';
    }
    else if(opcion.value == "Ver Orden pasaje")
    {
        document.getElementById('VerPasaje').style.display = 'block';
        document.getElementById('pasaje').style.display = 'none';
        document.getElementById('datoG').style.display = 'none';
        document.getElementById('comision').style.display = 'none';
        document.getElementById('omvi').style.display = 'none';
        document.getElementById('liquidacion').style.display = 'none';
        document.getElementById('comisionsv').style.display = 'none';
        document.getElementById('informe').style.display = 'none';
        document.getElementById('modulo').style.display = 'none';
        document.getElementById('Vmodulo').style.display = 'none';
        document.getElementById('Eindividual').style.display = 'none';
        document.getElementById('Eequipo').style.display = 'none';
        document.getElementById('doc').style.display = 'none';
        document.getElementById('comisionver').style.display = 'none';
        document.getElementById('VerOmvi').style.display = 'none';
        document.getElementById('VerLiquidacion').style.display = 'none';
        document.getElementById('VerInforme').style.display = 'none';
    }
    else if(opcion.value == "Generar Liquidación")
    {
        document.getElementById('liquidacion').style.display = 'block';
        document.getElementById('datoG').style.display = 'none';
        document.getElementById('comision').style.display = 'none';
        document.getElementById('pasaje').style.display = 'none';
        document.getElementById('omvi').style.display = 'none';
        document.getElementById('comisionsv').style.display = 'none';
        document.getElementById('informe').style.display = 'none';
        document.getElementById('modulo').style.display = 'none';
        document.getElementById('Vmodulo').style.display = 'none';
        document.getElementById('Eindividual').style.display = 'none';
        document.getElementById('Eequipo').style.display = 'none';
        document.getElementById('doc').style.display = 'none';
        document.getElementById('comisionver').style.display = 'none';
        document.getElementById('VerOmvi').style.display = 'none';
        document.getElementById('VerPasaje').style.display = 'none';
        document.getElementById('VerLiquidacion').style.display = 'none';
        document.getElementById('VerInforme').style.display = 'none';
    }
    else if(opcion.value == "Ver Liquidación")
    {
        document.getElementById('VerLiquidacion').style.display = 'block';
        document.getElementById('liquidacion').style.display = 'none';
        document.getElementById('datoG').style.display = 'none';
        document.getElementById('comision').style.display = 'none';
        document.getElementById('pasaje').style.display = 'none';
        document.getElementById('omvi').style.display = 'none';
        document.getElementById('comisionsv').style.display = 'none';
        document.getElementById('informe').style.display = 'none';
        document.getElementById('modulo').style.display = 'none';
        document.getElementById('Vmodulo').style.display = 'none';
        document.getElementById('Eindividual').style.display = 'none';
        document.getElementById('Eequipo').style.display = 'none';
        document.getElementById('doc').style.display = 'none';
        document.getElementById('comisionver').style.display = 'none';
        document.getElementById('VerOmvi').style.display = 'none';
        document.getElementById('VerPasaje').style.display = 'none';
        document.getElementById('VerInforme').style.display = 'none';
    }
    else if(opcion.value == "Generar archivo comision")
    {
        document.getElementById('comisionsv').style.display = 'block';
        document.getElementById('datoG').style.display = 'none';
        document.getElementById('comision').style.display = 'none';
        document.getElementById('pasaje').style.display = 'none';
        document.getElementById('liquidacion').style.display = 'none';
        document.getElementById('omvi').style.display = 'none';
        document.getElementById('informe').style.display = 'none';
        document.getElementById('modulo').style.display = 'none';
        document.getElementById('Vmodulo').style.display = 'none';
        document.getElementById('Eindividual').style.display = 'none';
        document.getElementById('Eequipo').style.display = 'none';
        document.getElementById('doc').style.display = 'none';
        document.getElementById('comisionver').style.display = 'none';
        document.getElementById('VerOmvi').style.display = 'none';
        document.getElementById('VerPasaje').style.display = 'none';
        document.getElementById('VerLiquidacion').style.display = 'none';
        document.getElementById('VerInforme').style.display = 'none';
    }
    else if(opcion.value == "Generar informe")
    {
        document.getElementById('informe').style.display = 'block';
        document.getElementById('datoG').style.display = 'none';
        document.getElementById('comision').style.display = 'none';
        document.getElementById('pasaje').style.display = 'none';
        document.getElementById('liquidacion').style.display = 'none';
        document.getElementById('comisionsv').style.display = 'none';
        document.getElementById('omvi').style.display = 'none';
        document.getElementById('modulo').style.display = 'none';
        document.getElementById('Vmodulo').style.display = 'none';
        document.getElementById('Eindividual').style.display = 'none';
        document.getElementById('Eequipo').style.display = 'none';
        document.getElementById('doc').style.display = 'none';
        document.getElementById('comisionver').style.display = 'none';
        document.getElementById('VerOmvi').style.display = 'none';
        document.getElementById('VerPasaje').style.display = 'none';
        document.getElementById('VerLiquidacion').style.display = 'none';
        document.getElementById('VerInforme').style.display = 'none';
    }
    else if(opcion.value == "Ver informe")
    {
        document.getElementById('VerInforme').style.display = 'block';
        document.getElementById('informe').style.display = 'none';
        document.getElementById('datoG').style.display = 'none';
        document.getElementById('comision').style.display = 'none';
        document.getElementById('pasaje').style.display = 'none';
        document.getElementById('liquidacion').style.display = 'none';
        document.getElementById('comisionsv').style.display = 'none';
        document.getElementById('omvi').style.display = 'none';
        document.getElementById('modulo').style.display = 'none';
        document.getElementById('Vmodulo').style.display = 'none';
        document.getElementById('Eindividual').style.display = 'none';
        document.getElementById('Eequipo').style.display = 'none';
        document.getElementById('doc').style.display = 'none';
        document.getElementById('comisionver').style.display = 'none';
        document.getElementById('VerOmvi').style.display = 'none';
        document.getElementById('VerPasaje').style.display = 'none';
        document.getElementById('VerLiquidacion').style.display = 'none';
    }
    else if(opcion.value == "Generar aceptacion")
    {
        document.getElementById('aceptacion').style.display = 'block';
    }
}

function mostrarFormAct(opcion)
{
    if(opcion.value == "Generar Comision gnral") {
        document.getElementById('comisionAct').style.display = 'block';
        document.getElementById('verComisionAct').style.display = 'none';
        document.getElementById('datoG').style.display = 'none';
        document.getElementById('Eindividual').style.display = 'none';
        document.getElementById('Eequipo').style.display = 'none';
        document.getElementById('doc').style.display = 'none';
        document.getElementById('informeComision').style.display = 'none';
        document.getElementById('verInformeComision').style.display = 'none';
        document.getElementById('liquidacionAct').style.display = 'none';
        document.getElementById('verLiquidacionAct').style.display = 'none';
        document.getElementById('omviAct').style.display = 'none';
        document.getElementById('verOmviAct').style.display = 'none';
        document.getElementById('pasajeAct').style.display = 'none';
        document.getElementById('verPasajeAct').style.display = 'none';
        document.getElementById('verAnexoIII').style.display = 'none';
        document.getElementById('solicitud').style.display = 'none';
    } 
    else if(opcion.value == "Ver Comision gnral") {
        document.getElementById('verComisionAct').style.display = 'block';
        document.getElementById('comisionAct').style.display = 'none';
        document.getElementById('datoG').style.display = 'none';
        document.getElementById('Eindividual').style.display = 'none';
        document.getElementById('Eequipo').style.display = 'none';
        document.getElementById('doc').style.display = 'none';
        document.getElementById('informeComision').style.display = 'none';
        document.getElementById('verInformeComision').style.display = 'none';
        document.getElementById('liquidacionAct').style.display = 'none';
        document.getElementById('verLiquidacionAct').style.display = 'none';
        document.getElementById('omviAct').style.display = 'none';
        document.getElementById('verOmviAct').style.display = 'none';
        document.getElementById('pasajeAct').style.display = 'none';
        document.getElementById('verPasajeAct').style.display = 'none';
        document.getElementById('verAnexoIII').style.display = 'none';
        document.getElementById('solicitud').style.display = 'none';
    } 
    else if(opcion.value == "Generar informe gnral") {
        document.getElementById('informeComision').style.display = 'block';
        document.getElementById('comisionAct').style.display = 'none';
        document.getElementById('verComisionAct').style.display = 'none';
        document.getElementById('datoG').style.display = 'none';
        document.getElementById('Eindividual').style.display = 'none';
        document.getElementById('Eequipo').style.display = 'none';
        document.getElementById('doc').style.display = 'none';
        document.getElementById('liquidacionAct').style.display = 'none';
        document.getElementById('verLiquidacionAct').style.display = 'none';
        document.getElementById('omviAct').style.display = 'none';
        document.getElementById('verOmviAct').style.display = 'none';
        document.getElementById('pasajeAct').style.display = 'none';
        document.getElementById('verPasajeAct').style.display = 'none';
        document.getElementById('verAnexoIII').style.display = 'none';
        document.getElementById('solicitud').style.display = 'none';
    } 
    else if(opcion.value == "Ver informe gnral") {
        document.getElementById('verInformeComision').style.display = 'block';
        document.getElementById('verComisionAct').style.display = 'none';
        document.getElementById('comisionAct').style.display = 'none';
        document.getElementById('datoG').style.display = 'none';
        document.getElementById('Eindividual').style.display = 'none';
        document.getElementById('Eequipo').style.display = 'none';
        document.getElementById('doc').style.display = 'none';
        document.getElementById('liquidacionAct').style.display = 'none';
        document.getElementById('verLiquidacionAct').style.display = 'none';
        document.getElementById('omviAct').style.display = 'none';
        document.getElementById('verOmviAct').style.display = 'none';
        document.getElementById('pasajeAct').style.display = 'none';
        document.getElementById('verPasajeAct').style.display = 'none';
        document.getElementById('verAnexoIII').style.display = 'none';
        document.getElementById('solicitud').style.display = 'none';
    } 
    else if(opcion.value == "Generar Liquidación gnral") {
        document.getElementById('liquidacionAct').style.display = 'block';
        document.getElementById('verLiquidacionAct').style.display = 'none';
        document.getElementById('informeComision').style.display = 'none';
        document.getElementById('comisionAct').style.display = 'none';
        document.getElementById('verComisionAct').style.display = 'none';
        document.getElementById('datoG').style.display = 'none';
        document.getElementById('Eindividual').style.display = 'none';
        document.getElementById('Eequipo').style.display = 'none';
        document.getElementById('doc').style.display = 'none';
        document.getElementById('omviAct').style.display = 'none';
        document.getElementById('verOmviAct').style.display = 'none';
        document.getElementById('pasajeAct').style.display = 'none';
        document.getElementById('verPasajeAct').style.display = 'none';
        document.getElementById('verAnexoIII').style.display = 'none';
        document.getElementById('solicitud').style.display = 'none';
    } 
    else if(opcion.value == "Ver Liquidación gnral") {
        document.getElementById('verLiquidacionAct').style.display = 'block';
        document.getElementById('liquidacionAct').style.display = 'none';
        document.getElementById('verInformeComision').style.display = 'none';
        document.getElementById('verComisionAct').style.display = 'none';
        document.getElementById('comisionAct').style.display = 'none';
        document.getElementById('datoG').style.display = 'none';
        document.getElementById('Eindividual').style.display = 'none';
        document.getElementById('Eequipo').style.display = 'none';
        document.getElementById('doc').style.display = 'none';
        document.getElementById('omviAct').style.display = 'none';
        document.getElementById('verOmviAct').style.display = 'none';
        document.getElementById('pasajeAct').style.display = 'none';
        document.getElementById('verPasajeAct').style.display = 'none';
        document.getElementById('verAnexoIII').style.display = 'none';
        document.getElementById('solicitud').style.display = 'none';
    }
    else if(opcion.value == "Generar OMVI gnral") {
        document.getElementById('omviAct').style.display = 'block';
        document.getElementById('verOmviAct').style.display = 'none';
        document.getElementById('liquidacionAct').style.display = 'none';
        document.getElementById('verLiquidacionAct').style.display = 'none';
        document.getElementById('informeComision').style.display = 'none';
        document.getElementById('comisionAct').style.display = 'none';
        document.getElementById('verComisionAct').style.display = 'none';
        document.getElementById('datoG').style.display = 'none';
        document.getElementById('Eindividual').style.display = 'none';
        document.getElementById('Eequipo').style.display = 'none';
        document.getElementById('doc').style.display = 'none';
        document.getElementById('pasajeAct').style.display = 'none';
        document.getElementById('verPasajeAct').style.display = 'none';
        document.getElementById('verAnexoIII').style.display = 'none';
        document.getElementById('solicitud').style.display = 'none';
    } 
    else if(opcion.value == "Ver OMVI gnral") {
        document.getElementById('verOmviAct').style.display = 'block';
        document.getElementById('omviAct').style.display = 'none';
        document.getElementById('verLiquidacionAct').style.display = 'none';
        document.getElementById('liquidacionAct').style.display = 'none';
        document.getElementById('verInformeComision').style.display = 'none';
        document.getElementById('verComisionAct').style.display = 'none';
        document.getElementById('comisionAct').style.display = 'none';
        document.getElementById('datoG').style.display = 'none';
        document.getElementById('Eindividual').style.display = 'none';
        document.getElementById('Eequipo').style.display = 'none';
        document.getElementById('doc').style.display = 'none';
        document.getElementById('pasajeAct').style.display = 'none';
        document.getElementById('verPasajeAct').style.display = 'none';
        document.getElementById('verAnexoIII').style.display = 'none';
        document.getElementById('solicitud').style.display = 'none';
    }
    else if(opcion.value == "Generar Orden pasaje gnral") {
        document.getElementById('pasajeAct').style.display = 'block';
        document.getElementById('verPasajeAct').style.display = 'none';
        document.getElementById('omviAct').style.display = 'none';
        document.getElementById('verOmviAct').style.display = 'none';
        document.getElementById('liquidacionAct').style.display = 'none';
        document.getElementById('verLiquidacionAct').style.display = 'none';
        document.getElementById('informeComision').style.display = 'none';
        document.getElementById('comisionAct').style.display = 'none';
        document.getElementById('verComisionAct').style.display = 'none';
        document.getElementById('datoG').style.display = 'none';
        document.getElementById('Eindividual').style.display = 'none';
        document.getElementById('Eequipo').style.display = 'none';
        document.getElementById('doc').style.display = 'none';
        document.getElementById('verAnexoIII').style.display = 'none';
        document.getElementById('solicitud').style.display = 'none';
    } 
    else if(opcion.value == "Ver Orden pasaje gnral") {
        document.getElementById('verPasajeAct').style.display = 'block';
        document.getElementById('pasajeAct').style.display = 'none';
        document.getElementById('verOmviAct').style.display = 'none';
        document.getElementById('omviAct').style.display = 'none';
        document.getElementById('verLiquidacionAct').style.display = 'none';
        document.getElementById('liquidacionAct').style.display = 'none';
        document.getElementById('verInformeComision').style.display = 'none';
        document.getElementById('verComisionAct').style.display = 'none';
        document.getElementById('comisionAct').style.display = 'none';
        document.getElementById('datoG').style.display = 'none';
        document.getElementById('Eindividual').style.display = 'none';
        document.getElementById('Eequipo').style.display = 'none';
        document.getElementById('doc').style.display = 'none';
        document.getElementById('verAnexoIII').style.display = 'none';
        document.getElementById('solicitud').style.display = 'none';
    }
}

$(document).ready(function() {
    $('input').bind('railsAutocomplete.select', function(event, data) {
        $('#numControl').val(data.item.id);
        $('#docente_id').val(data.item.id);
        $('#cat_materia_id').val(data.item.id);
    });
});

function busqueda(){
    document.getElementById('todas').style.display = 'block';
    document.getElementById('todasAct').style.display = 'block';
    document.getElementById('actividades').style.display = 'none';
    document.getElementById('actividadesRec').style.display = 'none';
}

function calendario1(){
    document.getElementById('Calendario').style.display = 'none';
    document.getElementById('calend').style.display = 'block';
}
function calendario2(){
    document.getElementById('Calendario').style.display = 'block';
    document.getElementById('calend').style.display = 'none';
}

$(document).ready(function() {
    $("#recargar").click(function(){
        function refresh() {
         if(new Date().getTime() - time >= 30000) 
             window.location.reload(true);
         else 
             setTimeout(refresh, 10000);
     }

    });
    /*var time = new Date().getTime();
     $(document.body).bind("mousemove keypress", function(e) {
         time = new Date().getTime();
     });

     function refresh() {
         if(new Date().getTime() - time >= 30000) 
             window.location.reload(true);
         else 
             setTimeout(refresh, 10000);
     }

     setTimeout(refresh, 10000);*/
});

/*
$(document).ready(function() { 
    $("#actividad_descripcion").click(function() {
        var meses = Array("ENERO", "FEBRERO", "MARZO", "ABRIL", "MAYO", "JUNIO", "JULIO", "AGOSTO", "SEPTIEMBRE", "OCTUBRE", "NOVIEMBRE", "DICIEMBRE");
		
		var cadena = $("#actividad_descripcion").val();
		
		//Nuevos_Valores
		var tipoAct = $("#actividades_select").find('option:selected').text();
		var nombAct = $("#actividad_nombreActividad").text();
		var fechaini = $("#actividad_fechaInicio").val();
		var fechater = $("#actividad_fechaTermino").val();
		var horaAct = $("#actividad_hora").find('option:selected').text();
		var lugarAct = $("#actividad_lugar").val();
		
		var dayI = fechaini.substr(8,10);
        var monthI = fechaini.substr(5,2);
        var anioI = fechaini.substr(0,4);
        var dayF = fechater.substr(8,10);
        var monthF = fechater.substr(5,2);
        var anioF = fechater.substr(0,4);
		var duracion = "";
		if (fechaini == fechater){
			duracion = " " + dayI + " de " + meses[~~monthI-1] + " del año en curso "
		} else if (anioI == anioF){
			if (monthI == monthF){
				duracion = " " + dayI + " al " + dayF + " de " + meses[~~monthI-1] + " del año en curso "
			} else {
				duracion = " " + dayI + " de " + meses[~~monthI-1] + " al " + dayF + " de " + meses[~~monthF-1] + " del año en curso "
			}
		} else {
			duracio = " " + dayI + " DE " + meses[~~monthI-1] + " DEL " + anioI + " AL " + dayF + " DE " + meses[~~monthF-1] + " DEL " + anioF	
		}
			
		//Patrones
		var tipoA = "tipoActividad?";
		var nombA = "nombreActividad?";
		var fecIA = "duracionCurso?";
		var lugA = "lugar?";
		
		var cad1 = cadena.replace(tipoA, tipoAct);
		var cad2 = cad1.replace(nombA, nombAct);
		var cad3 = cad2.replace(fecIA, duracion);
		var cad4 =  cad3.replace(lugA, lugarAct);
		
		$(this).text(cad4);
    });
});
*/

$(document).ready(function() {
    $("#actividad_tipoComision").change(function() {
        if($(this).find('option:selected').text() == "Sin Viaticos"){
            $('#registrar_viatco').css('display','none');
        }
        else{
            $('#registrar_viatco').css('display','block');
        }
    })
});

$(document).ready(function() {
    $("#actividad_cat_viatico_ids_2").change(function() {
        if($(this).prop("checked") == true){
            //alert($(this).val());
            $("#actividad_cat_viatico_ids_4").prop('disabled', true);
            $("#actividad_cat_viatico_ids_5").prop('disabled', true);
            $("#actividad_cat_viatico_ids_6").prop('disabled', true);
        }
        else {
            $("#actividad_cat_viatico_ids_4").prop('disabled', false);
            $("#actividad_cat_viatico_ids_5").prop('disabled', false);
            $("#actividad_cat_viatico_ids_6").prop('disabled', false);
        }
    });
    $("#actividad_cat_viatico_ids_4").change(function() {
        if($(this).prop("checked") == true){
            //alert($(this).val());
            $("#actividad_cat_viatico_ids_2").prop('disabled', true);
            $("#actividad_cat_viatico_ids_5").prop('disabled', true);
            $("#actividad_cat_viatico_ids_7").prop('disabled', true);
        }
        else {
            $("#actividad_cat_viatico_ids_2").prop('disabled', false);
            $("#actividad_cat_viatico_ids_5").prop('disabled', false);
            $("#actividad_cat_viatico_ids_7").prop('disabled', false);
        }
    });
    $("#actividad_cat_viatico_ids_5").change(function() {
        if($(this).prop("checked") == true){
            //alert("input 5");
            $("#actividad_cat_viatico_ids_2").prop('disabled', true);
            $("#actividad_cat_viatico_ids_4").prop('disabled', true);
            $("#actividad_cat_viatico_ids_7").prop('disabled', true);
        }
        else {
            $("#actividad_cat_viatico_ids_2").prop('disabled', false);
            $("#actividad_cat_viatico_ids_4").prop('disabled', false);
            $("#actividad_cat_viatico_ids_7").prop('disabled', false);
        }
    });
});

$(document).ready(function(){
    $('[data-behaviour~=datepicker]').datepicker({
        language: 'es',
        format: 'dd/mm/yyyy'
    });
});

$(function() {
    var Accordion = function(el, multiple) {
        this.el = el || {};
        this.multiple = multiple || false;

        var links = this.el.find('.link');        
        links.on('click', {el: this.el, multiple: this.multiple}, this.dropdown)
    }

    Accordion.prototype.dropdown = function(e) {
        var $el = e.data.el;
            $this = $(this),
            $next = $this.next();

        $next.slideToggle();
        $this.parent().toggleClass('open');

        if (!e.data.multiple) {
            $el.find('.submenu').not($next).slideUp().parent().removeClass('open');
        };
    }   

    var accordion = new Accordion($('#accordion'), false);
});

$(document).ready(function(){  
    $(".glyphicon-eye-open").mouseenter(function(evento) {
        $("#action1").css("left", evento.pageX + 5);
        $("#action1").css("top", evento.pageY + 5);
        $("#action1").css("display", "block");
    }); 
    $(".glyphicon-eye-open").mouseleave(function(e) {
        $("#action1").css("display", "none");
    });
    
    $(".glyphicon-log-in").mouseenter(function(evento) {
        $("#add").css("left", evento.pageX + 5);
        $("#add").css("top", evento.pageY + 5);
        $("#add").css("display", "block");
    }); 
    $(".glyphicon-log-in").mouseleave(function(e) {
        $("#add").css("display", "none");
    });
    
    $(".glyphicon-pencil").mouseenter(function(evento) { 
        $("#action2").css("left", evento.pageX + 2);
        $("#action2").css("top", evento.pageY + 2);
        $("#action2").css("display", "block");        
    }); 
    $(".glyphicon-pencil").mouseleave(function(e) {  
         $("#action2").css("display", "none");
    });
    
    $(".glyphicon-trash").mouseenter(function(evento) {  
        $("#action3").css("left", evento.pageX + 2);
        $("#action3").css("top", evento.pageY + 2);
        $("#action3").css("display", "block");        
    }); 
    $(".glyphicon-trash").mouseleave(function(e) {  
        $("#action3").css("display", "none");
    }); 
    
    $(".glyphicon-file").mouseenter(function(evento) {  
        $("#pdf").css("left", evento.pageX + 2);
        $("#pdf").css("top", evento.pageY + 2);
        $("#pdf").css("display", "block");        
    }); 
    $(".glyphicon-file").mouseleave(function(e) {  
        $("#pdf").css("display", "none");
    });
    
    $(".glyphicon-list-alt").mouseenter(function(evento) {  
        $("#evi").css("left", evento.pageX + 2);
        $("#evi").css("top", evento.pageY + 2);
        $("#evi").css("display", "block");        
    }); 
    $(".glyphicon-list-alt").mouseleave(function(e) {  
        $("#evi").css("display", "none");
    });
    
    $(".glyphicon-warning-sign").mouseenter(function(evento) {  
        $("#empty").css("left", evento.pageX + 2);
        $("#empty").css("top", evento.pageY + 2);
        $("#empty").css("display", "block");
        
    }); 
    $(".glyphicon-warning-sign").mouseleave(function(e) {  
        $("#empty").css("display", "none");
    });
    
    $(".glyphicon-home").mouseenter(function(evento) {  
        $("#ini").css("left", evento.pageX + 0);
        $("#ini").css("top", evento.pageY + 0);
        $("#ini").css("display", "block");
        
    }); 
    $(".glyphicon-home").mouseleave(function(e) {  
        $("#ini").css("display", "none");
    });
    
    $(".glyphicon-briefcase").mouseenter(function(evento) {  
        $("#itine").css("left", evento.pageX + 1);
        $("#itine").css("top", evento.pageY + 1);
        $("#itine").css("display", "block");
        
    }); 
    $(".glyphicon-briefcase").mouseleave(function(e) {  
        $("#itine").css("display", "none");
    });
    
    $(".glyphicon-cog").mouseenter(function(evento) {  
        $("#grado").css("left", evento.pageX + 1);
        $("#grado").css("top", evento.pageY + 1);
        $("#grado").css("display", "block");
        
    }); 
    $(".glyphicon-cog").mouseleave(function(e) {  
        $("#grado").css("display", "none");
    });
});

$(function(){
    $('#saleitem').on('show.bs.collapse', function(){
        $(".glyphiconsales").toggleClass("glyphicon-folder-open")
    })

    $('#saleitem').on('hidden.bs.collapse', function(){
        $(".glyphiconsales").toggleClass("glyphicon-folder-open")
    })
});

$('form').on('nested:fieldAdded', function(event) {
    $(event.target).find(':input').enableClientSideValidations();
});

function textoImagen(valor){
     if (valor == "txt"){
            document.getElementById("texto").style.display = 'block';
            document.getElementById("imagen").style.display = 'none';            
        }else{
            document.getElementById("texto").style.display = 'none';
            document.getElementById("imagen").style.display = 'block';
        }
}

//$(document).ready(function() {
//    $("#actividad_cat_tipo_actividad_id").change(function() {
//        if($(this).find('option:selected').val() == '21' || $(this).find('option:selected').val() == '20'){
//            $('#registrar_proy').css('display','block');
//        }
//        else{
//            $('#registrar_proy').css('display','none');
//        }
//    })
//});

$(document).ready(function() {
    $("#actividades_select").change(function() {
        if($(this).find('option:selected').text() == 'Ponencias'){
            $('#registrar_proy').css('display','block');
        }
        else{
            $('#registrar_proy').css('display','none');
        }
    })
});

$(document).ready(function() {
    $("#actividades_select").change(function() {
        if($(this).find('option:selected').text() == 'Examen profesional'){
            $('#registrar_ex').css('display','block');
        }
        else{
            $('#registrar_ex').css('display','none');
        }
    })
});

$(document).ready(function() {
    $("#actividades_select").change(function() {
        if($(this).find('option:selected').text() == 'Actualizacion'){
            $('#reg_actualizacion').css('display','block');
        }
        else{
            $('#reg_actualizacion').css('display','none');
        }
    })
});

function todosServSocial(opcion) {
    if (opcion == "s") {
		document.getElementById("sistemasServ").style.display = 'block';
		document.getElementById("mostrarTodos").style.display = 'none';
	}
	else if (opcion == "t") {
		document.getElementById("sistemasServ").style.display = 'none';
		document.getElementById("mostrarTodos").style.display = 'block';
	}
}