import {CircleUser} from 'lucide-react'

function ContainerPacientePhoto(props) {

    if (props) {

        return <div className={`
        shrink-0 rounded-[50%] mx-2 size-15 overflow-hidden
        `}>
            <CircleUser className="object-cover w-full h-full text-(--bg-primary-color)"/>
        </div>

    } else {
        
        return <div className={`
        border border-(--bg-primary-color) shrink-0 rounded-[50%] mx-2 size-15 overflow-hidden
        `}>
            <img src={props.foto} alt="user photo" className="object-cover w-full h-full" />
        </div>

    }

    

}

export default ContainerPacientePhoto