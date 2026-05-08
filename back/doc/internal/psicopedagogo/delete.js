module.exports = {
    delete: {
        tags: ["EndPoints [PSICOPEDAGOGO]"],
        description: 'Deleta um psicopedagogo pelo ID e senha',
        operationId: 'deletePsicopedagogo',
        parameters: [{
            name: "id",
            in: "path",
            description: "ID do psicopedagogo",
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
                            $ref: "#/components/schemas/success_delete"
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