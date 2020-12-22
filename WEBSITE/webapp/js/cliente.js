const nombre = document.getElementById("nombre");
const apellido = document.getElementById("apellido");
const telefono = document.getElementById("telefono");
const email = document.getElementById("email");
const direccion = document.getElementById("direccion");

formElement.onsubmit = function (e) {
  e.preventDefault();

  let params = {
    nombre: "Gregorio",
    apellido: "Benitez",
    telefono: "0971779365",
    email: "alfonhec@gmail.com",
    direccion:"las perlas 123"
  };
  axios
    .post("http://localhost:3005/mascota/solicitar-servicio/", params, {
      headers: {}
    })
    .then((response) => {
      console.log(response);
    })
    .catch((error) => {
      console.warn(error);
    });
};