import ContainerPacientePhoto from "./ContainerPacientePhoto"
import LabelInfoCard from "./LabelInfoCard"

function CardPaciente(props) {

    return <div key={props.id} className="
    bg-white shadow-lg w-[90%] h-full max-h-35 justify-between items-center rounded-3xl p-2 flex border-2 border-(--bg-primary-color) md:w-full">

        <ContainerPacientePhoto/>
        <div className="flex flex-col w-full justify-center">
            <span className="
            text-(--bg-primary-color) font-instrument-sans font-bold w-full text-xl p-1
            ">{props.nome}</span>
            <div className="p-1 flex justify-start flex-row h-auto gap-1 flex-wrap">
                <LabelInfoCard info={`${props.idade} ANOS`} ></LabelInfoCard>
                <LabelInfoCard info={props.numero_registro} ></LabelInfoCard>
                <LabelInfoCard info={props.serie_escolar} ></LabelInfoCard>
                <LabelInfoCard info={props.diagnostico} ></LabelInfoCard>
                <LabelInfoCard info={props.grau_suporte} ></LabelInfoCard>
            </div>
        </div>
    </div>
}

export default CardPaciente