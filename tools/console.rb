require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
capitalist1=VentureCapitalist.new("Bill", 200000)
capitalist2=VentureCapitalist.new("Tom", 500000)
startup1=Startup.new("YOYO", "John", "NYC")
startup2=Startup.new("JIGI", "Mike", "NYC")
startup3=Startup.new("Moki", "David", "WA")
startup1.sign_contract(capitalist1, "IT", 100000)
startup1.sign_contract(capitalist2, "IT", 200000)
capitalist2.offer_contract(startup2, "Science", 250000)
#funding1=FundingRound.new(startup1, capitalist1, "IT", 100000)
binding.pry
0 #leave this here to ensure binding.pry isn't the last line

