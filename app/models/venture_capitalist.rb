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

end
