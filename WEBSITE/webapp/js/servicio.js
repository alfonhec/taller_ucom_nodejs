var boton=document.getElementById("btn-servicio");

boton.addEventListener('click', function (e){
    e.preventDefault();
    alert("se presiono enviar");
    enviarDatos();
})

function enviarDatos() {
    alert("enviar datos");
    const fecha = document.getElementById("fecha");
    const cliente = document.getElementById("cliente");
    const mascota = document.getElementById("mascota");
    const servicio = document.getElementById("servicio");
    const estado = document.getElementById("estado");
    alert("cliente ", cliente);
    
    let params = {
      fecha: "2020-10-23" ,
      cliente: "2" ,
      mascota: "4" ,
      servicio: "1",
      estado:"completado"
    };
    alert ("Ultima alerta antes axios");
    axios({
      method: "post",
      url: "http://localhost:3005/mascota/solicitar-servicio/",
      transformRequest: [
        function (data, headers) {
          // Do whatever you want to transform the data
          console.log("transform request");
          return data;
        }
      ],
      data: params
    }).then(function (res) {
      console.log("Crear Servicio");
      console.log(res);
      alert(res);
    });
  }

