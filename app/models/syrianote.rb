class Syrianote < ActiveRecord::Base
  def self.search(query)
  	where("title like ?", "%#{query}%") || where("tags like ?", "%#{query}%")
  end
end
