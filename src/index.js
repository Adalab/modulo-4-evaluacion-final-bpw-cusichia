//CONFIGURAR EL SERVIDOR

import express from "express";
import cors from "cors";
import mysql from "mysql2/promise";
import dotenv from "dotenv";
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
});

//conexión con la BD (MySQL) es ASÍNCRONA (async/await). aqui es donde incluimos las variables de entorno
const getConnection = async () => {
	const connection = await mysql.createConnection({
		host: process.env.DB_HOST,
		user: process.env.DB_USER,
		password: process.env.DB_PASSWORD,
		database: process.env.DB_NAME,
		port: process.env.DB_PORT,
	});
	return connection;
};

//ENDPOINTS

// POST /frases - Insertar una nueva frase
server.post("/frases", async (req, res) => {
	const { texto, marca_tiempo, descripcion } = req.body;

	try {
		const connection = await getConnection();
		let myquery =
			"INSERT INTO frases (texto, marca_tiempo, descripcion) VALUES (?, ?, ?)";
		const [results] = await connection.query(myquery, [
			texto,
			marca_tiempo,
			descripcion,
		]);
		await connection.end();
		res.status(200).json({
			message: "Frase insertada correctamente",
			id: results.insertId,
		});
	} catch (error) {
		res.status(500).json({
			error: "Error al insertar la frase",
		});
	}
});

// GET /frases - Listar todas las frases (con información del personaje y el título del capítulo)
server.get("/frases", async (req, res) => {
	try {
		const connection = await getConnection();
		let myquery =
			"SELECT texto, capitulos.titulo, personajes.nombre, personajes.apellido FROM frases INNER JOIN frases_capitulos_personajes fcp ON fcp.frases_id = frases.id INNER JOIN capitulos ON fcp.capitulos_id = capitulos.id INNER JOIN personajes ON fcp.personajes_id = personajes.id";
		const [results] = await connection.query(myquery);
		await connection.end();
		res.status(200).json({
			info: { count: results.length },
			frases: results,
		});
	} catch (error) {
		res.status(500).json({
			error: "Error al listar las frases",
		});
	}
});

//GET /frases/:id - Obtener una frase específica
server.get("/frases/:id", async (req, res) => {
	try {
		const connection = await getConnection();
		const id = req.params.id;
		let myquery = "SELECT * FROM frases WHERE id = ?";
		const [results] = await connection.query(myquery, [id]);
		await connection.end();
		res.status(200).json({
			info: "Frase encontrada",
			frase: results[0],
		});
	} catch (error) {
		res.status(500).json({
			error: "Error al encontrar la frase",
		});
	}
});

// PUT /frases/:id - Actualizar una frase existente
server.put("/frases/:id", async (req, res) => {
	const id = req.params.id;
	// enviar datos por el body -->
	const { texto, marca_tiempo, descripcion } = req.body;

	try {
		const connection = await getConnection();
		let myquery =
			"UPDATE frases SET texto = ?, marca_tiempo = ?, descripcion = ? WHERE id = ?";
		const [results] = await connection.query(myquery, [
			texto,
			marca_tiempo,
			descripcion,
			id,
		]);
		await connection.end();
		res.status(200).json({
			info: "Frase actualiada correctamente",
			frase: results[0],
		});
	} catch (error) {
		res.status(500).json({
			error: "Error al actualizar la frase",
		});
	}
});

// DELETE /frases/:id - Eliminar una frase
server.delete("/frases/:id", async (req, res) => {
	const id = req.params.id;

	try {
		const connection = await getConnection();
		const myquery = "DELETE FROM frases WHERE id = ?"; //HAY QUE BORRAR LAS RELACIONES? 
		const [results] = await connection.query(myquery, [id]);
		await connection.end();

		res.status(200).json({
			info: "Frase eliminada correctamente",
			idEliminado: id,
		});
	} catch (error) {
		console.error("Error al eliminar la frase:", error);
		res.status(500).json({
			error: "Error interno al eliminar la frase",
		});
	}
});


// ENDPOINTS ADICIONALES RECOMENDADOS

// GET /frases/personaje/:personaje_id  - Obtener todas las frases de un personaje específico
server.get("/frases/personaje/:personaje_id", async (req, res) => {
    const id = req.params.personaje_id;
	
    try {
		const connection = await getConnection();
		let myquery = "SELECT texto, personajes.nombre, personajes.apellido FROM frases INNER JOIN frases_capitulos_personajes fcp ON frases.id = fcp.frases_id INNER JOIN personajes ON fcp.personajes_id = personajes.id WHERE personajes.id = ?";
		const [results] = await connection.query(myquery, [id]);
		await connection.end();

		res.status(200).json({
			info: { count: results.length },
			frases: results,
		});
	} catch (error) {
		res.status(500).json({
			error: "error al listar las frases del personaje",
		});
	}
});

// GET /frases/capitulo/:capitulo_id - Obtener todas las frases de un capítulo específico
server.get("/frases/capitulo/:capitulo_id", async (req, res) => {
    const id = req.params.capitulo_id;
	
    try {
		const connection = await getConnection();
		let myquery = "SELECT texto, capitulos.titulo, capitulos.numero_episodio, capitulos.temporada FROM frases INNER JOIN frases_capitulos_personajes fcp ON frases.id = fcp.frases_id INNER JOIN capitulos ON fcp.capitulos_id = capitulos.id WHERE capitulos.id = ?";
		const [results] = await connection.query(myquery, [id]);
		await connection.end();

		res.status(200).json({
			info: { count: results.length },
			frases: results,
		});
	} catch (error) {
		res.status(500).json({
			error: "error al listar la/s frase/s del capítulo",
		});
	}
});

// GET /personajes - Listar todos los personajes
server.get("/personajes", async (req, res) => {
    try {
        const connection = await getConnection();
        let myquery = "SELECT * FROM personajes";
        const [results] = await connection.query(myquery);
        await connection.end();
        res.status(200).json({
            info: { count: results.length },
            personajes: results,
        });
    } catch (error) {
        res.status(500).json({
            error: "Error al listar los personajes",
        });
    }
});


// GET /capitulos - Listar todos los capítulos
server.get("/capitulos", async (req, res) => {
    try {
        const connection = await getConnection();
        let myquery = "SELECT * FROM capitulos";
        const [results] = await connection.query(myquery);
        await connection.end();
        res.status(200).json({
            info: { count: results.length },
            personajes: results,
        });
    } catch (error) {
        res.status(500).json({
            error: "Error al listar los capitulos",
        });
    }
});

