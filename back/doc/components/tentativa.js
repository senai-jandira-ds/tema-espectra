module.exports = {
    tentativa: {
        type: 'object',
        properties: {
            "id": {
                "type": "int",
                "description": "id",
                "example": 1
            },
            "resultado": {
                "type": "boolean",
                "description": "result",
                "example": 1
            },
            "data": {
                "type": "string",
                "description": "data da tentaitva",
                "example": "2026-04-14"
            },
            "observacao": {
                "type": "string",
                "description": "observation",
                "example": ""
            },
            "nivel_auxilio": {
                "type": "string",
                "description": "nivel de auxilio",
                "example": "auxílio parcial"
            },
            "atividade": {
                "type": "array",
                "items": {
                    $ref: "#/components/schemas/atividade_personalizada"
                }
            }
        }
    },
    
    arrayTentativa: {

        type: 'object',
        properties: {
            "tentativas": {
                "type": "array",
                "items": {
                    $ref: "#/components/schemas/tentativa"
                }
            }
        }

    },

    tentativaPost: {
        type: 'object',
        properties: {
            "resultado": {
                "type": "boolean",
                "description": "result",
                "example": 1
            },
            "observacao": {
                "type": "string",
                "description": "observation",
                "example": ""
            },
              "data": {
                "type": "string",
                "description": "data da tentaitva",
                "example": "2026-04-14"
            },
            "nivel_auxilio_id": {
                "type": "int",
                "description": "id do nivel de auxilio",
                "example": 3                
            },
             "atividade_id": {
                "type": "int",
                "description": "id da atividade",
                "example": 1                
            },
        }
    }
}