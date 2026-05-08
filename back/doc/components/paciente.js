const responsavel = require("./responsavel");


module.exports = {

    paciente: {
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
                "example": "Mario Augusto Ramos"
            },
            "data_nascimento": {
                "type": "string",
                "description": "birth_date",
                "example": "2010-08-12"
            },
            "idade": {
                "type": "int",
                "description": "years",
                "example": "12"
            },
             "diagnostico": {
                "type": "string",
                "description": "diagnostico",
                "example": "Autismo e TDAH"
            },
            "serie_escolar": {
                "type": "string",
                "description": "diagnostico",
                "example": "2º Série"
            },
            "grau_suporte": {
                "type": "string",
                "description": "diagnostico",
                "example": "Grau 3"
            },
            "numero_registro": {
                "type": "string",
                "description": "numero de resgistro",
                "example": "2026040001"
            },
            "grafico": {
                "type": "array",
                "items": {
                    $ref: "#/components/schemas/pacienteGetGrafico"
                }
            },
            "psicopedagogo": {
                "type": "array",
                "items": {
                    $ref: "#/components/schemas/pacienteGetPsicopedagogo"
                }
            },
            "responsaveis": {
                "type": "array",
                "items": {
                    $ref: "#/components/schemas/pacienteGetResponsavel"
                }
            }
        }
    },

    pacientePost: {
        type: 'object',
        properties: {
            "nome": {
                "type": "string",
                "description": "name",
                "example": "Mario Augusto Ramos"
            },
            "foto": {
                "type": "string",
                "description": "photo",
                "example": "http://azure.blob.img"
            },
            "data_nascimento": {
                "type": "string",
                "description": "birth_date",
                "example": "1977-10-24"
            },
             "diagnostico": {
                "type": "string",
                "description": "diagnostico",
                "example": "Autismo e TDAH"
            },
            "id_serie_escolar": {
                "type": "int",
                "description": "id_psicopedagogo",
                "example": "1"
            },
            "id_grau_suporte": {
                "type": "int",
                "description": "id_psicopedagogo",
                "example": "1"
            },
            "id_responsavel": {
                "type": "int",
                "description": "id_responsavel",
                "example": "1"
            }
        }
    },

    pacienteGet: {
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
                "example": "Mario Augusto Ramos"
            },
            "data_nascimento": {
                "type": "string",
                "description": "birth_date",
                "example": "2010-08-12"
            },
            "idade": {
                "type": "int",
                "description": "years",
                "example": "12"
            },
             "diagnostico": {
                "type": "string",
                "description": "diagnostico",
                "example": "Autismo e TDAH"
            },
            "serie_escolar": {
                "type": "string",
                "description": "série escolar",
                "example": "2º Série"
            },
            "grau_suporte": {
                "type": "string",
                "description": "grau de suporte",
                "example": "Grau 3"
            },
            "numero_registro": {
                "type": "string",
                "description": "numero de resgistro",
                "example": "2026040001"
            }
        }
    },

    //componente para atualizar o paciente
    pacientePut: {
        type: 'object',
        properties: {
            "nome": {
                "type": "string",
                "description": "name",
                "example": "Mario Augusto Ramos"
            },
            "foto": {
                "type": "string",
                "description": "photo",
                "example": "http://azure.blob.img"
            },
            "data_nascimento": {
                "type": "string",
                "description": "birth_date",
                "example": "1977-10-24"
            },
             "diagnostico": {
                "type": "string",
                "description": "diagnostico",
                "example": "Autismo e TDAH"
            },
            "id_serie_escolar": {
                "type": "int",
                "description": "id_psicopedagogo",
                "example": "1"
            },
            "id_grau_suporte": {
                "type": "int",
                "description": "id_psicopedagogo",
                "example": "1"
            },
        }
    },

    //Visualização para psicopedagogo
    pacientePsicopedagogo: {
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
                "example": "Mario Augusto Ramos"
            },
            "data_nascimento": {
                "type": "string",
                "description": "birth_date",
                "example": "2010-08-12"
            },
            "idade": {
                "type": "int",
                "description": "years",
                "example": "12"
            },
             "diagnostico": {
                "type": "string",
                "description": "diagnostico",
                "example": "Autismo e TDAH"
            },
            "serie_escolar": {
                "type": "string",
                "description": "série escolar",
                "example": "2º Série"
            },
            "grau_suporte": {
                "type": "string",
                "description": "grau de suporte",
                "example": "Grau 3"
            },
            "numero_registro": {
                "type": "string",
                "description": "numero de resgistro",
                "example": "2026040001"
            },
            "reponsavel": {
                "type": "array",
                "items": {
                    $ref: "#/components/schemas/pacienteGetResponsavel"
                }
            }
        }
    },
  
    //Visualização para responsável
    familiarResponsavel: {
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
                "example": "Mario Augusto Ramos"
            },
            "data_nascimento": {
                "type": "string",
                "description": "birth_date",
                "example": "2010-08-12"
            },
            "idade": {
                "type": "int",
                "description": "years",
                "example": "12"
            },
             "diagnostico": {
                "type": "string",
                "description": "diagnostico",
                "example": "Autismo e TDAH"
            },
            "serie_escolar": {
                "type": "string",
                "description": "série escolar",
                "example": "2º Série"
            },
            "grau_suporte": {
                "type": "string",
                "description": "grau de suporte",
                "example": "Grau 3"
            },
            "numero_registro": {
                "type": "string",
                "description": "numero de resgistro",
                "example": "2026040001"
            },
            "reponsavel": {
                "type": "array",
                "items": {
                    $ref: "#/components/schemas/pacienteGetResponsavel"
                }
            }
        }
    }
}