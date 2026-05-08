module.exports = { 
    get: {
        tags: ["EndPoints [TENTATIVA]"],
        description: 'Retorna tentativas do sistema filtrando pelo ID da Atividade.',
        operationId: 'listarTentativasIdAtividade',
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
                            $ref: "#/components/schemas/arrayTentativa"
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