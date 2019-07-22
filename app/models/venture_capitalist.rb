class VentureCapitalist

    attr_reader :name, :worth

    @@all = []

    def initialize(name, worth)
        @name = name
        @worth = worth

        @@all << self
    end

    def self.all
        @@all
    end

    def total_worth
        self.worth
    end

    def self.tres_commas_club
        self.all.select do |vc|
            vc.worth > 999999
        end
    end

    #part 2
    def offer_contract(startup, invst_type, invst_amount)
        FundingRound.new(startup, self, invst_type, invst_amount)
    end

    def funding_rounds
        FundingRound.all.select do |round|
            round.venture_capitalist == self
        end
    end

    def portfolio
        self.funding_rounds.map do |rounds|
            rounds.startup
        end.uniq
    end

    def biggest_investment
        max = 0
        big_inv = nil
        self.funding_rounds.each do |round|
            if round.investment > max
                max = round.investment
                big_inv = round
            end
        end
        big_inv
    end

    def invested(domain)
        total_invested_in_domain = 0.0
        self.funding_rounds.each do |round|
                if round.startup.domain == domain
                    total_invested_in_domain += round.investment
                end
        end
        total_invested_in_domain
    end

end
