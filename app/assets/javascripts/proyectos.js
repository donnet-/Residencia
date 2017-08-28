function mostrarProyecto(opcion) {
    if(opcion.value == "proyecto") {
        document.getElementById('proyectoG').style.display = 'block';
        document.getElementById('docentes').style.display = 'none';
        document.getElementById('residentes').style.display = 'none';  
    }
    else if(opcion.value == "docent") {
        document.getElementById('docentes').style.display = 'block';
        document.getElementById('proyectoG').style.display = 'none';
        document.getElementById('residentes').style.display = 'none';    
    }
    else if(opcion.value == "residente") {
        document.getElementById('residentes').style.display = 'block';
        document.getElementById('proyectoG').style.display = 'none';
        document.getElementById('docentes').style.display = 'none';    
    }
}

function archivo(valor) {
    if (valor == "com") {
        document.getElementById("comision").style.display = 'block';
        document.getElementById("liberacion").style.display = 'none'; 
        document.getElementById("revisor").style.display = 'none';
    }
    else if(valor == "libe") {
        document.getElementById("liberacion").style.display = 'block';
        document.getElementById("comision").style.display = 'none';
        document.getElementById("revisor").style.display = 'none';
    }
    else if(valor == "comRev") {
        document.getElementById("revisor").style.display = 'block';
        document.getElementById("liberacion").style.display = 'none';
        document.getElementById("comision").style.display = 'none';
    }
}
