module.exports = {
    atividade_personalizada: {
        type: "object",
        properties: {
            "id": {
                "type": "int",
                "description": "id_custom_activity",
                "example": 1
            },
            "questao": {
                "type": "string",
                "description": "question",
                "example": "Conversar em rodas de amigos e colegas"
            },
            "valor_meses": {
                "type": "int",
                "description": "value_months",
                "example": 12
            },
            "id_psicopedagogo": {
                "type": "int",
                "description": "id_psychopedagogue",
                "example": 1
            }
        }
    },

    atividade_personalizadaGet: {
        type: "object",
        properties: {
            "id": {
                "type": "int",
                "description": "id_custom_activity",
                "example": 1
            },
            "questao": {
                "type": "string",
                "description": "question",
                "example": "Conversar em rodas de amigos e colegas"
            },
            "valor_meses": {
                "type": "int",
                "description": "value_months",
                "example": "12 meses"
            },
            "id_psicopedagogo": {
                "type": "int",
                "description": "id_psychopedagogue",
                "example": 1
            },
            "id_atividade": {
                "type": "int",
                "description": "id_activity",
                "example": 1
            }
        }
    },

    atividade_personalizadaPost: {
        type: "object",
        properties: {
            "questao": {
                "type": "string",
                "description": "question",
                "example": "Conversar em rodas de amigos e colegas"
            },
            "valor_meses": {
                "type": "int",
                "description": "value_months",
                "example": "12 meses"
            }
        }
    },

    atividade_personalizadaPut: {
        type: "object",
        properties: {
            "questao": {
                "type": "string",
                "description": "question",
                "example": "Conversar em rodas de amigos e colegas"
            },
            "valor_meses": {
                "type": "int",
                "description": "value_months",
                "example": "12 meses"
            }
        }
    },

    atividade_personalizadaGet: {
        type: "object",
        properties: {
            "id": {
                "type": "int",
                "description": "id_custom_activity",
                "example": 1
            }
        }
    }
}