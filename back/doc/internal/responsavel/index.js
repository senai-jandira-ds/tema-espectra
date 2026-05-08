const deleteResponsavel    = require('./delete.js')
const getById              = require('./getById.js')
const getHome              = require('./getHome.js')
const loginResponsavel     = require('./getLogin.js')
const post                 = require('./post.js')
const put                  = require('./put.js')
const putSenha             = require('./putSenha.js')

module.exports = {
    
    "/v1/espectra/responsavel/": {
        ...post,
    },

    "/v1/espectra/responsavel/{id}": {
        ...getById,
        ...put
    },

    "/v1/espectra/responsavel?id={id}": {
        ...getHome
    },

    "/v1/espectra/responsavel/?email={email}&senha={senha}": {
        ...loginResponsavel
    },

    "/v1/espectra/responsavel/{id}/?senha={senha}": {
        ...deleteResponsavel,
        ...putSenha
    }

}