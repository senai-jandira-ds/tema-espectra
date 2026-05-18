const postAtividadeTipoPortage =  require('./postAtividadePortage')
const postAtividadeTipoPersonalizada = require('./postAtividadePersonalizada')
const deleteAtividadeTipoPersonalizada = require('./deleteAtividadeTipoPersonalizada')
const deleteAtividadeTipoPortage = require('./deleteAtividadeTipoPortage')
const putAtividadeTipoPersonalizada = require('./putAtividadeTipoPersonalizada')

module.exports = {
    
    "v1/espectra/atividade_portage/?id_atividade_portage={id}&id_paciente={id}": {
        ...postAtividadeTipoPortage
    },

    "v1/espectra/atividade_personalizada/": {
        ...postAtividadeTipoPersonalizada
    },

    "v1/espectra/atividade_personalizada/{id_atividade}": {
        ...deleteAtividadeTipoPersonalizada,
        ...putAtividadeTipoPersonalizada
    },

    "v1/espectra/atividade_portage/{id_atividade}": {
        ...deleteAtividadeTipoPortage
    }


}