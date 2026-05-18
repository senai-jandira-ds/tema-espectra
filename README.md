
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



### Documentação

├── 📂 back <br>
│ㅤㅤ└── 📂 doc **SWAGGER** <br>
│ㅤㅤ│ㅤㅤ└── 📂 components <br>
│ㅤㅤ│ㅤㅤ└── 📂 internal <br>
│ㅤㅤ│ㅤㅤ└── 📄 basicInfo.js <br>
│ㅤㅤ│ㅤㅤ└── 📄 index.js <br>
│ㅤㅤ│ㅤㅤ└── 📄 paths.js <br>
│ㅤㅤ│<br>
│ㅤㅤ└── 📂 src    <br>
│ㅤㅤ│ㅤㅤ└── 📂 controller <br>
│ㅤㅤ│ㅤㅤ└── 📂 database <br>
│ㅤㅤ│ㅤㅤ└── 📂 model <br>
│ㅤㅤ│ㅤㅤ└── 📂 routes <br>
│ㅤㅤ│ㅤㅤ└── 📄 server.js <br>
│ㅤㅤ│<br>
│ㅤㅤ└── 📄 .gitignore    <br>
│ㅤㅤ└── 📄 knexfile.js    <br>
│ㅤㅤ└── 📄 package-lock.json    <br>
│ㅤㅤ└── 📄 package.json    <br>
│<br>
├── 📂 banco <br>
│ㅤㅤ└── 📂 diagramas <br>
│ㅤㅤ└── 📂 scripts <br>
│<br>
└── 📂 documentacao <br>
│ㅤㅤ└── 📂 prototipo<br>
│ㅤㅤ└── 📄 Espectra.pdf    <br>
│ㅤㅤ└── 📄 requisitos-funcionais.docx    <br>
│ㅤㅤ└── 📄 requisitos-não-funcionais.docx    <br>
│ㅤㅤ└── 📄 requisitos-do-projeto.docx    <br>
│<br>
└── 📂 front <br>
│ㅤㅤ└── 📂 public<br>
│ㅤㅤ└── 📂 src<br>
│ㅤㅤ│ㅤㅤ└── 📂 assets <br>
│ㅤㅤ│ㅤㅤ└── 📂 components <br>
│ㅤㅤ│ㅤㅤ└── 📂 pages <br>
│ㅤㅤ│ㅤㅤ└── 📂 routes <br>
│ㅤㅤ│ㅤㅤ└── 📄 App.jsx <br>
│ㅤㅤ│ㅤㅤ└── 📄 index.css <br>
│ㅤㅤ│ㅤㅤ└── 📄 main.jsx <br>
│ㅤㅤ│ <br>
│ㅤㅤ└── 📄 .gitignore    <br>
│ㅤㅤ└── 📄 eslint.config.js    <br>
│ㅤㅤ└── 📄 index.html    <br>
│ㅤㅤ└── 📄 package-lock.json    <br>
│ㅤㅤ└── 📄 package.json    <br>
│ㅤㅤ└── 📄 vite.config.js    <br>

## Contribuições

Use mensagens claras, e descritivas em português, utilizando "Convetional Commits" referenciando a hash da issue ao final de cada commit!

Commits pequenos e frequentes.

1. git switch develop
2. git switch -c feat/tela-login
3. Realize as alterações necessárias

4. git add .
5. git commit -m "style: Adiciona estilização do botão"
6. git push -u origin feat/tela-login

7. Abra o GitHub → New Pull Request
   base: develop ← compare: feature/tela-login
8. Adicione um reviewer e descreva o que foi feito
9. Aguarde aprovação, e merge para aprovação para atualizar a branch develop com git pull

**CUIDADO!!!** <br>
O PR é não é bagunça! 1 PR = 1 BRANCH<br>
- PR deve ter foco único - Uma feature, uma correção.<br>
- Descreva o que foi feito, por que e como testar.<br>
- Nunca seja reviewer do próprio PR.<br>
- Revise o PR do colega com cuidado.<br>
- PR pequeno é bem revisado; PR grande níguém revisa direito <br>

Também cuidado com os merges para não prejudicar o trabalho do amiguinho; Lembrando que **VOCÊ** em nenhuma hipótese, **NUNCA**, é o reviewer do próprio PR, isso não existe. Caso eu pegue isso acontecendo, será anotado como mal desempenho 🙂

## Authors

- [@GabrielPKTN](https://www.github.com/GabrielPKTN)
- [@mariacecilia-01](https://github.com/mariacecilia-01)
- [@AlineMaker](https://www.github.com/AlineMaker)
- [@nicolas16-sd](https://www.github.com/nicolas16-sd)
- [@EnzoCarrilho](https://www.github.com/EnzoCarrilho)

## REPS Antigos

- [Principal](https://github.com/GabrielPKTN/Espectra)
- [Front](https://github.com/GabrielPKTN/Espectra-Front)
- [Back](https://github.com/GabrielPKTN/Espectra-Back)
- [Mobile](https://github.com/GabrielPKTN/Espectra-Mobile)
- [Banco de Dados](https://github.com/GabrielPKTN/Espectra-BD)
