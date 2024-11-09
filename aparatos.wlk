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
  
  override method realizarTratamientoEn(unPaciente){
    super(unPaciente)
    unPaciente.disminuirNivelDeDolorEn(unPaciente.nivelDolor() * 0.1)
  }

  override method puedeSerUsadoPor(unPaciente) = true
}

class Bicicleta inherits Aparato{

  override method realizarTratamientoEn(unPaciente){
    super(unPaciente)
    unPaciente.disminuirNivelDeDolorEn(4) 
    unPaciente.aumentarFortalezaMuscularEn(3)
  }

  override method puedeSerUsadoPor(unPaciente) = unPaciente.edad() > 8
}

class Minitramp inherits Aparato {

  override method realizarTratamientoEn(unPaciente){
    super(unPaciente)
    unPaciente.aumentarFortalezaMuscularEn(unPaciente.edad() * 0.1)
  }

  override method puedeSerUsadoPor(unPaciente) = unPaciente.nivelDolor() < 20
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

  method cantidadpPacientesQueNoPuedenHacerSuRutina() = 
    pacientes.filter({paciente => not paciente.puedeRealizarSuRutina()}).size()
}