class Startup
#### Build the following methods on the `Startup` class
=begin
- `Startup#name`
  - returns a **string** that is the startup's name
- `Startup#founder`
  - returns a **string** that is the founder's name
  - Once a startup is created, the founder cannot be changed.
- `Startup#domain`
  - returns a **string** that is the startup's domain
  - Once a startup is created, the domain cannot be changed 
  (ie. A developer working with instances of the Startup class cannot directly 
  change the domain)
- `Startup#pivot`
  - given a string of a **domain** and a string of a **name**, 
  change the domain and name of the startup. 
  This is the only public method through which the domain can be changed.
- `Startup.all`
  - should return **all** of the startup instances
- `Startup.find_by_founder`
  - given a string of a **founder's name**, returns the **first startup** whose founder's name matches
- `Startup.domains`
  - should return an **array** of all of the different startup domains
=end
    attr_reader :founder, :domain
    attr_accessor :name
    @@all = []

    def initialize(name,founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def pivot(domain, name)
        @domain = domain
        @name = name
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder)
        self.all.select do |startup|
            startup.founder == founder
        end
    end

=begin
#### Startup

- `Startup#sign_contract`
  - given a **venture capitalist object**, 
  type of investment (as a string), and the amount invested (as a float), 
  creates a new funding round and associates it with that startup and 
  venture capitalist.
- `Startup#num_funding_rounds`
  - Returns the total number of funding rounds that the startup has gotten
- `Startup#total_funds`
  - Returns the total sum of investments that the startup has gotten
- `Startup#investors`
  - Returns a **unique** array of all the venture capitalists that have invested
   in this company
- `Startup#big_investors`
  - Returns a **unique** array of all the venture capitalists that have invested 
  in this company and are in the Trés Commas club
=end
    def sign_contract(venture_capitalist, type, amount)
        FundingRound.new(self, VentureCapitalist, type, amount)
    end

    def funding_rounds 
        FundingRound.all.select do |round|
            round.startup == self
        end
    end

    def funds
        FundingRound.all.map do |round|
            round.investment
        end
    end


    def num_funding_rounds
        self.funding_rounds.count
    end

    def total_funds
        self.funds.sum
    end

    def investors
        self.funding_rounds.map do |round|
            round.venture_capitalist
        end.uniq
    end

    def big_investors
        self.investors.select do |investor|
            VentureCapitalist.tres_commas_club.include?(investor)
        end
    end

end
