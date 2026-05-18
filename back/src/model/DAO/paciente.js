/****************************************************************************************
 * Objetivo: Arquivo responsável pela conexão ao banco de dados para o CRUD de Paciente
 * Espectra
 * Data: 30/04/2026
 * Developer: Enzo Carrilho e Nicolas dos Santos
 * Versão: 1.0.0
 ***************************************************************************************/


const db = require("../../database/db.js")

// Retorna dados do Paciente pelo ID
const selectPatientById = async function(id){
    try {

        // Chama a procedure do BD
        await db.raw('CALL prc_buscar_paciente_completo(?, @msg)', [id])
        
        // faz o SELECT no OUT (@msg) da Procedure
        const [result] = await db.raw('SELECT @msg as msg')

        // armazerna a mensagem do resultado
        const message = result[0].msg

        // A mensagem está vindo como String, aqui estou validando o tipo da mensagem e convertendo para JSON
        const parsedMessage = typeof(message) === "string" ? JSON.parse(message) : message
       
        // Valida o status da mensagem
        if(parsedMessage)
            return parsedMessage
        else 
            return false

    } catch (error) {
        return false
    }
}

// Retorna dados do Paciente pelo Número de Registro
const selectPatientByRegistNumber = async function(registNumber){
    try {
        const result = await db('tb_paciente').where('numero_registro', '=', registNumber).select('*')
        
        if(Array.isArray(result))
            return result
        else
            return false

    } catch (error) {
        return false
    }

}

// Insere um novo Paciente no BD
const insertPatient = async function(patient){
    try {

        await db.raw(
            'CALL prc_adicionar_paciente(?, ?, ?, ?, ?, ?, ?, @msg)', 
            [
                patient.nome, 
                patient.foto, 
                patient.data_nascimento, 
                patient.diagnostico, 
                patient.id_serie_escolar, 
                patient.id_grau_suporte, 
                patient.id_responsavel
            ]
        )

        const [result] = await db.raw('SELECT @msg as msg')

        const message = result[0].msg

        const parsedMessage = typeof message === "string" ? JSON.parse(message) : message

        if(parsedMessage)
            return parsedMessage
        else
            return false

    } catch (error) {
        return false
    }
}

// Insere um novo Psicopedagogo para um Paciente
const insertPatientPsychopedagogue = async function(idPatient, idPsychopedagogue) {
    try{

        await db.raw('CALL prc_inserir_relacao_psicopedagogo_paciente(?, ?, @msg)', [idPatient, idPsychopedagogue])

        const [result] = await db.raw('SELECT @msg as msg')

        const message = result[0].msg

        const parsedMessage = typeof message === "string" ? JSON.parse(message) : message

        if(parsedMessage)
            return parsedMessage
        else
            return false

    } catch(error){ 
        return false
    }    
    
}

// Insere uma nova relação de Paciente e Responsável
const insertPatientResponsable = async function(idPatient, idResponsable){
    try {
        await db.raw('CALL prc_inserir_relacao_responsavel_paciente(?, ?, @msg)', [idPatient, idResponsable])

        const [result] = await db.raw('SELECT @msg as msg')

        const message = result[0].msg

        const parsedMessage = typeof message === "string" ? JSON.parse(message) : message
        
        if(parsedMessage)
            return parsedMessage
        else
            return false
        
    } catch (error) {
        return false
    }
}

// Atualiza dados do Paciente no BD
const updatePatient = async function(patient){
    try {
        await db.raw(
            'CALL prc_atualizar_paciente(?, ?, ?, ?, ?, ?, ?, @msg)', 
            [
                patient.id,
                patient.nome, 
                patient.foto, 
                patient.data_nascimento, 
                patient.diagnostico, 
                patient.id_serie_escolar, 
                patient.id_grau_suporte, 
            ]
        )
        const [result] = await db.raw('SELECT @msg as msg')

        const message = result[0].msg

        const parsedMessage = typeof message === "string" ? JSON.parse(message) : message

        if(parsedMessage)
            return parsedMessage
        else
            return false

    } catch (error) {
        return false
    }
}

// Exclui um Paciente/Familiar do BD
const deletePatiente = async function(id) {
    try{
        await db.raw('CALL proc_delete_familiar(?, @msg)', [id])

        const [result] = await db.raw('SELECT @msg as msg')

        const message = result[0].msg

        const parsedMessage = typeof message === "string" ? JSON.parse(message) : message
        console.log(parsedMessage)

        if(parsedMessage)
            return parsedMessage
        else
            return false

    }catch(error){
        return false
    }

}


module.exports = {
    selectPatientById,
    selectPatientByRegistNumber,
    insertPatient,
    insertPatientPsychopedagogue,
    insertPatientResponsable,
    updatePatient,
    deletePatiente
}