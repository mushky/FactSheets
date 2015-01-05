class CreateIraqnotes < ActiveRecord::Migration
  def change
    create_table :iraqnotes do |t|
      t.string		:category
      t.string  	:title
      t.string  	:url
      t.string	 	:publisher
      t.text		:description
      t.string 		:tags
      t.timestamps
    end
  end
end
