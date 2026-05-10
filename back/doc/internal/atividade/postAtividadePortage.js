module.exports = {
    post: {
        tags: ["EndPoints [ATIVIDADE]"],
        description: 'Cadastra uma nova atividade tipo portage para o paciente.',
        operationId: 'inserirAtividadeTipoPortage',
        parameters: [{
            name: "id_paciente",
            in: "path",
            description: "Id da paciente",
            required: true,
            schema: {
                type: "int",
                format: "int64"
            }
        },
        {
            name: "id_atividade_portage",
            in: "path",
            description: "id da atividade portage",
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
                            $ref: "#/components/schemas/atividadeTipoPortage"
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