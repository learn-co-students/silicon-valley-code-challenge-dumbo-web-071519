require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console


#Startups created for testing

# s1 = Startup.new("SETRO", "Oscar", "Seeds")
# s2 = Startup.new("ErrandsApp", "Jorge V.", "Delivery")
# s3 = Startup.new("Gorditas", "Corea", "Food")
# s4 = Startup.new("Prepaid Services", "Daniel", "Personal Services")
# s5 = Startup.new("Expreco", "Jose", "Delivery")

#Venture Capitalists created for testing
# vc1 = VentureCapitalist.new("Richie Rich", 1500000.00)
# vc2 = VentureCapitalist.new("Gatsby", 5000000.00)
# vc3 = VentureCapitalist.new("Pancho", 700000.00)

#Funding Rounds for testing
# fr1 = FundingRound.new(s1, vc2, "Series C", 100000.00)
# fr2 = FundingRound.new(s2, vc2, "Series C", 100000.00)
# fr3 = FundingRound.new(s3, vc3, "Angel", 5000.00)
# fr4 = FundingRound.new(s4, vc1, "Seed", 10000.00)
# fr5 = FundingRound.new(s4, vc2, "Series B", 60000.00)
# fr6 = FundingRound.new(s5, vc1, "Series A", 25000.00)



binding.pry
0 #leave this here to ensure binding.pry isn't the last line