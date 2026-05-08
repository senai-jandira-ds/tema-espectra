module.exports = {
    pacienteGetGrafico: {
        type: 'object',
        properties: {
            "id_habilidade": {
                "type": "int",
                "description": "id",
                "example": 1
            },
            "nome_habilidade": {
                "type": "string",
                "description": "nome da habilidade",
                "example": "Socialização"
            },
            "valor_meses": {
                "type": "double",
                "description": "valor em meses",
                "example": 12.6
            }
        }
    }
}