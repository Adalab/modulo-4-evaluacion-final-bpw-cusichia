
//CONFIGURAR EL SERVIDOR

import express from 'express'; 
import cors from 'cors'; 
import mysql from 'mysql2/promise';
import dotenv from 'dotenv'; 
dotenv.config();
// import bcrypt from 'bcrypt';
// import jwt from 'jsonwebtoken';

const server = express(); 
const port = 4000; 

server.use(express.json()); 
server.use(cors()); 

//escuchar el puerto
server.listen(port, () => {
    console.log(`Servidor escuchando por http://localhost:${port}`);
})

//conexión con la BD (MySQL) es ASÍNCRONA (async/await). aqui es donde incluimos las variables de entorno
const getConnection = async () => {
    const connection = await mysql.createConnection({
        host: process.env.DB_HOST,
        user: process.env.DB_USER,
        password: process.env.DB_PASSWORD,
        database: process.env.DB_NAME,
        port: process.env.DB_PORT
    })
    return connection;
}



//ENDPOINTS
server.get("/simponsFrases", async (req, res) => {

    const connection = await getConnection();
    const [results] = await connection.query("SELECT * FROM frases");
    await connection.end();

    res.json({
        info: {"count": results.length},
        results: results
    });
})


// POST /frases - Insertar una nueva frase
server.post("/frases", async (req, res) => {

    const connection = await getConnection();

})

