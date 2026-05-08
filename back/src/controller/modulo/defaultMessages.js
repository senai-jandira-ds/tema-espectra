/********************************************************************
 * Objetivo: Arquivo responsável pelas mensagens de saída da API 
 * Data: 29/04/2026
 * Autores: Nicolas dos Santos 
 * Versão: 1.0
 ********************************************************************/

const dataAtual = new Date()


// Mensagem padrão
const defaultHeader = {
    development: 'Gabriel Lacerda, Maria Cecília, Nicolas dos Santos, Enzo Carrilho, e Aline Alves',
    api_description: 'Espectra - Auxiliando quem cuida',
    status: null,
    status_code: null,
    request_date: dataAtual.toLocaleString(),
    itens: {}
}

// Mensagens de Sucesso
const successRequest = {
    status: true,
    status_code: 200,
    message: "Requisição bem-sucedida!"
}

// Mensagens de erro
const errorNotFound = {
    status: false,
    status_code: 404,
    message: "Não foi possível processar a requisição por não encontrar dados de retorno!"
}

const errorInternalServerController = {
    status: false,
    status_code: 500,
    message: "Não foi possível processar a requisição por erros internos da Controller!"
}

const errorRequiredFields = {
    status: false,
    status_code: 400,
    message: "Não foi possível processar a requisição pois campos obrigatórios não foram preenchidos ou estão incorretos."
}

const errorInternalServer = {
    status: false,
    status_code: 500,
    message: "Não foi possível processar a requisição devido a erros internos no servidor"
}

module.exports = {
    defaultHeader,
    successRequest,
    errorNotFound,
    errorInternalServerController,
    errorRequiredFields,
    errorInternalServer
}