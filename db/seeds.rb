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

Foodtrucker.create(email:"simon.pierre@gmail.com", username:"simonpierre", postalcode:"67000", password:"simonpierre", password_confirmation:"simonpierre")
Foodtrucker.create(email:"jacques.le.majeur@gmail.com", username:"jacqueslemajeur", postalcode:"67000", password:"jacqueslemajeur", password_confirmation:"jacqueslemajeur")
Foodtrucker.create(email:"philippe@gmail.com", username:"philippe", postalcode:"67000", password:"philippe", password_confirmation:"philippe")
Foodtrucker.create(email:"simon.le.zelote@gmail.com", username:"simonlezelote", postalcode:"67000", password:"simonlezelote", password_confirmation:"simonlezelote")

Street.create(adress:"7 place Brooglie", postalcode:"67000", city:"Strasbourg", foodtrucker_id:"1")
Street.create(adress:"12 avenue de la paix", postalcode:"67000", city:"Strasbourg", foodtrucker_id:"1")
Street.create(adress:"23 rue des Orphelins", postalcode:"67000", city:"Strasbourg", foodtrucker_id:"1")
Street.create(adress:"8 rue de Rathsamhausen", postalcode:"67100", city:"Strasbourg", foodtrucker_id:"1")
Street.create(adress:"112 avenue de Colmar", postalcode:"67100", city:"Strasbourg", foodtrucker_id:"1")
Street.create(adress:"35 rue Boecklin", postalcode:"67000", city:"Strasbourg", foodtrucker_id:"2")
Street.create(adress:"24 allee des Comtes", postalcode:"67200", city:"Strasbourg", foodtrucker_id:"2")
Street.create(adress:"44 boulevard de la Marne", postalcode:"67000", city:"Strasbourg", foodtrucker_id:"3")
Street.create(adress:"24 avenue Aristide Briand", postalcode:"67100", city:"Strasbourg", foodtrucker_id:"3")
Street.create(adress:"16 place Brooglie", postalcode:"67000", city:"Strasbourg", foodtrucker_id:"4")

Admin.create(email:"matthieu.colombert@gmail.com", username:"matthieu", postalcode:"67000", password:"matthieu", password_confirmation:"matthieu")

Menu.create(description:"Burgers aux steaks de sauterelles accompagnes d'algues frites", foodtrucker_id:"1")
Menu.create(description:"Liqueurs de meduses et cuvee speciale au venin de scorpion", foodtrucker_id:"2")
Menu.create(description:"Harengs farcis et creme de norvege", foodtrucker_id:"3")
Menu.create(description:"Sandwichs mayonnaise saucisson accompagnes de chips", foodtrucker_id:"4")


Dish.create(name:"Liqueur de prunes au venin de mygales", menu_id:"2")
Dish.create(name:"Liqueur de figues au crapeau buffle", menu_id:"2")
Dish.create(name:"Liqueur de poisson-lion", menu_id:"2")
Dish.create(name:"Sandwich mortadelle et mayo basilic", menu_id:"4")
Dish.create(name:"Sandwich rosette et mayo poivree", menu_id:"4")
Dish.create(name:"Sandwich rosette et mayo classique", menu_id:"4")