/*****************************************************************************
 * Objetivo: Arquivo responsável pela integração pelo CRUD de dados do MySQL de Formulário
 * Data: 06/05/2026
 * Autores: Nicolas dos Santos 
 * Versão: 1.0
 ******************************************************************************/

const db = require("../../../database/db")

const getFormByIdPatient = async function(id) {
    try {
        const result = await db.raw(
            'SELECT * FROM vw_formulario_paciente_id WHERE id_paciente = ?', [id]
        )

        return result[0][0] || false
    } catch (error) {
        console.log(error)
        return false
    }
}

const getResponseFormByFilter = async function(id, resposta) {
    try {
        let sql = `SELECT * FROM vw_resposta_formulario_paciente_id WHERE id_paciente = ?`
        let params = [id]

        if(resposta === 'null'){
            sql += ` AND resposta IS NULL`
        } else {
            sql += ` AND resposta = ?`
            params.push(resposta)
        }

        const result = await db.raw(sql, params)

        if(Array.isArray(result[0]) && result[0].length > 0)
            return result[0]
        else
            return false
    } catch (error) {
        console.log(error)
        return false
    }
} 

const setUpdateResponseForm = async function(idForm, idActivityPortage, idResponse) {
    try {
        await db.raw('SET @resposta = NULL')
        await db.raw('CALL prc_atualizar_respostas_formulario(?, ?, ?, @resposta)', [idForm, idActivityPortage, idResponse])
        const result = await db.raw('SELECT @resposta AS resposta')

        const resposta = result[0][0].resposta

        return typeof resposta === "string" ? JSON.parse(resposta) : resposta
    } catch (error) {
        console.log(error)
        return false
    }
}

module.exports = {
    getFormByIdPatient,
    getResponseFormByFilter,
    setUpdateResponseForm
}