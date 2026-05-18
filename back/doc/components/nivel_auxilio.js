module.exports = {
    nivel_auxilio: {
        type: 'object',
        properties: {
            "id": {
                "type": "int",
                "description": "nivel_auxilio_id",
                "example": 1
            },
            "alternativa": {
                "type": "string",
                "description": "nivel de auxilio",
                "example": "Auxilio Parcial"
            }
        }
    },
    nivel_auxilio_id: {
        type: 'object',
        properties: {
            "id": {
                "type": "int",
                "description": "nivel_auxilio_id",
                "example": 1
            }
        }
    }
}