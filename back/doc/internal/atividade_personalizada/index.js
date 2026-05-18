const getAtividadePersonalizadaByAtividadeId = require('./get')


module.exports = {

    "/v1/espectra/atividade_personalizada/{id_atividade}": {
        ...getAtividadePersonalizadaByAtividadeId
    }

}