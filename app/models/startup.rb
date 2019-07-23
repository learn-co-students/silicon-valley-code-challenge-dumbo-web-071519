class Startup
    attr_accessor :name
    attr_reader :founder, :domain
    @@all = []

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

    def self.find_by_founder(name)
        @@all.find{|company| company.founder == name}
    end

    def self.domains
        @all.select{|startup| startup.domain}
    end

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    def num_funding_rounds
        FundingRound.all.select{|contract| contract.startup == self}.size
    end

    def total_funds
        FundingRound.all.select{|contract| contract.startup == self}.inject
    end

    def investors
        FundingRound.all.select{|contract| contract.venture_capitalist}.uniq
    end

    def big_investors
        FundingRound.all.select{|contract| contract.venture_capitalist}.uniq && FundingRound.all.select{|contract| contract.venture_capitalist.tres_comma_club == true}
    end
    
    
end
