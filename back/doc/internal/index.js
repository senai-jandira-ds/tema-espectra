const psicopedagogo           = require('./psicopedagogo')
const paciente                = require('./paciente')
const reponsavel              = require('./responsavel')
const atividade               = require('./atividade')
const atividade_personalizada = require('./atividade_personalizada')
const atividade_portage       = require('./atividade_portage')
const tentativa               = require('./tentativa')
const formulario              = require('./formulario')

module.exports = {
    ...psicopedagogo,
    ...reponsavel,
    ...paciente,
    ...formulario,
    ...atividade,
    ...atividade_personalizada,
    ...atividade_portage,
    ...tentativa
}