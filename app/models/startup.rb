class Startup

    @@all = []

    attr_reader :domain
    attr_accessor :name, :founder

    def initialize(name, founder, domain)
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

    def self.find_by_founder(founder_name)
        self.all.find {|startup| startup.founder == founder_name}
    end

    def self.domains
        self.all.map{|startup| startup.domain}
    end

    def sign_contract(venture_capitalist, type_of_investment, amt_invested)
        FundingRound.new(self, venture_capitalist, type_of_investment, amt_invested)
    end

    def funding_rounds
        FundingRound.all.select {|fround| fround.startup == self}
    end
    
    def num_funding_rounds 
        self.funding_rounds.count
    end

    def total_funds
        money_array = funding_rounds.map{|fround| fround.investment}
        money_array.inject(0){|sum, i| sum + i}
    end

    def investors
        self.funding_rounds.map{|fround| fround.venture_capitalist}.uniq
    end

    def big_investors
        self.investors.select{|ven_cap| ven_cap.total_worth >= 1000000000}.uniq
    end

end
