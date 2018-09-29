class Syrianote < ActiveRecord::Base
  def self.to_csv
    attributes = %w{id category title url publisher description tags}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |note|
        csv << attributes.map{ |attr| note.send(attr) }
      end
    end
  end

end

