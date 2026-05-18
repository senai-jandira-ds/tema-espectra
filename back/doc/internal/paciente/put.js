module.exports = {
    put: {
        tags: ['EndPoints [PACIENTE]'],
        description: "Atualiza um paciente no sistema",
        operationId: "atualizarPaciente",
        parameters: [{
            name: "id",
            in: "query",
            description: "ID do paciente",
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
                        $ref: "#/components/schemas/pacientePut"
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
                description: "Não foi possível processar a requisição por erros internos.",
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