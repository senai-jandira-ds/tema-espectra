module.exports = {
    post: {
        tags: ["EndPoints [PACIENTE]"],
        description: 'Cadastra relação entre paciente e responsavel',
        operationId: 'inserirRelacaoPacienteResponsavel',
        parameters: [{
            name: "id_paciente",
            in: "query",
            description: "id do paciente",
            required: true,
            schema: {
                type: "int",
            }
        },
        {
            name: "id_responsavel",
            in: "query",
            description: "id do responsavel",
            required: true,
            schema: {
                type: "int",
            }
        }],
        responses: {
            200: {
                description: "Requisição bem sucedida",
                content: {
                    "application/json": {
                        schema: {
                            $ref: "#/components/schemas/paciente"
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