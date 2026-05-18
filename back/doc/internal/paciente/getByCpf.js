module.exports = {
    get: {
        tags: ["EndPoints [PACIENTE]"],
        description: 'Retorna um Paciente do sistema pelo cpf.',
        operationId: 'listarPacienteCpf',
        parameters: [{
            name: "CPF",
            in: "query",
            description: "CPF do paciente",
            required: true,
            schema: {
                type: "string",
            }
        }],
        responses: {
            200: {
                description: "Requisição bem sucedida",
                content: {
                    "application/json": {
                        schema: {
                            $ref: "#/components/schemas/pacienteGet"
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