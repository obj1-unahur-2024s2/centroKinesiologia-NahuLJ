class Paciente {
  const edad
  var nivelFortalezaMuscular
  var nivelDolor

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

}