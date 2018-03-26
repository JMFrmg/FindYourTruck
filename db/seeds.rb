# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email:"jean.bernard@gmail.com", username:"jeanbernard", postalcode:"67000", password:"jeanbernard", password_confirmation:"jeanbernard")
User.create(email:"alfred.duverger@gmail.com", username:"alfred", postalcode:"67000", password:"alfredduverger", password_confirmation:"alfredduverger")
User.create(email:"xavier.leboucher@gmail.com", username:"xavier", postalcode:"67000", password:"xavierleboucher", password_confirmation:"xavierleboucher")
User.create(email:"edouard.lachaise@gmail.com", username:"edouard", postalcode:"67000", password:"edouardlachaise", password_confirmation:"edouardlachaise")

Foodtrucker.create(email:"simon.pierre@gmail.com", username:"Simon Lierre", postalcode:"67000", password:"simonpierre", password_confirmation:"simonpierre")
Foodtrucker.create(email:"jacques.le.majeur@gmail.com", username:"jacques Lemajeur", postalcode:"67000", password:"jacqueslemajeur", password_confirmation:"jacqueslemajeur")
Foodtrucker.create(email:"philippe@gmail.com", username:"philippe", postalcode:"67000", password:"philippe", password_confirmation:"philippe")
Foodtrucker.create(email:"simon.le.zelote@gmail.com", username:"simon Lezelote", postalcode:"67000", password:"simonlezelote", password_confirmation:"simonlezelote")

Street.create(address:"7 place Brooglie, Strasbourg, France", postalcode:"67000", city:"Strasbourg", foodtrucker_id:"1")
Street.create(address:"12 avenue de la paix, Strasbourg, France", postalcode:"67000", city:"Strasbourg", foodtrucker_id:"1")
Street.create(address:"23 rue des Orphelins, Strasbourg, France", postalcode:"67000", city:"Strasbourg", foodtrucker_id:"1",actual: true)
Street.create(address:"8 rue de Rathsamhausen, Strasbourg, France", postalcode:"67100", city:"Strasbourg", foodtrucker_id:"1")
Street.create(address:"112 avenue de Colmar, Strasbourg, France", postalcode:"67100", city:"Strasbourg", foodtrucker_id:"1")
Street.create(address:"35 rue Boecklin, Strasbourg, France", postalcode:"67000", city:"Strasbourg", foodtrucker_id:"2")
Street.create(address:"24 allee des Comtes, Strasbourg, France", postalcode:"67200", city:"Strasbourg", foodtrucker_id:"2",actual: true)
Street.create(address:"44 boulevard de la Marne, Strasbourg, France", postalcode:"67000", city:"Strasbourg", foodtrucker_id:"3",actual: true)
Street.create(address:"24 avenue Aristide Briand, Strasbourg, France", postalcode:"67100", city:"Strasbourg", foodtrucker_id:"3")
Street.create(address:"16 place Brooglie, Strasbourg, France", postalcode:"67000", city:"Strasbourg", foodtrucker_id:"4", actual: true)

Admin.create(email:"matthieu.colombert@gmail.com", username:"matthieu", postalcode:"67000", password:"matthieu", password_confirmation:"matthieu")

Menu.create(name:"Burgers aux steaks de sauterelles accompagnes d'algues frites", foodtrucker_id:"1")
Menu.create(name:"Liqueurs de meduses et cuvee speciale au venin de scorpion", foodtrucker_id:"2")
Menu.create(name:"Harengs farcis et creme de norvege", foodtrucker_id:"3")
Menu.create(name:"Sandwichs mayonnaise saucisson accompagnes de chips", foodtrucker_id:"4")


Dish.create(name:"Liqueur de prunes au venin de mygales", price:"9", menu_id:"2")
Dish.create(name:"Liqueur de figues au crapeau buffle", price:"11", menu_id:"2")
Dish.create(name:"Liqueur de poisson-lion", price:"7", menu_id:"2")
Dish.create(name:"Sandwich mortadelle et mayo basilic", price:"13.6", menu_id:"4")
Dish.create(name:"Sandwich rosette et mayo poivree", price:"4,7", menu_id:"4")
Dish.create(name:"Sandwich rosette et mayo classique", price:"5,8", menu_id:"4")
