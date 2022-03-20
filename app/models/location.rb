class Location < ApplicationRecord
    has_many :workorders
    has_many :technicians, :through => :workorders
    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row| 
            self.find_or_create_by(id: row["id"]) do |location|          
            location.name = row["name"]
            location.city = row["city"]
            end  
        end
    end
end
