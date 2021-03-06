require 'faker'


images = ["http://www.spatch.net/cattown/cat-businessman.jpg", "http://img3.wikia.nocookie.net/__cb20130606164012/animalcrossing/images/3/30/Monkey.jpg"]
50.times do
  User.create(email: Faker::Internet.email, password: "password", image_url: images.sample)
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
    user.submitted_votes << Vote.create(voted_on_id: voted_on.id, property: Property.all.sample, value: rand(0..100))
  end
end
