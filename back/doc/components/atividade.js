module.exports = {

    atividadeTipoPortage: {
        
        type: "object",
        properties: {
            "id": {
                "type": "int",
                "description": "id",
                "example": 1
            },
            "id_paciente": {
                "type": "int",
                "description": "id_paciente",
                "example": 22
            },
            "atividade": {
                "type": "array",
                "items": {
                    $ref: "#/components/schemas/atividade_portage"
                }
            },
            "concluida": {
                "type": "boolean",
                "description": "status da atividade",
                "example": false
            }
        }
    },

    atividadeTipoPortagePost: {
        type: "object",
        properties: {
            "id_paciente": {
                "type": "int",
                "description": "id_paciente",
                "example": 22
            },
            "id_atividade_portage": {
                "type": "int",
                "description": "id_atividade_personalizada",
                "example": 1
            }
        }
    },

    atividadeTipoPersonalizada: {
        type: "object",
        properties: {
            "id": {
                "type": "int",
                "description": "id",
                "example": 1
            },
            "id_paciente": {
                "type": "int",
                "description": "id paciente",
                "example": 22
            },
            "atividade": {
                "type": "array",
                "items": {
                    $ref: "#/components/schemas/atividade_personalizada"
                }
            },
            "concluida": {
                "type": "string",
                "description": "status da atividade",
                "example": false
            }
        }
    },

    atividadeTipoPersonalizadaPost: {
        type: "object",
        properties: {
            "comportamento": {
                "type": "string",
                "description": "questao",
                "example": "Conversar em rodas de amigos e colegas"
            },
            "valor_meses": {
                "type": "int",
                "description": "peso da atividade",
                "example": 12
            },
            "id_psicopedagogo": {
                "type": "int",
                "description": "id usuario",
                "example": 1
            },
            "id_habilidade": {
                "type": "int",
                "description": "id habilidade",
                "example": 3
            }
        }
    },

    atividadeTipoPersonalizadaPut: {
        type: "object",
        properties: {
            "comportamento": {
                "type": "string",
                "description": "questao",
                "example": "Conversar em rodas de amigos e colegas"
            },
            "valor_meses": {
                "type": "int",
                "description": "peso da atividade",
                "example": 12
            }
        }
    }
}