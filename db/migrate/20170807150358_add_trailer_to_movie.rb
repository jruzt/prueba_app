class AddTrailerToMovie < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :trailer, :string
  end
end
