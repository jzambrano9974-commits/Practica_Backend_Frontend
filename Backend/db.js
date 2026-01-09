import pkg from 'pg';
import dotenv from 'dotenv';
dotenv.config();

const { Pool } = pkg;

export const pool = new Pool({
  // Le decimos que use la variable MAESTRA que pusimos en Render
  connectionString: process.env.DATABASE_URL, 
  
  // ESTO ES OBLIGATORIO para conectarse a Supabase desde la nube
  ssl: {
    rejectUnauthorized: false
  }
});