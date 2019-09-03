 
object bomba { 
	var danio = 101
	
	method efectivo(){
	 return danio > 100
		
	}
	method capacidad(){
		return danio / 2
	}
}

object pocion {
	var poderCurativo = 150
	var materialesMisticos = []
	
	method agregarMaterial(materiales){
			materialesMisticos.add(materiales)
	}
	method efectivo(){
	 return poderCurativo > 100 && self.hayMateriales()
		
		}
	method hayMateriales(){
		return self.cantidadDeMateriales() >= 0
	}
	method capacidad(){
		return poderCurativo + (self.cantidadDeMateriales() * 10)
	}
	method cantidadDeMateriales(){
		return materialesMisticos.size()
	}
}
object debilitadores{
	var potencia = 10
	var materiales=[]
	
	method efectivo(){
		return potencia > 0 && self.hayMateriales().negate()
	}
	method hayMateriales(){
		return self.cantidadDeMateriales() < 0
	}
	method capacidad(){
		if (self.cantidadDeMateriales() == 0){
			return 5
		}else {
			return self.cantidadDeMateriales() * 12
		}
	}
	method cantidadDeMateriales(){
		return materiales.size()
	}
	method agregarMaterial(elemento){
		materiales.add(elemento)
	}
}
object alquimista {
	var itemsDeCombate = []
	var itemsDeRecoleccion = #{}
	method tieneCriterio(){
		return self.cantidadItemsDeCombateDivididoDos() <= self.cantidadItemsEfectivos()
	}
	method cantidadItemsDeCombateDivididoDos(){
		return (itemsDeCombate.size())/2
	}
	method cantidadItemsEfectivos(){
		return itemsDeCombate.count({item => item.efectivo()})
	}
	method buenExplorador(){
		return itemsDeRecoleccion.size() >= 3
	}
	method capacidadOfensiva(){
		return self.cuentaDeCapacidadOfensiva()
	}
	method cuentaDeCapacidadOfensiva(){
		return bomba.capacidad() + pocion.capacidad() + debilitadores.capacidad()
	}
	method esProfesional(){
		return self.calidad() > 50 && self.sonTodosItemsDeCombate() && self.buenExplorador()
			
		}	
	method calidad(){
		return self.capacidadOfensiva() / itemsDeCombate.size()
	}
	method agregarItem(elemento){
		itemsDeRecoleccion.add(elemento)
	}
	method agregarItemCombate(elemento){
		itemsDeCombate.add(elemento)
	}
	method sonTodosItemsDeCombate(){
		return itemsDeCombate.all({item=> item.efectivo()})
	}
} 



 /* 
object alquimista {
  var itemsDeCombate = []
  var itemDeRecoleccion = []
  
  method tieneCriterio() {
    return self.cantidadDeItemsDeCombateEfectivos() >= self.cantidadDeItemsDeCombate() / 2
  }
  
  method cantidadDeItemsDeCombate() {
    return itemsDeCombate.size()
  }
  
  method cantidadDeItemsDeCombateEfectivos() {
    return itemsDeCombate.count({ itemDeCombate =>
      itemDeCombate.esEfectivo()
    })
  }
  
  method agregarItem(elemento){
  	itemsDeCombate.add(elemento)
  }
  method esBuenExplorador(){
  	return self.cantidadDeItemDeRecoleccion()>=3
  }
  method cantidadDeItemDeRecoleccion (){
  	return itemDeRecoleccion.size()
  }
  method capacidadOfensiva(){
  	return itemsDeCombate.sum({item=>item.capacidadOfensiva()})
  }
}

object bomba {
  var danio = 15
  
  method esEfectivo() {
    return danio > 100
  }
  method capacidadOfensiva(){
  	return danio/2
  }
}

object pocion {
  var materiales = []
  var poderCurativo = 0
  
  method esEfectivo() {
    return poderCurativo > 50 and self.fueCreadaConAlgunMaterialMistico()
  }
  
  method fueCreadaConAlgunMaterialMistico() {
    return materiales.any({ material =>
      material.esMistico()
    })
  }
  method capacidadOfensiva(){
  	return poderCurativo + 10 * self.cantidadDeMaterialesMisticos() 
  }
  method cantidadDeMaterialesMisticos(){
  	return materiales.size()
  }
}

object debilitador {
  var materiales = []
  var potencia = 0
  
  method esEfectivo() {
    return potencia > 0 and self.fueCreadoPorAlgunMaterialMistico().negate()
  }
  
  method fueCreadoPorAlgunMaterialMistico() {
    return materiales.any({ material =>
      material.esMistico()
    })
  }

}
*/
























