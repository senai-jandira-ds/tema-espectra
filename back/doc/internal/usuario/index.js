const login = require('./login.js')
const deleteUsuario = require('./delete.js')
const senha = require('./senha.js')
const put = require('./put.js')
const post = require('./post')
const getById = require('./getById.js')

module.exports = {
    
    "/v1/espectra/usuario/": {
        ...post
    },

    "/v1/espectra/usuario/?email={email}&senha={senha}": {
        ...login
    },
    
    "/v1/espectra/usuario/{id}": {
        ...getById,
        ...put,
    },

     "/v1/espectra/usuario/{id}/?senha={senha}": {
        ...senha,
        ...deleteUsuario
    }

}