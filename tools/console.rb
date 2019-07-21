require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
#name, total worth
ashton = VentureCapitalist.new("Ashton",1500000000)
bill = VentureCapitalist.new("Bill",3500000000)
mark = VentureCapitalist.new("Mark",525000000)

#name,founder, domain
square = Startup.new("Square", "Jack Dorsey", "finance")
roots = Startup.new("Square Roots", "Kimbal Musk", "agriculture")
glossier = Startup.new("Glossier", "Emily Weis", "cosmetics")

#(startup, venture_capitalist, type, investment)
#Angel, Pre-Seed, Seed, Series A, Series B, Series C, etc.
FundingRound.new(glossier, mark, "Seed", 5000)
FundingRound.new(roots, ashton, "Angel", 5000000)



binding.pry
0 #leave this here to ensure binding.pry isn't the last line