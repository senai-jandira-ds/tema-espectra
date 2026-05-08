
![Logo](./img/logo.png)

# Espectra

Este repositório é responsável por controlar o versionamento da aplicação Espectra

## Sobre o Espectra

O Espectra foi desenvolvido a partir da necessidade de uma ferramenta de apoio para psicopedagogos gerenciarem atividades, e habilidades de pessoas com o espectro autista (TEA). 

## Fluxo de telas da aplicação

- [Fluxo de telas - Espectra](https://youtu.be/S9izysnZVWc)

### Disciplina: Trabalho de Conclusão de Curso
Semestre: 2026/1

### Orientadores: 
- [@Joao-Meyer](https://github.com/Joao-Meyer)
- [@fernandoleonid](https://github.com/fernandoleonid)
- [@marcelnt](https://github.com/marcelnt)
- [@yurikomuta](https://github.com/yurikomuta)



### Back-end 🤓

├── 📂 doc **SWAGGER**<br>
│ㅤㅤ└── 📂 components **COMPONENTES**<br>
│ㅤㅤ└── 📂 internal **ENDPOINTS**<br>
│ㅤㅤ└── 📄 basicInfo.js **CABEÇALHO**<br>
│ㅤㅤ└── 📄 index.js <br>
│ㅤㅤ└── 📄 paths.js <br>
│ㅤㅤ│ㅤㅤ<br>
│ㅤㅤ└── 📂 node_modules <br>
│ㅤㅤ└── 📂 src<br>
│ㅤㅤ│ㅤㅤ└── 📄 server.js <br>
│ㅤㅤ└── 📄 package-lock.json <br>
│ㅤㅤ└── 📄 package.json <br>


## Contribuições

Use mensagens claras, e descritivas em português, utilizando "Convetional Commits" referenciando a hash da issue ao final de cada commit!
Commits pequenos e frequentes.

[Convetional Commits](https://github.com/iuricode/padroes-de-commits)

**Caso esteja fazendo alterações na documentação do backend:**
1. git switch develop
2. git pull
3. git switch -c doc/swagger-psicopedagogo

**Caso esteja fazendo alterações no código do backend:**
1. git switch develop
2. git pull
3. git switch -c feature/crud-psicopedagogo

4. Realize as alterações necessárias
5. git add .
6. git commit -m "feat: Adiciona model psicopedagogo"
7. git push -u origin feat/crud-psicopedagogo
8. Abra o GitHub → New Pull Request
   base: develop ← compare: feature/crud-psicopedagogo
9. Adicione um reviewer e descreva o que foi feito
10. Aguarde aprovação antes de mergear

**CUIDADO!!!** <br>
O PR é não é bagunça! 1 PR = 1 BRANCH<br>
- PR deve ter foco único - Uma feature, uma correção.<br>
- Descreva o que foi feito, por que e como testar.<br>
- Nunca seja reviewer do próprio PR.<br>
- Revise o PR do colega com cuidado.<br>
- PR pequeno é bem revisado; PR grande níguém revisa direito <br>

Também cuidado com os merges para não prejudicar o trabalho do amiguinho; Lembrando que **VOCÊ** em nenhuma hipótese, **NUNCA**, é o reviewer do próprio PR, isso não existe. Caso eu pegue isso acontecendo, será anotado como mal desempenho 🙂

## Repositórios

- [Principal](https://github.com/GabrielPKTN/Espectra)
- [Back-end](https://github.com/GabrielPKTN/Espectra-Back)
- [Front-end](https://github.com/GabrielPKTN/Espectra-Front)
- [Banco de Dados](https://github.com/GabrielPKTN/Espectra-BD)
- [Mobile](https://github.com/GabrielPKTN/Espectra-Mobile)

## Authors

- [@GabrielPKTN](https://www.github.com/GabrielPKTN)
- [@mariacecilia-01](https://github.com/mariacecilia-01)
- [@AlineMaker](https://www.github.com/AlineMaker)
- [@nicolas16-sd](https://www.github.com/nicolas16-sd)
- [@EnzoCarrilho](https://www.github.com/EnzoCarrilho)
