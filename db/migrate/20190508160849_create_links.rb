class CreateLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :links do |t|
      t.string :url

      t.timestamps
    end

    add_index :links, :url
  end
end
