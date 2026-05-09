module.exports = {
    get: {
        tags: ["EndPoints [USUARIO]"],
        description: 'Retorna dados da usuario após efetuar o login',
        operationId: 'retornaUsuarioLogin',
        parameters: [{
            name: "email",
            in: "query",
            description: "email do usuario",
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
                            $ref: "#/components/schemas/usuarioHome"
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