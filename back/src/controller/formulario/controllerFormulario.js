/********************************************************************************
 * Objetivo: Arquivo responsável pela manipulação de dados entre App e a Model do Formulário
 * Data: 06/05/2026
 * Autores: Nicolas dos Santos
 * Versão: 1.0
 ********************************************************************************/

const formularioDAO = require("../../model/DAO/formulario/formulario.js")
const defaultMessages = require("../modulo/defaultMessages.js")

const listarFormularioPorPacienteId = async function(id) {
    let MESSAGES = JSON.parse(JSON.stringify(defaultMessages))
    
    try {
        if(!isNaN(id) && Number(id) > 0){
            let result = await formularioDAO.getFormByIdPatient(id)

            if(result){
                MESSAGES.defaultHeader.status = MESSAGES.successRequest.status
                MESSAGES.defaultHeader.status_code = MESSAGES.successRequest.status_code
                MESSAGES.defaultHeader.itens.formulario = {
                    id_paciente: result.paciente_id,
                    questoes: result.questoes
                }

                return MESSAGES.defaultHeader
            }

            return MESSAGES.errorNotFound
        }

        MESSAGES.errorRequiredFields.message += "{Id inválido!}"
        return MESSAGES.errorRequiredFields

    } catch (error) {
        console.log(error)
        return MESSAGES.errorInternalServerController
    }
}

const listarRespostasFormularioPorPacienteId = async function(id, resposta) {
    let MESSAGES = JSON.parse(JSON.stringify(defaultMessages))

    try {
        if(!isNaN(id) && Number(id) > 0 &&
            typeof resposta === "string" && resposta.trim() !== "" && resposta.length <= 20
        ){
            let result = await formularioDAO.getResponseFormByFilter(id, resposta)

            if(result){
                MESSAGES.defaultHeader.status = MESSAGES.successRequest.status
                MESSAGES.defaultHeader.status_code = MESSAGES.successRequest.status_code
                MESSAGES.defaultHeader.itens.formulario = result

                return MESSAGES.defaultHeader
            }

            return MESSAGES.errorNotFound
        }

        return MESSAGES.errorRequiredFields
    } catch (error) {
        console.log(error)
        return MESSAGES.errorInternalServerController
    }
}

const atualizarRespostasFormulario = async function(idForm, idActivityPortage, idResponse) {
    let MESSAGES = JSON.parse(JSON.stringify(defaultMessages))

    try {
        if(!isNaN(idForm) && Number(idForm) > 0 &&
            !isNaN(idActivityPortage) && Number(idActivityPortage) > 0 &&
            !isNaN(idResponse) && Number(idResponse) > 0
        ){
            let result = await formularioDAO.setUpdateResponseForm(idForm, idActivityPortage, idResponse)

            if(result){
                MESSAGES.defaultHeader.status = MESSAGES.successRequest.status
                MESSAGES.defaultHeader.status_code = MESSAGES.successRequest.status_code
                MESSAGES.defaultHeader.itens.formulario = result

                return MESSAGES.defaultHeader
            }

            return MESSAGES.errorNotFound
        }

        return MESSAGES.errorRequiredFields
    } catch (error) {
        console.log(error)
        return MESSAGES.errorInternalServerController
    }
}

module.exports = {
    listarFormularioPorPacienteId,
    listarRespostasFormularioPorPacienteId,
    atualizarRespostasFormulario
}
