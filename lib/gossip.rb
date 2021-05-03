class Gossip
    attr_accessor :author, :content
    def initialize(author , content)
        @author  = author 
        @content = content
    end
    def save
        CSV.open("./db/gossip.csv", "ab") do |csv|
            csv << [@author , @content]
        end
    end
    def self.all
        all_gossips = []
        CSV.read("./db/gossip.csv").each do |csv_line|
          all_gossips << Gossip.new(csv_line[0], csv_line[1])
        end
        return all_gossips
    end
    def self.find(id)
        all_gossips = []
        CSV.read("./db/gossip.csv").each do |csv_line|
          all_gossips << Gossip.new(csv_line[0], csv_line[1])
        end
        id_i = id.to_i
        return all_gossips[id_i]
    end
    def self.update(index, author, content)
        array_updated = CSV.read("./db/gossip.csv")
        array_updated[index.to_i][0] = author
        array_updated[index.to_i][1] = content
        CSV.open("./db/gossip.csv","w+") do |csv|
            array_updated.each do |line_updated|  
               csv << line_updated
                end
            end
    end
    
end
