class Aparato {
  var color = "blanco"

  method color() = color
  
  method realizarTratamientoEn(unPaciente){
    if(not self.puedeSerUsadoPor(unPaciente)){
      self.error("El paciente no cumple los requisitos para usar este aparato")
    }
  }

  method puedeSerUsadoPor(unPaciente) 

}

class Magneto inherits Aparato{
  var puntosImantacion = 800
  
  method puntosImantacion() = puntosImantacion
  
  override method realizarTratamientoEn(unPaciente){
    super(unPaciente)
    unPaciente.disminuirNivelDeDolorEn(unPaciente.nivelDolor() * 0.1)
    self.sufrirConsecuenciasConUsoDe(unPaciente)
  }

  override method puedeSerUsadoPor(unPaciente) = true

  method sufrirConsecuenciasConUsoDe(unPaciente){
    puntosImantacion = 0.max(puntosImantacion - 1)
  }

  method necesitaMantenimiento() = puntosImantacion < 100

  method realizarMantenimiento(){
    if(self.necesitaMantenimiento()){
      puntosImantacion += 500  
    }
  }
}

class Bicicleta inherits Aparato{
  var cantidadDesajustesTornillos = 0
  var cantidadPerdidasAceite = 0

  method cantidadDesajustesTornillos() = cantidadDesajustesTornillos
  
  method cantidadPerdidasAceite() = cantidadPerdidasAceite

  override method realizarTratamientoEn(unPaciente){
    super(unPaciente)
    self.sufrirConsecuenciasConUsoDe(unPaciente)
    unPaciente.disminuirNivelDeDolorEn(4) 
    unPaciente.aumentarFortalezaMuscularEn(3)
  }

  override method puedeSerUsadoPor(unPaciente) = unPaciente.edad() > 8

  method sufrirConsecuenciasConUsoDe(unPaciente){
    if(unPaciente.nivelDolor() > 30){
      cantidadDesajustesTornillos += 1
    }

    if(unPaciente.edad().between(30, 50)){
      cantidadPerdidasAceite += 1
    }
  }

  method necesitaMantenimiento() = 
    cantidadDesajustesTornillos >= 10 or cantidadPerdidasAceite >= 5

  method realizarMantenimiento(){
    if(self.necesitaMantenimiento()){
      cantidadDesajustesTornillos = 0
      cantidadPerdidasAceite = 0 
    }
  }
}

class Minitramp inherits Aparato {

  override method realizarTratamientoEn(unPaciente){
    super(unPaciente)
    unPaciente.aumentarFortalezaMuscularEn(unPaciente.edad() * 0.1)
  }

  override method puedeSerUsadoPor(unPaciente) = unPaciente.nivelDolor() < 20

  method sufrirConsecuencias(){}

  method necesitaMantenimiento() = false

  method realizarMantenimiento() {}
}

object centroKinesiologico {
  const aparatos = []
  const pacientes = []


  method agregarAparatos(unosPacientes){
    aparatos.addAll(unosPacientes)
  }

  method agregarPacientes(unosPacientes){
    pacientes.addAll(unosPacientes)
  }

  method coloresDeLasMaquinas() = aparatos.map({aparato => aparato.color()}).asSet()

  method pacientesMenores() = pacientes.filter({paciente => paciente.edad() < 8})

  method cantidadPacientesQueNoPuedenHacerSuRutina() = 
    pacientes.filter({paciente => not paciente.puedeRealizarSuRutina()}).size()

  method estaEnOptimasCondiciones() = aparatos.all({aparato => not aparato.necesitaMantenimiento()})
  
  method estaComplicado() =
    aparatos.filter({aparato => aparato.necesitaMantenimiento()}).size() >= 
    (aparatos.size() / 2).roundUp()
  
  method registrarVisitaTecnica(){
    aparatos.forEach({aparato => aparato.realizarMantenimiento()})
  }
}