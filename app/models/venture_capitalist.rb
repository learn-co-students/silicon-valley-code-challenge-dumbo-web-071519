class VentureCapitalist
=begin

#### Build out the following methods on the `VentureCapitalist` class
- `VentureCapitalist#name`
  - returns a **string** that is the venture capitalist's name
- `VentureCapitalist#total_worth`
  - returns a **number** that is the total worth of this investor 
  (e.g., think of it as how much money they have)
- `VentureCapitalist.all`
  - returns an array of all venture capitalists
- `VentureCapitalist.tres_commas_club`
  - returns an array of all venture capitalists in the Trés Commas club 
  (they have more then 1,000,000,000 `total_worth`)
=end
    attr_reader :name, :total_worth
    @@all = []
    def initialize(name,total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        self.all.select do |venturecapitalist|
            venturecapitalist.total_worth > 1000000000
        end
    end

=begin
#### VentureCapitalist

- `VentureCapitalist#offer_contract`
  - given a **startup object**, type of investment (as a string), 
  and the amount invested (as a float), 
  creates a new funding round and associates it with that startup and venture 
  capitalist.
- `VentureCapitalist#funding_rounds`
  - returns an array of all funding rounds for that venture capitalist
- `VentureCapitalist#portfolio`
  - Returns a **unique** list of all startups this venture capitalist has funded
- `VentureCapitalist#biggest_investment`
  - returns the largest funding round given by this venture capitalist
- `VentureCapitalist#invested`
  - given a **domain string**, returns the total amount invested in that domain

=end
    def offer_contract(startup, type, amount)
        FundingRound.new(startup, self, type, amount)
    end
    
    def funding_rounds
        FundingRound.all.select do |round|
            round.venture_capitalist == self
        end
    end

    def startups
        self.funding_rounds.map do |round|
            round.startup
        end
    end

    def portfolio
        self.startups.uniq
    end

    def biggest_investment
        self.funding_rounds.sort do |round|
            round.investment
        end.last
    end

    def investments 
        self.funding_rounds.map do |round|
            round.investment
        end
    end

    def invested
        self.investments.sum
    end
end

