/**********************************************************************
 * Objetivo: Arquivo responsável pelo funcionamento da API da aplicação
 * Espectra
 * Data: 18/04/2026
 * Developer: Gabriel Lacerda Correia
 * Versão: 1.0.0
 *********************************************************************/

//Responsável pelo funcionamento da API
const express           = require('express')

// Responsável pelas permissões da API
const cors              = require('cors')

// Import das dependências para a documentação dos EndPoints da API 
const swaggerUi         = require('swagger-ui-express')
const swaggerDocument   = require('../doc/index.js')

// Retorna a porta do servidor atual ou colocamos uma porta local
const PORT = process.env.PORT || 8080

// Criando instância da classe express
const app = express()

// Configuração de permissões de requisição
app.use(cors({
    origin: '*',
    methods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'],
    allowedHeaders: ['Content-Type', 'Authorization', 'Accept']
}))

// Middleware para permitir JSON no body
app.use(express.json());

//EndPoint da documentação
app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerDocument))

const patientRoutes = require('./routes/paciente/pacienteRoutes.js')

app.use("/v1/espectra/paciente", patientRoutes)
//Imports dos arquivos para EndPoints
const psicopedagogoRoutes = require("./routes/psicopedagogo/psicopedagogoRoutes.js")
const formularioRoutes = require("./routes/formulario/formularioRoutes.js")

//EndPoints da Aplicação
app.use("/v1/espectra/psicopedagogo", psicopedagogoRoutes)
app.use("/v1/espectra/formulario", formularioRoutes)

app.listen(PORT, () => {
    console.log(`Se você está vendo isso, comemore!\nAPI rodando na porta: ${PORT}`)
})