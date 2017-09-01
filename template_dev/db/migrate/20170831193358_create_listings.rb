class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.string :address
      t.string :title
      t.string :rent
      t.string :available_date
      t.string :description
      t.string :contact_phone
      t.string :contact_email
      t.string :city

      t.timestamps
    end
  end
end
