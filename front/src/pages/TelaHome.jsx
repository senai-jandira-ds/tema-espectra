import InputHome from "../components/input/InputHome.jsx"
import ContainerHeader from "../components/ContainerHeader"
import ContainerPacientes from "../components/ContainerPacientes.jsx"
import Button from "../components/Button.jsx"
import { Filter } from "lucide-react"
import { useState } from "react"

function TelaHome() {

    const [pacientes, setPacientes] = useState([
        {
            "id": 1,
            "foto": "http://azure.blob.img",
            "nome": "Mario Augusto Ramos",
            "data_nascimento": "2010-08-12",
            "idade": 12,
            "diagnostico": "Autismo e TDAH",
            "serie_escolar": "2º Série",
            "grau_suporte": "Grau 3",
            "numero_registro": 2026040001
        },
        {
            "id": 2,
            "foto": "http://azure.blob.img/paciente2.jpg",
            "nome": "Ana Beatriz Oliveira",
            "data_nascimento": "2015-05-22",
            "idade": 8,
            "diagnostico": "TEA",
            "serie_escolar": "3º Ano",
            "grau_suporte": "Grau 1",
            "numero_registro": 2026040002
        },
        {
            "id": 3,
            "foto": "http://azure.blob.img/paciente3.jpg",
            "nome": "Lucas Henrique Souza",
            "data_nascimento": "2012-11-30",
            "idade": 11,
            "diagnostico": "TDAH e TOD",
            "serie_escolar": "5º Ano",
            "grau_suporte": "Grau 2",
            "numero_registro": 2026040003
        },
        {
            "id": 4,
            "foto": "http://azure.blob.img/paciente4.jpg",
            "nome": "Mariana Costa Silva",
            "data_nascimento": "2014-03-15",
            "idade": 12,
            "diagnostico": "Autismo",
            "serie_escolar": "6º Ano",
            "grau_suporte": "Grau 2",
            "numero_registro": 2026040004
        },
        {
            "id": 5,
            "foto": "http://azure.blob.img/paciente5.jpg",
            "nome": "Pedro Alencar Gomes",
            "data_nascimento": "2017-09-08",
            "idade": 8,
            "diagnostico": "TDAH",
            "serie_escolar": "3º Ano",
            "grau_suporte": "Grau 1",
            "numero_registro": 2026040005
        },
        {
            "id": 6,
            "foto": "http://azure.blob.img/paciente6.jpg",
            "nome": "Sofia Rocha Mendes",
            "data_nascimento": "2011-07-21",
            "idade": 14,
            "diagnostico": "Dislexia",
            "serie_escolar": "8º Ano",
            "grau_suporte": "Grau 1",
            "numero_registro": 2026040006
        },
        {
            "id": 7,
            "foto": "http://azure.blob.img/paciente7.jpg",
            "nome": "Gabriel Neves Cruz",
            "data_nascimento": "2016-01-30",
            "idade": 10,
            "diagnostico": "TEA e TDAH",
            "serie_escolar": "4º Ano",
            "grau_suporte": "Grau 2",
            "numero_registro": 2026040007
        },
        {
            "id": 8,
            "foto": "http://azure.blob.img/paciente8.jpg",
            "nome": "Beatriz Farias Lima",
            "data_nascimento": "2013-11-12",
            "idade": 12,
            "diagnostico": "TOD",
            "serie_escolar": "7º Ano",
            "grau_suporte": "Grau 2",
            "numero_registro": 2026040008
        },
        {
            "id": 9,
            "foto": "http://azure.blob.img/paciente9.jpg",
            "nome": "Enzo Gabriel Santos",
            "data_nascimento": "2019-05-04",
            "idade": 7,
            "diagnostico": "Autismo Grau 3",
            "serie_escolar": "1º Ano",
            "grau_suporte": "Grau 3",
            "numero_registro": 2026040009
        },
        {
            "id": 10,
            "foto": "http://azure.blob.img/paciente7.jpg",
            "nome": "Gabriel Neves Cruz",
            "data_nascimento": "2016-01-30",
            "idade": 10,
            "diagnostico": "TEA e TDAH",
            "serie_escolar": "4º Ano",
            "grau_suporte": "Grau 2",
            "numero_registro": 2026040007
        },
        {
            "id": 11,
            "foto": "http://azure.blob.img/paciente8.jpg",
            "nome": "Beatriz Farias Lima",
            "data_nascimento": "2013-11-12",
            "idade": 12,
            "diagnostico": "TOD",
            "serie_escolar": "7º Ano",
            "grau_suporte": "Grau 2",
            "numero_registro": 2026040008
        },
        {
            "id": 12,
            "foto": "http://azure.blob.img/paciente9.jpg",
            "nome": "Enzo Gabriel Santos",
            "data_nascimento": "2019-05-04",
            "idade": 7,
            "diagnostico": "Autismo Grau 3",
            "serie_escolar": "1º Ano",
            "grau_suporte": "Grau 3",
            "numero_registro": 2026040009
        }
    ])

    const [busca, setBusca] = useState('')

    const pacientesFiltrados = pacientes.filter((paciente) => 
        paciente.nome.toLowerCase().includes(busca.toLowerCase())
    )

    console.log(busca)
    console.log(pacientesFiltrados)

    return <div className="py-4 px-5 gap-8 flex flex-col h-screen">

        <ContainerHeader/>
        <main className="
        gap-2 flex flex-col justify-center items-center grow md:gap-8
        ">

            <div className="w-full flex gap-2 items-center justify-center">
                <InputHome busca={setBusca}/>
                <Filter className="text-(--bg-primary-color) size-8" />
            </div>
            <ContainerPacientes pacientes={pacientesFiltrados.length > 0 ? pacientesFiltrados : pacientes} />
            
            <Button>Adicionar paciente</Button>

        </main>

    </div>

}

export default TelaHome