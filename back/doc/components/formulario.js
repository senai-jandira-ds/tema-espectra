module.exports = {
    
    formulario: {
        type: 'object',
        properties: {
            "atividade_portage": {
                "type": "array",
                "items": {
                    $ref: "#/components/schemas/atividade_portage"
                }
            },
            "id_resposta": {
                "type": "int",
                "description": "id da alternativa",
                "example": 1
            }
        }
    },

    arrayFormulario: {
        type: 'object',
        properties: {
            "questoes": {
                "type": 'array',
                "items": {
                    $ref: "#/components/schemas/formulario"
                }   
            }
        }
    },

    formularioPutAlternativa: {
        type: 'object',
        properties: {
            "id_atividade_portage": {
                "type": "int",
                "description": "id da atividade-portage",
                "example": 1
            },
            "id_resposta": {
                "type": "int",
                "description": "id da alternativa",
                "example": 1
            }
        }
    },

    arrayAlternativaFormulario: {
        type: 'object',
        properties: {
            "respostas": {
                "type": 'array',
                "items": {
                    $ref: "#/components/schemas/formularioPutAlternativa"
                }   
            }
        }
    },
}