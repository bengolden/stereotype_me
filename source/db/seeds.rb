require 'faker'

50.times do
  User.create({email: Faker::Internet.email, password: "password"})
end

Attribute.create(question: "How old am I?", endpoint1: '0', endpoint2: '100')
Attribute.create(question: "Am I a hipster or a yuppie?", endpoint1: "Hipster", endpoint2: "Yuppie")
Attribute.create(question: "What is my net worth?", endpoint1: "$0", endpoint2: "$150K+")
Attribute.create(question: "Do I prefer dogs or cats?", endpoint1: "Dogs", endpoint2: "Cats")
Attribute.create(question: "Do I own or rent my home?", endpoint1: "Own", endpoint2: "Rent")
Attribute.create(question: "Do I live in a city or the country?", endpoint1: "City", endpoint2: "Country")
Attribute.create(question: "", endpoint1: , endpoint2: )
Attribute.create(question: , endpoint1: , endpoint2: )
Attribute.create(question: , endpoint1: , endpoint2: )
