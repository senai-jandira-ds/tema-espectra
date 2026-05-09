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
                "example": "12/08/2010"
            },
            "idade": {
                "type": "int",
                "description": "years",
                "example": "12"
            },
            "cpf": {
                "type": "string",
                "description": "cpd",
                "example": "86202126809"
            },
             "diagnostico_breve": {
                "type": "string",
                "description": "diagnostico",
                "example": "TEA TOD"
            },
            "serie_escolar": {
                "type": "string",
                "description": "diagnostico",
                "example": "3º ANO"
            },
            "grau_suporte": {
                "type": "string",
                "description": "diagnostico",
                "example": "GRAU 3"
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
                    $ref: "#/components/schemas/pacienteGetUsuarioPsicopedagogo"
                }
            },
            "responsaveis": {
                "type": "array",
                "items": {
                    $ref: "#/components/schemas/pacienteGetUsuarioResponsavel"
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
                "example": null
            },
            "cpf": {
                "type": "string",
                "description": "cpd",
                "example": "86202126809"
            },
            "data_nascimento": {
                "type": "string",
                "description": "birth_date",
                "example": "1977-10-24"
            },
            "diagnostico_breve": {
                "type": "array",
                "items": {
                    $ref: "#/components/schemas/transtornoPost"
                }
            },
            "id_serie_escolar": {
                "type": "int",
                "description": "id_psicopedagogo",
                "example": 1
            },
            "id_grau_suporte": {
                "type": "int",
                "description": "id_psicopedagogo",
                "example": 1
            },
            "id_responsavel": {
                "type": "int",
                "description": "id_responsavel",
                "example": 1
            }
        }
    },

    transtornoPost: {

        type: 'object',
        properties: {

            "id_transtorno": {
                "type": "int",
                "description": "id",
                "example": 2
            },

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
                "example": "12/08/2010"
            },
            "idade": {
                "type": "int",
                "description": "years",
                "example": 12
            },
            "diagnostico_breve": {
                "type": "string",
                "description": "diagnostico",
                "example": "TEA TOD"
            },
            "serie_escolar": {
                "type": "string",
                "description": "série escolar",
                "example": "3º ANO"
            },
            "grau_suporte": {
                "type": "string",
                "description": "grau de suporte",
                "example": "GRAU 3"
            },
            "cpf": {
                "type": "string",
                "description": "cpf",
                "example": "86202126809"
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
            "diagnostico_breve": {
                "type": "array",
                "items": {
                    $ref: "#/components/schemas/transtornoPost"
                }
            },
            "id_serie_escolar": {
                "type": "int",
                "description": "id_psicopedagogo",
                "example": 1
            },
            "id_grau_suporte": {
                "type": "int",
                "description": "id_psicopedagogo",
                "example": 1
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
                "example": "52512366579"
            },
            // "reponsavel": {
            //     "type": "array",
            //     "items": {
            //         $ref: "#/components/schemas/pacienteGetResponsavel"
            //     }
            // }
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
            // "reponsavel": {
            //     "type": "array",
            //     "items": {
            //         $ref: "#/components/schemas/pacienteGetResponsavel"
            //     }
            // }
        }
    }
}