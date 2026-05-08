/********************************************************************************
 * Objetivo: Arquivo responsável pelas rotas de Endpoints de Formulário
 * Data: 06/05/2026
 * Autores: Nicolas dos Santos
 * Versão: 1.0
 ********************************************************************************/

const express = require("express")
const router =  express.Router()
const controllerFormulario = require("../../controller/formulario/controllerFormulario.js")

router.get("/:id", async(req, res) => {
    const id = req.params.id
    let result = await controllerFormulario.listarFormularioPorPacienteId(id)
    res.status(result.status_code).json(result)
})

router.get("/:id/:resposta", async(req, res) => {
    const id = req.params.id
    const resposta = req.params.resposta
    let result = await controllerFormulario.listarRespostasFormularioPorPacienteId(id, resposta)
    res.status(result.status_code).json(result)
})

router.put("/:id", async(req, res) => {
    const idForm = req.params.id
    const {idActivityPortage, idResponse} = req.body
    let result = await controllerFormulario.atualizarRespostasFormulario(idForm, idActivityPortage, idResponse)
    res.status(result.status_code).json(result)
})

module.exports = router