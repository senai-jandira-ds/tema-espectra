module.exports = {
    put: {
        tags: ['EndPoints [RESPONSAVEL]'],
        description: "Atualiza a senha de um responsável no sistema",
        operationId: "atualizarSenhaResponsavel",
        parameters: [{
            name: "id",
            in: "path",
            description: "Id do Responsável",
            required: true,
            schema: {
                type: "int",
                format: "int64"
            }
        },
        {
            name: "senha",
            in: "query",
            description: "senha",
            required: true,
            schema: {
                type: "int",
                format: "int64"
            }
        }],
        responses: {
            200: {
                description: "Requisição bem sucedida",
                content: {
                    "application/json": {
                        schema: {
                            $ref: "#/components/schemas/success_update"
                        }
                    }
                }
            },
            400: {
                description: "Campo inválido",
                content: {
                    "application/json": {
                        schema: {
                            $ref: "#/components/schemas/error400"
                        }
                    }
                }
            },
            404: {
                description: "O Id informado não foi encontrado",
                content: {
                    "application/json": {
                        schema: {
                            $ref: "#/components/schemas/error404"
                        }
                    }
                }
            },
            415: {
                description: "Tipos de dados inválidos",
                content: {
                    "application/json": {
                        schema: {
                            $ref: "#/components/schemas/error415"
                        }
                    }
                }
            },
            500: {
                description: "Não foi possível processar a requisição por erros internos da Controller",
                content: {
                    "application/json": {
                        schema: {
                            $ref: "#/components/schemas/error500"
                        }
                    }
                }
            }
        }
    }
}