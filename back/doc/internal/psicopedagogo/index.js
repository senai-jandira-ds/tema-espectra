const getById             = require('./getById.js')
const post                = require('./post.js')
const put                 = require('./put.js')
const deletePsicopedagogo = require('./delete.js')
const getHome             = require('./getHome.js')
const putSenha            = require('./putSenha.js')
const loginPsicopedagogo  = require("./getLogin.js")

module.exports = {
    
    "/v1/espectra/psicopedagogo/": {
        ...post
    },

    "/v1/espectra/psicopedagogo/{id}": {
        ...getById,
        ...put
    },

    "/v1/espectra/psicopedagogo/?id={id}": {
        ...getHome
    },

    "/v1/espectra/psicopedagogo/?email={email}&senha={senha}": {
        ...loginPsicopedagogo
    },

    "/v1/espectra/psicopedagogo/{id}/?senha={senha}": {
        ...putSenha,
        ...deletePsicopedagogo
    }

}
