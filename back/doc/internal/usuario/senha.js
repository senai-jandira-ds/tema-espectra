module.exports = {
    put: {
        tags: ["EndPoints [USUARIO]"],
        description: 'Solicita link de redefinição de senha',
        operationId: 'solicitaRedefinicaoSenha',
        parameters: [{
            name: "id",
            in: "path",
            description: "id do usuario",
            required: true,
            schema: {
                type: "string",
            }
        },
        {
            name: "senha",
            in: "query",
            description: "senha do usuario",
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
                            $ref: "#/components/schemas/success"
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