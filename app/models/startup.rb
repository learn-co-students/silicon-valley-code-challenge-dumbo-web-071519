class Startup

    attr_accessor :name, :domain
    attr_reader :founder

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain

        @@all << self
    end

    def pivot(domain, name)
        @name = name
        @domain = domain
        "Startup name & Domain has Changed to #{name}:#{domain}"
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder_name)
        Startup.all.find{ |startup| startup.founder == founder_name}
    end

    def self.domains
        Startup.all.map do |startup| 
        startup.domain
        end.uniq
    end

end
