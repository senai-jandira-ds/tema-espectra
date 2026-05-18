import CardPaciente from "./card-paciente/CardPaciente"

function ContainerPacientes(props) {

    const arrayPacientes = props.pacientes

    if(arrayPacientes.length > 0) {

        let arrayComponentes = []

        arrayPacientes.forEach(paciente => {

            arrayComponentes.push(CardPaciente(paciente))
        
        })

        for (let i = 0; i < arrayComponentes.length; i++) {
            return <div className="mask-b-to-transparent mask-b-from-95% mask-t-to-transparent mask-t-from-95% scrollbar-custom gap-1 py-4 h-[70dvh] relative items-center flex flex-col overflow-y-auto md:grid md:grid-cols-2 md:place-items-center md:mask-t-from-98% md:mask-b-from-98% lg:h-[60dvh] lg:grid-cols-3 lg:px-8 lg:gap-8 lg:place-items-start">
                {arrayComponentes}
            </div>            
        }

    } else {
        return <div className="h-full flex items-center justify-center">
            <p className="text-(--bg-primary-color) font-instrument-sans font-semibold text-2xl">Selecione um paciente, ou adicione um.</p>
        </div> 
    }


}

export default ContainerPacientes