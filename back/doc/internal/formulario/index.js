const putAlternativaFormulario  = require('./putAlternativaFormulario.js')
const getAllQuestoesFormulario  = require('./getAllQuestoesFormulario.js')

module.exports = {
    
    "/v1/espectra/formulario/{id_paciente}": {
        ...putAlternativaFormulario,
        ...getAllQuestoesFormulario
    }

}
