const getById =           require('./getById.js')
const getByAtividadeId =  require('./getByAtividadeId.JS')
const post =              require('./post.js')


module.exports = {
    "v1/espectra/tentativa/": {
        ...post
    },

    "v1/espectra/tentativa/{id}": {
        ...getById
    },

     "v1/espectra/tentativa/{atividade_id}": {
        ...getByAtividadeId
    }


}