class Iraqnote < ActiveRecord::Base
	def self.search(query)
		where("tags like ?", "%#{query}%")
	end
end
