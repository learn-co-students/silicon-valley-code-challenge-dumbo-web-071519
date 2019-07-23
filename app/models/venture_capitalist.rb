class VentureCapitalist
    attr_accessor :name, :net_worth
    @@all = []

    def initialize(name, net_worth)
        @name = name
        @net_worth = net_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        VentureCapitalist.all.select{|vc| vc.net_worth > 999999999 }
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        FundingRound.all.select{|contract|contract.venture_capitalist == self}
    end

    def portfolio
        self.funding_rounds.map{|contract| contract.startup}.uniq
    end

    def biggest_investment
        self.portfolio.map{|contract| contract.investment}.max
    end

    def invested(domain)
        self.funding_rounds.select{|round| round.startup.domain == domain}.inject
    end





end
