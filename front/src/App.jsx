import { useState } from "react";
import React from "react";
import Rotas from "./routes/Routes";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import TelaInicial from "./pages/TelaInicial";
import TelaCadastro from "./pages/TelaCadastro";
import TelaHome from "./pages/TelaHome";

//O APP SERVIRÁ COMO GERENCIADOR DE ROTAS. COMO AS PAGINAS SAO MUITO DIFERENTES UMA DAS OUTRAS, NAO TEM A POSSIBILIDADE DE HAVER UM LAYOUT PADRAO PARA SER COLOCADO AQUI.
// AS PAGINAS DEVEM SER CRIADAS NA PASTA PAGES.
function App() {
  // return <Rotas />;
  return <TelaHome />
}

export default App;
