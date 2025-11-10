const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors");
const imageRoutes = require("./routes/imageRoutes");

require("dotenv").config();

const app = express();
app.use(express.json());
app.use(cors());

app.use('/', imageRoutes);

const PORT = process.env.PORT || 3001; // usar porta diferente da 3000 (servidor MySQL)

// Conexão com o MongoDB e inicializa servidor somente após conectar
async function start() {
	try {
		await mongoose.connect(process.env.MONGO_URI, {
			useNewUrlParser: true,
			useUnifiedTopology: true,
		});
		console.log("Conectado ao MongoDB");

		app.listen(PORT, () =>
			console.log(`Servidor rodando em http://localhost:${PORT}`),
		);
	} catch (err) {
		console.error("MongoDB erro de conexão:", err);
		process.exit(1);
	}
}
start();
