class Iraqnote < ActiveRecord::Base
	def self.search(query)
		where("tags like ?", "%#{query}%")
	end

  def self.to_csv
    attributes = %w{id title description tags}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |note|
        csv << attributes.map{ |attr| note.send(attr) }
      end
    end
  end
  	
end
