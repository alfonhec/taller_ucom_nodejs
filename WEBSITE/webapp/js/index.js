var botonEnviar = document.getElementById("btn-enviar");

botonEnviar.addEventListener("click", function () {
  console.log("enviar");
  enviarDatos();
});

function enviarDatos() {
  console.log("enviar datos");
  const nombre = document.getElementById("name");
  const status = document.getElementById("status");

  const categoria = document.getElementById("categoria");

  console.log("nombre ", nombre);
  console.log("categoria ", categoria);

  let params = {
    id: 2020,
    name: "" + nombre,
    status: "" + status
  };

  axios({
    method: "post",
    url: "https://petstore.swagger.io/v2/pet",
    transformRequest: [
      function (data, headers) {
        // Do whatever you want to transform the data
        console.log("transform request");
        return data;
      }
    ],
    data: params
  }).then(function (res) {
    console.log("Crear mascota");
    console.log(res);
    alert(res);
  });
}

var botonGetParams = document.getElementById("json_get_params");

botonGetParams.addEventListener("click", function () {
  //obtener una mascota por ID
  let filterbyStatus = "pending";

  axios
    .get("https://petstore.swagger.io/v2/pet/findByStatus", {
      params: {
        status: filterbyStatus
      },
      responseType: "json"
    })
    .then(function (res) {
      //cuando obtenemos una respuesta satisfactoria del lado del servidor
      //la peticion se proceso correctamente

      console.log(res);
      console.log("cantidad: " + res.data.length);
    })
    .catch(function (err) {
      //cuando hubo un error al procesar la peticion en el servidor
      console.log("Error en la peticion GET");
      console.log(err);
    })
    .finally(function () {
      //esta peticion siempre se ejecuta al finalizar el procesamiento del lado del servidor
      console.log("ejecutamos la funcion finally");
    });
});
