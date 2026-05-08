module.exports = {
    get: {
        tags: ["EndPoints [ATIVIDADE]"],
        description: 'Retorna a atividade personalizada cadastrada pelo id de atividade.',
        operationId: 'retornaAtividadePersonalizadaIdAtividade',
        parameters: [{
            name: "id",
            in: "path",
            description: "ID da atividade",
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
                            $ref: "#/components/schemas/atividade_personalizada"
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
                description: "Não foi possível processar a requisião por erros internos",
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