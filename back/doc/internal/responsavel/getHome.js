module.exports = {
    get: {
        tags: ['EndPoints [RESPONSAVEL]'],
        description: "Retorna home do responsável pelo id",
        operationId: "retornaPerfilResponsavel",
        parameters: [{
            name: "id",
            in: "query",
            description: "Id do Responsável",
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
                            $ref: "#/components/schemas/responsavelHome"
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
            500: {
                description: "Não foi possível processar a requisição por erros internos",
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