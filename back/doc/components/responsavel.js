module.exports = {

    responsavel: {
        type: 'object',
        properties: {
            "id": {
                "type": "int",
                "description": "id",
                "example": 1
            },
            "foto": {
                "type": "string",
                "description": "photo",
                "example": "http://azure.blob.img"
            },
            "nome": {
                "type": "string",
                "description": "name",
                "example": "Nicolas dos Santos Durão"
            },
            "data_nascimento": {
                "type": "string",
                "description": "birth_date",
                "example": "2008-06-16"
            },
            "telefone": {
                "type": "string",
                "description": "telephone",
                "example": "(11) 11111-1111"
            },
            "email": {
                "type": "string",
                "description": "email",
                "example": "seuemail@gmai.com"
            }
        }
    },

    responsavelHome: {
        type: 'object',
        properties: {
            "id": {
                "type": "int",
                "description": "id",
                "example": 1
            },
            "nome": {
                "type": "string",
                "description": "name",
                "example": "Nicolas dos Santos Durão"
            },
            "foto": {
                "type": "string",
                "description": "photo",
                "example": "http://azure.blob.img"
            },
            "familiar": {
                "type": "array",
                "items": {
                    $ref: "#/components/schemas/familiarResponsavel"
                }
            }
        }
    },

    responsavelPost: {
        type: 'object',
        properties: {
            "nome": {
                "type": "string",
                "description": "name",
                "example": "Nicolas dos Santos Durao"
            },
            "data_nascimento": {
                "type": "string",
                "description": "birth_date",
                "example": "2008-06-16"
            },
            "telefone": {
                "type": "string",
                "description": "telephone",
                "example": "(11) 11111-1111"
            },
             "email": {
                "type": "string",
                "description": "email",
                "example": "seuemail@gmail.com"
            },
             "senha": {
                "type": "string",
                "description": "password",
                "example": "senha1234@"
            }
        }
    },

    responsavelId: {
        type: 'object',
        properties: {
            "id": {
                "type": "int",
                "description": "id",
                "example": 1
            }
        }
    },
    
    responsavelPut: {
        type: 'object',
        properties: {
            "nome": {
                "type": "string",
                "description": "name",
                "example": "Nicolas dos Santos Durao"
            },
            "foto": {
                "type": "string",
                "description": "name",
                "example": "Nicolas dos Santos Durao"
            },
            "data_nascimento": {
                "type": "string",
                "description": "birth_date",
                "example": "2008-06-16"
            },
            "telefone": {
                "type": "string",
                "description": "telephone",
                "example": "(11) 11111-1111"
            },
             "email": {
                "type": "string",
                "description": "email",
                "example": "seuemail@gmail.com"
            },
        }
    },

    responsavelPutSenha: {
        type: 'object',
        properties: {
            "senha": {
                "type": "string",
                "description": "password",
                "example": "senha1234@"
            }
        }
    },

    //Get para o array de paciente
    pacienteGetResponsavel: {
        type: 'object',
        properties: {
            "id": {
                "type": "int",
                "description": "id",
                "example": 1
            },
            "nome": {
                "type": "string",
                "description": "name",
                "example": "Nicolas dos Santos Durao"
            },
            "telefone": {
                "type": "string",
                "description": "phone_number",
                "example": "(11) 11111-1111"
            },
        }
    }
}