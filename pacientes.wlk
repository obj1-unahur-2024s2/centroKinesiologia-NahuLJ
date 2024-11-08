class Paciente {
  const edad
  var nivelFortalezaMuscular
  var nivelDolor
  const rutinaAsignada = []

  method edad() = edad

  method nivelFortalezaMuscular() = nivelFortalezaMuscular

  method nivelDolor() = nivelDolor

  method disminuirFortalezaMuscularEn(unaCantidad){
    nivelFortalezaMuscular = 0.max(nivelFortalezaMuscular - unaCantidad)
  }

  method aumentarFortalezaMuscularEn(unaCantidad){
    nivelFortalezaMuscular += unaCantidad
  }

  method disminuirNivelDeDolorEn(unaCantidad){
    nivelDolor = 0.max(nivelDolor - unaCantidad)
  }
  
  method aumentarNivelDeDolorEn(unaCantidad){
    nivelDolor += unaCantidad
  }

  method puedeRealizarSuRutina() = rutinaAsignada.all({aparato => aparato.puedeSerUsadoPor(self)})

  method realizarRutina(){
    if (not self.puedeRealizarSuRutina()){
      self.error("el paciente no puede realizar su rutina")
    }
    rutinaAsignada.forEach({aparato => aparato.realizarTratamientoEn(self)})
  }
}