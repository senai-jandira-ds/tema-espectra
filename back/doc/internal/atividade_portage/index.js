const getAtividadePortage = require('./get')

module.exports = {

    "/v1/espectra/atividade_portage/": {
        ...getAtividadePortage,
    }

}