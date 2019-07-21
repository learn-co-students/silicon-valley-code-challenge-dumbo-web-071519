require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
applebright = Startup.new("AppleBright", "Ashna", "Zen")
diamondDeal = Startup.new("DiamondDeal", "Manish", "Diamonds")
eccentricSoul = Startup.new("EccentricSoul", "Leo", "Music")
fzi = Startup.new("FZI", "SokeiAn", "Zen")

isa = VentureCapitalist.new("Isabel", 2000000000)
reidar = VentureCapitalist.new("Reidar", 7000000000)
allie = VentureCapitalist.new("Allie", 1000000000)
willis = VentureCapitalist.new("Willis", 400)

applebright.sign_contract(isa, "A", 3500)
applebright.sign_contract(isa, "A", 3500)
diamondDeal.sign_contract(isa, "A", 3500)
applebright.sign_contract(allie, "B", 5670)

reidar.offer_contract(eccentricSoul, "B", 54638)
willis.offer_contract(diamondDeal, "R", 3400)
isa.offer_contract(eccentricSoul, "B", 34552)
isa.offer_contract(fzi, "B", 350)


binding.pry

0 #leave this here to ensure binding.pry isn't the last line
