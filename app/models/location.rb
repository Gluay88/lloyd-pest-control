class Location < ApplicationRecord
    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row| 
            self.find_or_create_by(id: row["id"]) do |location|          
            location.name = row["name"]
            location.city = row["city"]
            end  
        end
    end
end
