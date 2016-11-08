# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "creo publicaciones"
	Publication.find_or_create_by(titulo:"Reencontrarme con Ramírez", descripcion:"Ramirez es un burrito que tenía de mascota en un campo en Tucumán. Quisiera reencontrarme con él pero no puedo moverme por un problema físico. Me gustaría que alguien lo traiga desde mi pueblo para poder saludarlo y luego volver a llevarlo. *la foto es del 2004, Ramirez puede haber cambiado un poco", ciudad:"Santa Rosa", foto:"http://68.media.tumblr.com/19f28ea147374e0468cf1bcf6d6ce5ad/tumblr_oco4vrOoFU1ve7p69o2_1280.jpg")
	Publication.find_or_create_by(titulo:"Busco acompañante de viaje", descripcion:"Soy camionero y busco una persona que me acompañe en mi viaje hasta Rawson porque sufro problemas de sueño. Saldríamos el primer fin de semana de octubre y retornaríamos el fin de semana siguiente. * Condición fundamental: debe cebar buenos mates", ciudad:"Rosario")
	Publication.find_or_create_by(titulo:"Busco testigo falso", descripcion:"El año pasado tuve un accidente automovilístico en el que choqué el frente de una casa. El dueño de esa casa me quiere llevar a juicio y estoy buscando evitarlo. Necesito de un/a abuelito/a que testifique a mi favor diciendo que choqué el frente de la casa por esquivarlo/a.", ciudad:"Córdoba")
	Publication.find_or_create_by(titulo:"Karl",descripcion:"Karl es mi perrito y necesita de alguien que lo cuide durante la primera quincena de enero que me voy de vacaciones. Es muy juguetón y muy buena compañía.",ciudad:"Capital Federal",foto:"http://68.media.tumblr.com/de91daf5796e0b24cf56a1b9bbf751de/tumblr_oco43ijzOj1ve7p69o1_1280.jpg")
	Publication.find_or_create_by(titulo:"Restaurar obra de arte",descripcion:"La imagen de la izquierda es la original y la de la derecha mi intento por restaurarla. ¿Alguien me haría la gauchada de acomodarla para que se parezca más a la original?",ciudad:"Junín",foto:"http://68.media.tumblr.com/1896249806d9782c28ff10189280cc01/tumblr_oco56fpa3O1ve7p69o1_500.jpg")

puts "creo los logros"
	Achievement.find_or_create_by(nombre: "Mal Tipo", rangoMin: -50, rangoMax: -1)
	Achievement.find_or_create_by(nombre: "Observador", rangoMin: 0, rangoMax: 0)
	Achievement.find_or_create_by(nombre: "Buen Tipo", rangoMin: 1, rangoMax: 1)
	Achievement.find_or_create_by(nombre: "Gran Tipo", rangoMin: 2, rangoMax: 5)
	Achievement.find_or_create_by(nombre: "Tipazo", rangoMin: 6, rangoMax: 10)
	Achievement.find_or_create_by(nombre: "Héroe", rangoMin: 11, rangoMax: 20)
	Achievement.find_or_create_by(nombre: "Nobleza Gaucha", rangoMin: 21, rangoMax: 50)
	Achievement.find_or_create_by(nombre: "Dios", rangoMin: 51, rangoMax: 100)