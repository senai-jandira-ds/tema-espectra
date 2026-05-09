const usuario                 = require('./usuario')
const paciente                = require('./paciente')
const atividade               = require('./atividade')
const atividade_personalizada = require('./atividade_personalizada')
const atividade_portage       = require('./atividade_portage')
const tentativa               = require('./tentativa')
const formulario              = require('./formulario')

module.exports = {
    ...usuario,
    ...paciente,
    ...formulario,
    ...atividade,
    ...atividade_personalizada,
    ...atividade_portage,
    ...tentativa
}