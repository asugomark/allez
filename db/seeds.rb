#Create the counties seed

counties = [
			"Mombasa","Kwale","Kilifi","Tana River","Lamu","Taita-Taveta","Garissa",
			"Wajir","Mandera","Marsabit","Isiolo","Meru","Tharaka-Nithi","Embu","Kitui",
			"Machakos","Makueni","Nyandarua","Nyeri","Kirinyaga","Murang'a","Kiambu",
			"Turkana","West Pokot","Samburu","Trans Nzoia","Uasin Gishu","Elgeyo-Marakwet",
			"Nandi","Baringo","Laikipia","Nakuru","Narok","Kajiado","Kericho","Bomet",
			"Kakamega","Vihiga","Bungoma","Busia","Siaya","Kisumu","Homa Bay","Migori",
			"Kisii","Nyamira","Nairobi"
		]

counties.map { |county|  
	County.create!(
		name: county,
		code: county.upcase.gsub(' ', '-'),
		is_active: true
		)
}
