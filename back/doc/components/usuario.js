module.exports = {

    usuario: {
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
                "example": "Julia Nogueira Silva"
            },
            "data_nascimento": {
                "type": "string",
                "description": "birth_date",
                "example": "24/10/1977"
            },
            "telefone": {
                "type": "string",
                "description": "phone_number",
                "example": "(11) 91245-5476"
            },
             "email": {
                "type": "string",
                "description": "email",
                "example": "julianogueira77@gmail.com"
            },
            "tipo_usuario": {
                "type": "string",
                "description": "tipo usuario",
                "example": "Psicopedagogo"
            }
        }
    },

    usuarioPost: {
        type: 'object',
        properties: {
            "nome": {
                "type": "string",
                "description": "name",
                "example": "Julia Nogueira Silva"
            },
            "data_nascimento": {
                "type": "string",
                "description": "birth_date",
                "example": "1977-10-24"
            },
            "telefone": {
                "type": "string",
                "description": "phone_number",
                "example": "(11) 91245-5476"
            },
             "email": {
                "type": "string",
                "description": "email",
                "example": "julianogueira77@gmail.com"
            },
            "senha": {
                "type": "string",
                "description": "senha",
                "example": "123456789@ABC"
            },
            "id_tipo_usuario": {
                "type": "int",
                "description": "id_tipo_usuario",
                "example": 1
            }
        }
    },

    usuarioPut: {

        type: 'object',
        properties: {

            "foto": {
                "type": "string",
                "description": "photo",
                "example": "http://azure.blob.img"
            },
            "nome": {
                "type": "string",
                "description": "name",
                "example": "Julia Nogueira Silva"
            },
            "data_nascimento": {
                "type": "string",
                "description": "birth_date",
                "example": "1977-10-24"
            },
            "telefone": {
                "type": "string",
                "description": "phone_number",
                "example": "(11) 91245-5476"
            },
             "email": {
                "type": "string",
                "description": "email",
                "example": "julianogueira77@gmail.com"
            }

        }

    },

    usuarioHome: {

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
                "example": "Julia Nogueira Silva"
            },
            "data_nascimento": {
                "type": "string",
                "description": "birth_date",
                "example": "1977-10-24"
            },
            "telefone": {
                "type": "string",
                "description": "phone_number",
                "example": "(11) 91245-5476"
            },
             "email": {
                "type": "string",
                "description": "email",
                "example": "julianogueira77@gmail.com"
            },
            "senha": {
                "type": "string",
                "description": "senha",
                "example": "123456789@ABC"
            },
            "tipo_usuario": {
                "type": "int",
                "description": "tipo_usuario",
                "example": "Psicopedagogo"
            },
            "pacientes": {
                "type": "array",
                "items": {
                    $ref: "#/components/schemas/pacienteGet"
                }
            }

        }

    }

}