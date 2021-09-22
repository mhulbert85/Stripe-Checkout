class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.string :image_url
      t.integer :unit_amount

      t.timestamps
    end
  end
end
