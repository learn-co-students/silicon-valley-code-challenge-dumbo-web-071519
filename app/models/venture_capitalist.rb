class VentureCapitalist

    @@all = []

    attr_reader :name, :total_worth

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        self.all.select{|vent_cap| vent_cap.total_worth >= 1000000000}
    end

    def offer_contract(startup, type_of_investment, amt_invested)
        FundingRound.new(startup, self, type_of_investment, amt_invested)
    end

    def funding_rounds
        FundingRound.all.select {|fround| fround.venture_capitalist == self}
    end

    def portfolio
        self.funding_rounds.map {|fround| fround.startup}.uniq
    end
    
    def biggest_investment
        self.funding_rounds.map {|fround| fround.investment}.max
    end

    def invested(domain)
        frounds_of_domain = self.funding_rounds.select{|fround| fround.startup.domain == domain}
        frounds_of_domain.map {|fround| fround.investment}.inject(0){|sum, i| sum + i}
    end
end
