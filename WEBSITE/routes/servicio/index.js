var express = require('express');
var cors = require('cors');
var router = express.Router();
const axios = require('axios');

const jwt = require('express-jwt')

var PropertiesReader = require('properties-reader');

const db = require('../../db');

var _ = require('lodash');

const Router = require('express-promise-router')
const {
  Pool,
  Client
} = require('pg');



router.get('/test',cors(), async (req, res, next) => {
  console.log("test")
  const client = new Client({
    user: 'postgres',
    host: 'localhost',
    database: 'mascotas',
    password: 'PENTEST',
    port: 5432,
  })
  client.connect()
  client.query('SELECT NOW()', (err, res) => {
    console.log(err, res)
    client.end()
    return res;
  })

  return "";
});

//Solicitar servicio a una mascota
router.post('/solicitar-servicio',cors(),async(req,res,next)=>{
  console.log("Nueva solicitud")
  var result={};
  console.log("params", req.body);

  var mascota=req.body;
  result= await db.solicitarServicio(servicio);

  if(result.rows){
      res.send(result.rows[0]);
  }else{
      res.send("No se pudo insertar");
  }

});



module.exports = router;
