/********************************************************************************
 * Objetivo: Arquivo responsável pela manipulação de dados entre App e a Model do Psicopedagogo
 * Data: 29/04/2026
 * Autores: Nicolas dos Santos
 * Versão: 1.0
 ********************************************************************************/

const psicopedagogoDAO = require("../../model/DAO//psicopedagogo/psicopedagogo.js")
const defaultMessages = require("../modulo/defaultMessages.js")

const listarPsicopedagogoPorId = async function(id) {
    let MESSAGES = JSON.parse(JSON.stringify(defaultMessages))

    try {
        if(!isNaN(id) && id > 0){
            let result = await psicopedagogoDAO.getPsychopedagogueById(id)

            if(result && result.length > 0){
                MESSAGES.defaultHeader.status = MESSAGES.successRequest.status
                MESSAGES.defaultHeader.status_code = MESSAGES.successRequest.status_code
                MESSAGES.defaultHeader.itens.psicopedagogo = result[0]
                return MESSAGES.defaultHeader
            }

            return MESSAGES.errorNotFound
        }

        MESSAGES.errorRequiredFields.message += "{Id inválido!}"
        return MESSAGES.errorRequiredFields
    } catch (error) {
        return MESSAGES.errorInternalServerController
    }
}

const listarHomePsicopedagogoPorId = async function(id) {
    let MESSAGES = JSON.parse(JSON.stringify(defaultMessages))

    try {
        if(!isNaN(id) && id > 0){
            return await psicopedagogoDAO.getPsychopedagogueHomeById(id)
        }

        MESSAGES.errorRequiredFields.message += "{Id inválido!}"
        return MESSAGES.errorRequiredFields
    } catch (error) {
        return MESSAGES.errorInternalServerController
    }
}

const loginEmailSenhaPsicopedagogo = async function(email, password) {
    try {
        if(typeof email === "string" && email.trim() !== "" && email.length <= 255 && 

            typeof password === "string" && password.trim() !== "" && password.length <= 150
        ){
            return await psicopedagogoDAO.getPsychopedagogueByEmailAndPassword(email, password)
        }
        
        return defaultMessages.errorRequiredFields
    } catch (error) {
        return defaultMessages.errorInternalServerController
    }
}

const inserirPsicopedagogo = async function(photo, name, birthDate, telephone, email, password) {
    try {
        if(
            typeof photo === "string" && photo.trim() !== "" && photo.length <= 255 &&
            typeof name === "string" && name.trim() !== "" && name.length <= 150 &&
            typeof birthDate === "string" && birthDate.trim() !== "" &&
            typeof telephone === "string" && telephone.trim() !== "" && telephone.length <= 20 &&
            typeof email === "string" && email.trim() !== "" && email.length <= 255 && 
            typeof password === "string" && password.trim() !== "" && password.length <= 150
    ){
        return await psicopedagogoDAO.setInsertPsychopedagogue(photo, name, birthDate, telephone, email, password)
    }

    return defaultMessages.errorRequiredFields
    } catch (error) {
        return defaultMessages.errorInternalServerController
    }
}

const atualizarPsicopedagogo = async function(id, photo, name, birthDate, telephone) {
    try {
        if(
            typeof id && !isNaN(id) && Number(id) > 0 &&
            typeof photo === "string" && photo.trim() !== "" && photo.length <= 255 &&
            typeof name === "string" && name.trim() !== "" && name.length <= 150 &&
            typeof birthDate === "string" && birthDate.trim() !== "" &&
            typeof telephone === "string" && telephone.trim() !== "" && telephone.length <= 20
        ){
            return await psicopedagogoDAO.setUpdatePsychopedagogue(id, photo, name, birthDate, telephone)
        }

        return defaultMessages.errorRequiredFields
    } catch (error) {
        return defaultMessages.errorInternalServerController
    }
}

const atualizarSenhaPsicopedagogo = async function(id, email, newPassword) {
    try {
        if(
            typeof id && !isNaN(id) && Number(id) > 0 &&
            typeof email === "string" && email.trim() !== "" && email.length <= 255 && 
            typeof newPassword === "string" && newPassword.trim() !== "" && newPassword.length <= 150
        ){
            return await psicopedagogoDAO.setUpdatePasswordPsychopedagogue(id, email, newPassword)
        }

        return defaultMessages.errorRequiredFields
    } catch (error) {
        return defaultMessages.errorInternalServerController
    }
}

const deletarPsicopedagogo = async function(id) {
    try {
        if(
            typeof id && !isNaN(id) && Number(id) > 0
        ){
            return await psicopedagogoDAO.setDeletePsychopedagogue(id)
        }

        return defaultMessages.errorRequiredFields
    } catch (error) {
        return defaultMessages.errorInternalServerController
    }
}

module.exports = {
    listarPsicopedagogoPorId,
    listarHomePsicopedagogoPorId,
    loginEmailSenhaPsicopedagogo,
    inserirPsicopedagogo,
    atualizarPsicopedagogo,
    atualizarSenhaPsicopedagogo,
    deletarPsicopedagogo
}