import IconApp from "../assets/logotipos/logo.png"
import ContainerUserPhoto from "./photo-components/ContainerUserPhoto"

function ContainerHeader() {

    return <header className="flex justify-between items-center w-full">
        <img src={IconApp} alt="icone da aplicação" className="w-auto h-10"/>
        <ContainerUserPhoto/>
    </header>
    

}

export default ContainerHeader