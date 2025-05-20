const obj1 = new Materia(cupo = 50)
class Materia{ // 
    const enEspera = []
    const inscriptos = #{}
    const cupo//!!!!!!!

    method enEspera(){
        return enEspera
    }

    //matematica1.darDeBaja(mengano)
    method darDeBaja(estudiante){
        inscriptos.remove(estudiante)
        if(self.hayCupo()){
            self.actualizarInscriptos()
        }
    }

    method hayCupo(){
        return self.cantidadInscriptos() < cupo
    }

        method cantidadInscriptos(){
        return inscriptos.size()
    }

    method actualizarInscriptos(){
        if(self.hayEnEspera()){
            inscriptos.add(self.prioritario())
            enEspera.remove(self.prioritario())
        }
    }

    method hayEnEspera(){
        return not enEspera.isEmpty()
    }

    method prioritario() = enEspera.head()

}

class Carrera{
    const materias = #{}

    method tiene(materia){
        return materias.contains(materia)
    }

}

class Aprobada{
    const property nota
    const property materia

    method esDe(_materia){
        return materia == _materia
    }
}

class Estudiante{
    const carreras = #{}
    const aprobadas = #{}

    method aprobar(materia, nota){
        self.validarAprobar(materia)
        aprobadas.add(new Aprobada(materia = materia, nota = nota))
    }

    method validarAprobar(materia){
        if(not self.debeAprobar(materia)){
            self.error("No se puede aprobar!")
        }
    }

    method debeAprobar(materia){
        return self.tieneEnCarrera(materia) and 
              not self.tieneAprobada(materia)
              
    }

    method tieneEnCarrera(materia){
        return carreras.any({ carrera => carrera.tiene(materia)})
    }


    method materiasAprobadas(){
        return aprobadas.map({aprobada => aprobada.materia()}).asSet()
    }

    method tieneAprobada(materia){
        return aprobadas.any({ aprobada => aprobada.esDe(materia)})
    }

    method aprobadas(){
        return aprobadas
    }
}

object universidad{

}

