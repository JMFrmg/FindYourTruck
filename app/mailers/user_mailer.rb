class UserMailer < ApplicationMailer
	def buy_email(user, dishes, foodtruck)
		headers['X-MJ-CustomID'] = 'rubyPR_Test_ID_1469790724'
		headers['X-MJ-EventPayload'] = 'rubyPR_Test_Payload'
		headers['X-MJ-TemplateLanguage'] = 'true'	
    	@user, @dishes, @foodtruck = user, dishes, foodtruck
        Dotenv.load
		mail(
    		delivery_method_options: { api_key: ENV['MAILJET_API_KEY'], secret_key: ENV['MAILJET_SECRET_KEY'], port: '25' },
    		from: "edouard.dumuguet@gmx.fr",
    		to: @user.email,
    		subject: 'Détails de votre commande')
    end
end
