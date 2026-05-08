const getById                   = require('./getById.js')
const deletePaciente            = require('./delete.js')
const getByRegisterNumber       = require('./getByRegisterNumber.js')
const post                      = require('./post.js')
const put                       = require('./put.js')
const postPacientePsicopedagogo = require('./postPacientePsicopedagogo.js')
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

    "/v1/espectra/paciente/?numero_registro={register_number}": {
        ...getByRegisterNumber
    },

    "/v1/espectra/paciente/?id_paciente={id}&id_psicopedagogo{id}": {
        ...postPacientePsicopedagogo
    },

    "/v1/espectra/paciente/?id_paciente={id}&id_paciente={id}": {
        ...postPacienteResponsavel
    }

}
