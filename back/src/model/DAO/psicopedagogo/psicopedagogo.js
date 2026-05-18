/*****************************************************************************
 * Objetivo: Arquivo responsável pela integração pelo CRUD de dados do MySQL de Psicopedagogo
 * Data: 29/04/2026
 * Autores: Nicolas dos Santos 
 * Versão: 1.0
 ******************************************************************************/

const db = require("../../../database/db")

const getPsychopedagogueById = async function(id) {
    try {
        const result = await db.raw(
            'SELECT * FROM tb_psicopedagogo WHERE id = ?',
            [id]
        )

        if(Array.isArray(result[0]) && result[0].length > 0)
            return result[0]
        else
            return false
    } catch (error) {
        return false
    }
}

const getPsychopedagogueHomeById = async function(id) {
    try {
        await db.raw('SET @resposta = NULL')
        await db.raw('CALL prc_buscar_psicopedagogo_home(?, @resposta)', [id])
        const result = await db.raw('SELECT @resposta as resposta')

        return JSON.parse(result[0][0].resposta)
    } catch (error) {
        return false
    }
}

const getPsychopedagogueByEmailAndPassword = async function(email, password) {
    try {
        await db.raw('SET @resposta = NULL')
        await db.raw('CALL prc_login_psicopedagogo(?, ?, @resposta)', [email, password])
        const result = await db.raw('SELECT @resposta AS resposta')

        const resposta = result[0][0].resposta

        if(!resposta){
            return null
        }

        return typeof resposta === "string" ? JSON.parse(resposta) : resposta
    } catch (error) {
        return null
    }
}

const setInsertPsychopedagogue = async function(photo, name, birthDate, telephone, email, password) {
    try {
        await db.raw('SET @msg = NULL')
        await db.raw('CALL procedure_adicionar_psicopedagogo(?, ?, ?, ?, ?, ?, @msg)', [photo, name, birthDate, telephone, email, password])
        const result = await db.raw('SELECT @msg AS resposta')

        const resposta = result[0][0].resposta

        return typeof resposta === "string" ? JSON.parse(resposta) : resposta
    } catch (error) {
        return false
    }
}

const setUpdatePsychopedagogue = async function(id, photo, name, birthDate, telephone) {
    try {
        await db.raw('SET @resposta = NULL')
        await db.raw('CALL prc_atualizar_psicopedagogo(?, ?, ?, ?, ?, @resposta)', [id, photo, name, birthDate, telephone])
        const result = await db.raw('SELECT @resposta as resposta')

        const resposta = result[0][0].resposta

        return typeof resposta === "string" ? JSON.parse(resposta) : resposta
    } catch (error) {
        console.log(error)
        return false
    }
}

const setUpdatePasswordPsychopedagogue = async function(id, email, newPassword) {
    try {
        await db.raw('SET @resposta = NULL')
        await db.raw('CALL prc_atualizar_senha_psicopedagogo(?, ?, ?, @resposta)', [id, email, newPassword])
        const result = await db.raw('SELECT @resposta AS resposta')

        const resposta = result[0][0].resposta

        return typeof resposta === "string" ? JSON.parse(resposta) : resposta
    } catch (error) {
        console.log(error)
        return false
    }
}

const setDeletePsychopedagogue = async function(id) {
    try {
        await db.raw('SET SQL_SAFE_UPDATES = 0')
        await db.raw('SET @resposta = NULL')
        await db.raw('CALL prc_delete_psicopedagogo(?, @resposta)', [id])
        const result = await db.raw('SELECT @resposta AS resposta')

        const resposta = result[0][0].resposta

        return typeof resposta === "string" ? JSON.parse(resposta) : resposta
    } catch (error) {
        console.log(error)
        return false
    }
}

module.exports = {
    getPsychopedagogueById,
    getPsychopedagogueHomeById,
    getPsychopedagogueByEmailAndPassword,
    setInsertPsychopedagogue,
    setUpdatePsychopedagogue,
    setUpdatePasswordPsychopedagogue,
    setDeletePsychopedagogue
}