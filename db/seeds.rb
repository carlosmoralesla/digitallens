# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#tipo de cliente
TypeClient.create(name: 'Natural');
TypeClient.create(name: 'Juridico');

#tipo de documentos
TypeDoc.create(type_client_id: '1'  ,name: 'DNI');
TypeDoc.create(type_client_id: '1'  ,name: 'RUC');
TypeDoc.create(type_client_id: '1'  ,name: 'Pasaporte');
TypeDoc.create(type_client_id: '1'  ,name: 'Carnet de Extranjería');
TypeDoc.create(type_client_id: '2'  ,name: 'RUC');
TypeDoc.create(type_client_id: '2'  ,name: 'RUS');


#cuentas y usuarios
Account.create(name: 'Arturo',last_name:'Villanueva',second_surname: 'Jimenez' )
Account.create(name: 'Franco',last_name:'Villanueva',second_surname: 'Jimenez' )
User.create(account_id: '1',email: 'avillanueva@digitallens.com',password: '123456')
User.create(account_id: '2',email: 'fvillanueva@digitallens.com',password: '123456')


#colores
LentColor.create(name: 'Ninguno')
LentColor.create(name: 'Amarillo')
LentColor.create(name: 'Verde')
LentColor.create(name: 'Rojo')
LentColor.create(name: 'Azul')

#marcas
LentMark.create(name: 'Marca 1')
LentMark.create(name: 'Marca 2')

#modelos
LentModel.create(name: 'Modelo 1',lent_mark_id: '1')
LentModel.create(name: 'Modelo 2',lent_mark_id: '1')
LentModel.create(name: 'Modelo 1',lent_mark_id: '2')
LentModel.create(name: 'Modelo 2',lent_mark_id: '2')


#tipo de lente
LentType.create(name: 'Esfera')
LentType.create(name: 'Cilindro')
LentType.create(name: 'Eje')
LentType.create(name: 'D.I.P')

#tipo de lmontura
MontureType.create(name: 'Montura 1')
MontureType.create(name: 'Montura 2')

#tipo de lmontura
LentKind.create(name: 'Oftálmico')
LentKind.create(name: 'Cosmético')
