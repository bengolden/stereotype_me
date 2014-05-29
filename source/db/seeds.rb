require 'faker'

50.times do
  User.create(email: Faker::Internet.email, password: "password", image_url: "http://www.spatch.net/cattown/cat-businessman.jpg")
end

Property.create(question: "How old am I?", endpoint1: '0', endpoint2: '100')
Property.create(question: "Am I a hipster or a yuppie?", endpoint1: "Hipster", endpoint2: "Yuppie")
Property.create(question: "What is my net worth?", endpoint1: "$0", endpoint2: "$150K+")
Property.create(question: "Do I prefer dogs or cats?", endpoint1: "Dogs", endpoint2: "Cats")
Property.create(question: "Do I own or rent my home?", endpoint1: "Own", endpoint2: "Rent")
Property.create(question: "Do I live in a city or the country?", endpoint1: "City", endpoint2: "Country")
Property.create(question: "How big a douchebag am I?", endpoint1: "0", endpoint2: "100")
Property.create(question: "How educated am I?", endpoint1: "Kindergarten", endpoint2: "Multiple PhDs")
Property.create(question: "What is my IQ?", endpoint1: "60", endpoint2: "140+")

User.all.each do |user|
  5.times do
    voted_on = (User.all - [user]).sample
    user.votes_submitted << Vote.create(voted_on_id: voted_on.id, property_id: Property.all.sample.id, value: rand(0..100))
  end
end
