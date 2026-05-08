module.exports = {
    atividade_portage: {
        type: "object",
        properties: {
            "id": {
                "type": "int",
                "description": "id_portage_activity",
                "example": 1
            },
            "numero_questao": {
                "type": "int",
                "description": "number_question",
                "example": 1
            },
            "questao": {
                "type": "string",
                "description": "question",
                "example": "Observa uma pessoa movimentando-se em seu campo visual. "
            },
            "valor_atividade": {
                "type": "int",
                "description": "value_activities",
                "example": "0.035"
            },
            "id_habilidade": {
                "type": "int",
                "description": "id_habilidade",
                "example": 1
            },
            "id_faixa_idade": {
                "type": "int",
                "description": "id_age_range",
                "example": 1
            }
        }
    }
}