/**********************************************************************
 * Objetivo: Arquivo responsável pela configuração da ferramenta Knex
 * Espectra
 * Data: 27/04/2026
 * Developer: Nicolas dos Santos
 * Versão: 1.0.0
 *********************************************************************/

module.exports = {
  development: {
    client: 'mysql2',
    connection: {
      host: '127.0.0.1',
      user: 'root',
      password: '12345678', 
      database: 'db_espectra'
    }
  }
};
