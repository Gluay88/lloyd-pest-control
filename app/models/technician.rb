class Technician < ApplicationRecord
    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row| 
            self.find_or_create_by(id: row["id"]) do |technician|
                technician.name = row["name"]
            end  
        end
    end
end
