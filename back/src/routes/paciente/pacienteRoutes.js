/********************************************************************************
 * Objetivo: Arquivo responsável pelas rotas de Endpoints de Paciente
 * Data: 30/04/2026
 * Autores: Enzo Carrilho
 * Versão: 1.0
 ********************************************************************************/

const express =         require('express')
const router =          express.Router()
const cors =            require('cors')
const bodyParser =      require('body-parser')

const bodyParserJSON = bodyParser.json() 

const controllerPaciente = require('../../controller/paciente/controllerPaciente.js')

router.get("/:id", async(req, res) => {
    const id = req.params.id
    
    let result = await controllerPaciente.getPatientById(id)

    if(result.status_code)
        res.status(result.status_code).json(result)
    else
        res.status(200).json(result)
})    

router.get("/", async(req, res) => {
    const registNumber = req.query.regist_number
    
    let result = await controllerPaciente.getPatientByRegistNumber(registNumber)


    if(result.status_code)
        res.status(result.status_code).json(result)
    else
        res.status(200).json(result)
    
})  

router.post("/", cors(), bodyParserJSON, async(req, res) => {

    let result

    if(req.query.id_paciente && req.query.id_psicopedagogo){

        const patientID = req.query.id_paciente
        const psicopedagogoID = req.query.id_psicopedagogo

        result = await controllerPaciente.setPatientPsychopedagogue(patientID, psicopedagogoID)

    }else if(req.query.id_paciente && req.query.id_responsavel){

        const patientID = req.query.id_paciente
        const responsableID = req.query.id_responsavel

        result = await controllerPaciente.setPatientResponsable(patientID, responsableID)

    }else{

        let dataBody = req.body
        let contentType = req.headers['content-type']

         result = await controllerPaciente.setPatient(dataBody, contentType)
    }


    if(result.status_code)
        res.status(result.status_code).json(result)
    else
        res.status(200).json(result)
    
}) 

router.put("/:id", cors(), bodyParserJSON, async(req, res) => {
    let patientID = req.params.id
    let dataBody = req.body
    let contentType = req.headers['content-type']

    let result = await controllerPaciente.setUpdatePatient(dataBody, patientID, contentType)

    if(result.status_code)
        res.status(result.status_code).json(result)
    else
        res.status(200).json(result)
    
})

router.delete("/:id", async(req, res) => {
    const id = req.params.id
    
    let result = await controllerPaciente.setDeletePatient(id)

    res.status(result.status_code).json(result)
        
}) 


module.exports = router