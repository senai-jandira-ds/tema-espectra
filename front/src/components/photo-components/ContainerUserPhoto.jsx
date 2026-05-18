import PerfilFoto from "../../assets/general_photos/larissa-photo.png"

function ContainerUserPhoto() {

    return <div className={`border border-(--bg-primary-color) rounded-[50%] size-10 overflow-hidden md:size-16`}>
        <img src={PerfilFoto} alt="user photo" className="object-cover w-full h-full" />
    </div>

}

export default ContainerUserPhoto