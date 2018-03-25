class UserMailer < ApplicationMailer
	def buy_email(user, cart, sum, foodtruck)
		headers['X-MJ-CustomID'] = 'rubyPR_Test_ID_1469790724'
		headers['X-MJ-EventPayload'] = 'rubyPR_Test_Payload'
		headers['X-MJ-TemplateLanguage'] = 'true'	
    	@user, @cart, @sum, @foodtruck = user, cart, sum, foodtruck
        Dotenv.load
		mail(
    		delivery_method_options: { api_key: ENV['MAILJET_API_KEY'], secret_key: ENV['MAILJET_SECRET_KEY'], port: '25' },
    		from: "findyourtruck@gmx.fr",
    		to: @user.email,
    		subject: 'Détails de votre commande')
    end

    def actual_email(follower, foodtrucker)
        headers['X-MJ-CustomID'] = 'rubyPR_Test_ID_1469790724'
        headers['X-MJ-EventPayload'] = 'rubyPR_Test_Payload'
        headers['X-MJ-TemplateLanguage'] = 'true'
        @follower = follower
        @foodtrucker = foodtrucker
        Dotenv.load
        mail(
            delivery_method_options: { api_key: ENV['MAILJET_API_KEY'], secret_key: ENV['MAILJET_SECRET_KEY'], port: '25' },
            from: "findyourtruck@gmx.fr",
            to: follower.email,
            subject: "Un de vos foodtrucks préférés est en ligne!")
    end
end
