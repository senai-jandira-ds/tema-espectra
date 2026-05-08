import { Search } from "lucide-react";

function InputHome(

    props

) {


    return <div className="w-full">
        <div className="flex items-center justify-center w-full h-12 relative border-2 border-(--bg-primary-color) rounded-xl">
            <input type="text" className="pl-4 pr-4 h-full w-full font-inclusive-sans rounded-lg focus:outline-none" placeholder="Digite o nome do paciente..." onChange={(event) => props.busca(event.target.value)}/>
            <div className="cursor-pointer pr-2">
                <Search className="text-(--bg-primary-color)"/>
            </div>
        </div>
    </div>

}

export default InputHome