const getById                   = require('./getById.js')
const deletePaciente            = require('./delete.js')
const getByRegisterNumber       = require('./getByCpf.js')
const post                      = require('./post.js')
const put                       = require('./put.js')
const postPacienteResponsavel   = require('./postPacienteResponsavel.js')

module.exports = {
    
    "/v1/espectra/paciente/": {
        ...post
    },

    "/v1/espectra/paciente/{id}": {
        ...getById,
        ...put,
        ...deletePaciente
    },

    "/v1/espectra/paciente/?CPF={cpf}": {
        ...getByRegisterNumber
    },

    "/v1/espectra/paciente/?id_paciente={id}&id_usuario={id}": {
        ...postPacienteResponsavel
    }

}
