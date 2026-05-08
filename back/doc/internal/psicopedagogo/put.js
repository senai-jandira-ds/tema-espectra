module.exports = {
    put: {
        tags: ["EndPoints [PSICOPEDAGOGO]"],
        description: 'Atualiza dados de um Psicopedagogo no sistema.',
        operationId: 'atualizarPsicopedagogo',
        parameters: [{
            name: "id",
            in: "path",
            description: "ID do psicopedagogo",
            required: true,
            schema: {
                type: "int",
                format: "int64"
            }
        }],
        requestBody: {
            content: {
                "application/json": {
                    schema: {
                        $ref: "#/components/schemas/psicopedagogoPut"
                    }
                }
            }
        },
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
                description: "Não encontrado",
                content: {
                    "application/json": {
                        schema: {
                            $ref: "#/components/schemas/error404"
                        }
                    }
                }
            },
            415: {
                description: "Tipos de dados inválidos.",
                content: {
                    "appplication/json": {
                         schema: {
                            $ref: "#/components/schemas/error415"
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