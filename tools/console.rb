require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

smarttech = Startup.new("Smart Tech Inc", "Cheyenne Amos", "smarttech.io")
thawify = Startup.new("Thawify Co.", "Daniel Murphy", "thawify.co")
propertyly = Startup.new("Propertyly", "Maddie Collins", "propertyly.com")

miyazaki = VentureCapitalist.new("Miyazaki", 5000000000)
haru = VentureCapitalist.new("Haru", 1000000000)
laura = VentureCapitalist.new("Laura", 1000000000)
marie = VentureCapitalist.new("Marie", 99000000000)
grace = VentureCapitalist.new("Grace", 100000000000)

funding1 = FundingRound.new(grace,"Angel", smarttech, 500000000)
funding2 = FundingRound.new(grace,"Seed", thawify, 100000000)
funding2a = FundingRound.new(grace,"Angel", smarttech, 20000000000)

funding3 = FundingRound.new(marie, "Series A", propertyly, 1000000)
funding4 = FundingRound.new(marie, "Series C", propertyly, 3000000)

funding5 = FundingRound.new(laura, "Series A", propertyly, 1000000)
funding6 = FundingRound.new(laura, "Angel", smarttech, 4000000)

funding7 = FundingRound.new(haru, "Seed", thawify, 500000)

funding8 = FundingRound.new(miyazaki, "Seed", thawify, 500000)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line