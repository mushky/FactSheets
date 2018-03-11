class AddCommentaryToSyrianotes < ActiveRecord::Migration
  def change
  	add_column :syrianotes, :commentary, :boolean
  end
end
