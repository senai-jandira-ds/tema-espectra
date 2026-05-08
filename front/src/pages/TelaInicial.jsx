import logo from "../assets/logotipos/logo.png";
import photo_main from "../assets/general_photos/photo_main.png";
import NavItem from "../components/NavItem";
import { useNavigate, useSearchParams } from "react-router-dom";
import Button from "../components/Button";

function TelaInicial() {
  const navigate = useNavigate();

  return (
    // div que gurdar tudo na tela.
    <div className="w-screen h-full flex flex-col">
      {/* header */}
      <div className="flex justify-between items-center p-1">
        <img src={logo} alt="logotipo espectra" className="p-4 w-32" />

        {/* NECESSÁRIO COLOCAR OS LINKS DEPOIS */}
        <nav>
          <ul className="flex gap-2 p-3 inclusive-sans font-normal text-lg text-black">
            <NavItem href="https://github.com/GabrielPKTN/Espectra-Front.git">
              Contato
            </NavItem>
            <NavItem href="https://github.com/GabrielPKTN/Espectra-Front.git">
              Sobre
            </NavItem>
            <NavItem href="/Login">Login</NavItem>
          </ul>
        </nav>
      </div>

      {/* main */}
      <div className="flex flex-col items-center justify-between">
        <div className="my-14 flex flex-col items-center">
          {/* div do texto que existe no header */}
          <div className="flex flex-col m-8">
            <p className="imprima-regular text-2xl">BEM VINDO AO</p>
            <h1 className="inclusive-sans font-bold text-6xl dark-blue">
              ESPECTRA
            </h1>
            <span className="inclusive-sans text-xl font-light">
              Acompanhe, registre e celebre cada passo do desenvolvimento.
            </span>
          </div>

          <Button
            variantClick="basicClick"
            onClick={() => navigate("/cadastro")}
          >
            Comece a usar
          </Button>
        </div>
        <div className="grow">
          <img src={photo_main} alt="imagem-prof" className="object-contain" />
        </div>
      </div>
    </div>
  );
}

export default TelaInicial;
