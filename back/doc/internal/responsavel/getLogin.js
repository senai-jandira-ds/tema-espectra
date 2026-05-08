module.exports = {
    get: {
        tags: ["EndPoints [RESPONSAVEL]"],
        description: 'Retorna o ID de responsavel para efetuar o login',
        operationId: 'retornaIdResponsavel',
        parameters: [{
            name: "email",
            in: "query",
            description: "email",
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
        }
    ],
        responses: {
            200: {
                description: "Requisição bem sucedida",
                content: {
                    "application/json": {
                        schema: {
                            $ref: "#/components/schemas/responsavelId"
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
                description: "Não encontrado",
                content: {
                    "application/json": {
                        schema: {
                            $ref: "#/components/schemas/error404"
                        }
                    }
                }
            },
            500: {
                description: "Erros Internos",
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