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
                "example": true
            },
            "data_tentativa": {
                "type": "string",
                "description": "data da tentaitva",
                "example": "14/04/2026"
            },
            "observacao": {
                "type": "string",
                "description": "observation",
                "example": "Lorem ipsum"
            },
            "nivel_auxilio": {
                "type": "string",
                "description": "nivel de auxilio",
                "example": "Auxílio parcial"
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
                "example": true
            },
            "observacao": {
                "type": "string",
                "description": "observation",
                "example": "Lorem ipsum"
            },
            "data_tentativa": {
                "type": "string",
                "description": "data da tentaitva",
                "example": "2026-04-14"
            },
            "id_nivel_auxilio": {
                "type": "int",
                "description": "id do nivel de auxilio",
                "example": 3                
            },
             "id_atividade": {
                "type": "int",
                "description": "id da atividade",
                "example": 1                
            },
        }
    }
}