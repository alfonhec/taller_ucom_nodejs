function listaVentas() {
    axios
      .get("http://localhost:3005/mascota/obtener-lista-ventas", {
        params: {
        },
        responseType: "json"
      })
      .then(function (res) {
        //cuando obtenemos una respuesta satisfactoria del lado del servidor
        //la peticion se proceso correctamente
  
        console.log("lista de ventas")
        console.log(res);
        console.log("cantidad: " + res.data.length);

        //Agregamos el resultado a nuestra tabla html
        res.data.forEach(function (value, index) {
            console.log("ingreso en el forEach")
            console.log("fila: ", value, " indice: " + index);
      
            // Agregamos las filas
            var row = tabla.insertRow(index + 1);
          
            //Agregamos las columnas de la fila
            var cell1 = row.insertCell(0);
            var cell2 = row.insertCell(1);
            var cell3 = row.insertCell(2);
            var cell4 = row.insertCell(3);
            var cell5 = row.insertCell(4);
            var cell6 = row.insertCell(5);
            var cell7 = row.insertCell(6);

        
            // Agregamos a la celda los valores que obtenemos de la lista 
            cell1.innerHTML = "" + value.id_venta;
            cell2.innerHTML = "" + value.fecha_venta;
            cell3.innerHTML = "" + value.nombre;
            cell4.innerHTML = "" + value.apellido;
            cell5.innerHTML = "" + value.descripcion;
            cell6.innerHTML = "" + value.monto_total;
            cell7.innerHTML = "" + value.nro_factura;
          });

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
  }
  
  var tabla = document.getElementById("tblListaVentas");


  function addHeader() {
    var table = document.getElementById("tblListaVentas");
    var head = document.createElement("THEAD");
    var column = document.createElement("TH");
  
    column.innerHTML = "ID";
    head.appendChild(column);
    table.appendChild(head);
  
    column = document.createElement("TH");
    column.innerHTML = "NOMBRE";
    head.appendChild(column);
    table.appendChild(head);
  
    column = document.createElement("Fecha");
  
    column.innerHTML = "Nombre";
    head.appendChild(column);
    table.appendChild(head);
  
    column = document.createElement("Apellido");
  
    column.innerHTML = "Descripcion";
    head.appendChild(column);
    table.appendChild(head);

    column.innerHTML = "Monto Total";
    head.appendChild(column);
    table.appendChild(head);

    column.innerHTML = "Nro. Factura";
    head.appendChild(column);
    table.appendChild(head);
  

  }

  //Ejecutamos la función lista de ventas

  listaVentas();
  