/**********************************************************************
 * Objetivo: Arquivo responsável pela conexão do Knex com o Banco de Dados
 * Espectra
 * Data: 27/04/2026
 * Developer: Nicolas dos Santos
 * Versão: 1.0.0
 *********************************************************************/

const knex = require('knex')
const config = require('../../knexfile')

const db = knex(config.development)

module.exports = db