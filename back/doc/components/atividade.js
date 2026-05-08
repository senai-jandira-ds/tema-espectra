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
            "status_atividade": {
                "type": "string",
                "description": "status da atividade",
                "example": "Em andamento"
            }
        }
    },

    atividadeTipoPortagePost: {
        type: "object",
        properties: {
            "id_status_atividade": {
                "type": "int",
                "description": "id_status_atividade",
                "example": 1
            },
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
                "description": "id_paciente",
                "example": 22
            },
            "id_psicopedagogo": {
                "type": "int",
                "description": "id_paciente",
                "example": 22
            },
            "atividade": {
                "type": "array",
                "items": {
                    $ref: "#/components/schemas/atividade_personalizada"
                }
            },
            "status_atividade": {
                "type": "string",
                "description": "status da atividade",
                "example": "Em andamento"
            }
        }
    },

    atividadeTipoPersonalizadaPost: {
        type: "object",
        properties: {
            "questao": {
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
                "description": "id_psicopedagogo",
                "example": 1
            },
            "id_habilidade": {
                "type": "int",
                "description": "id_habilidade",
                "example": 3
            },
            "id_status_atividade": {
                "type": "int",
                "description": "id_status_atividade",
                "example": 1
            },
            "id_paciente": {
                "type": "int",
                "description": "id_paciente",
                "example": 22
            }
        }
    },

    atividadeTipoPersonalizadaPut: {
        type: "object",
        properties: {
            "questao": {
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