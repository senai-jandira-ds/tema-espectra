/********************************************************************************
 * Objetivo: Arquivo responsável pelas rotas de Endpoints de Psicopedagogo
 * Data: 30/04/2026
 * Autores: Nicolas dos Santos
 * Versão: 1.0
 ********************************************************************************/

const express = require("express")
const router = express.Router()
const controllerPsicopedagogo = require("../../controller/psicopedagogo/controllerPsicopedagogo.js")

router.get("/:id", async(req, res) => {
    const id = req.params.id
    let result = await controllerPsicopedagogo.listarPsicopedagogoPorId(id)
    res.status(result.status_code).json(result)
})

router.get("/home/:id", async(req, res) => {
    const id = req.params.id
    let result = await controllerPsicopedagogo.listarHomePsicopedagogoPorId(id)
    res.status(result.status_code).json(result)
})

router.get("/email/:email/senha/:password", async(req, res) => {
    const email = req.params.email
    const password = req.params.password
    let result = await controllerPsicopedagogo.loginEmailSenhaPsicopedagogo(email, password)
    res.status(result.status_code).json(result)
})

router.post("/", async(req, res) => {
    const {photo, name, birthDate, telephone, email, password} = req.body
    let result = await controllerPsicopedagogo.inserirPsicopedagogo(photo, name, birthDate, telephone, email, password)
    res.status(result.status_code).json(result)
})

router.put("/:id", async(req, res) => {
    const {photo, name, birthDate, telephone} = req.body
    const id = req.params.id
    let result = await controllerPsicopedagogo.atualizarPsicopedagogo(id, photo, name, birthDate, telephone)
    res.status(result.status_code).json(result)
})

router.put("/:id/senha/:password", async(req, res) => {
    const {email, newPassword} = req.body
    const id = req.params.id
    let result = await controllerPsicopedagogo.atualizarSenhaPsicopedagogo(id, email, newPassword)
    res.status(result.status_code).json(result)
})

router.delete("/:id", async(req, res) => {
    const id = req.params.id
    let result = await controllerPsicopedagogo.deletarPsicopedagogo(id)
    res.status(result.status_code).json(result)
})

module.exports = router