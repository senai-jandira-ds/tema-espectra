module.exports = {
    post: {
        tags: ["EndPoints [PACIENTE]"],
        description: 'Cadastra um novo Paciente no sistema.',
        operationId: 'inserirPaciente',
        requestBody: {
            content: {
                "application/json": {
                    schema: {
                        $ref: "#/components/schemas/pacientePost"
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