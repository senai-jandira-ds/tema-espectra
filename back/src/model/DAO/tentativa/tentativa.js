/*****************************************************************************
 * Objetivo: Arquivo responsável pela integração pelo CRUD de dados do MySQL de Tentativa
 * Data: 07/05/2026
 * Autores: Nicolas dos Santos 
 * Versão: 1.0
 ******************************************************************************/

const db = require("../../../database/db.js")

const getAttemptById = async function(id) {
    try {
        const result = await db.raw(
            'SELECT * FROM vw_tentativa_id WHERE id_tentativa = ?', [id]
        )

        return result [0][0] || false
    } catch (error) {
        console.log(error)
        return false
    }
}

const getAttemptByActivityId = async function(id) {
    try {
        
    } catch (error) {
        
    }
}

//getAttemptById(17).then(result => console.log(result))

module.exports = {
    getAttemptById
}