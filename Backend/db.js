import pkg from 'pg';
import dotenv from 'dotenv'; // 1. Importamos la librería que lee secretos

dotenv.config(); // 2. Cargamos los datos del archivo .env

const { Pool } = pkg;

export const pool = new Pool({
  // 3. Ya no ponemos "juanzambrano", sino que le decimos:
  // "Busca en el archivo .env la variable DB_USER"
  user: process.env.DB_USER,      
  host: process.env.DB_HOST,
  database: process.env.DB_NAME, 
  password: process.env.DB_PASSWORD,   
  port: process.env.DB_PORT,
});