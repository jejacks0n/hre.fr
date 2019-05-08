class CreateLinkUsages < ActiveRecord::Migration[6.0]
  def change
    create_table :link_usages do |t|
      t.references :link, null: false, foreign_key: true
      t.string :referer
      t.string :user_agent

      t.timestamps
    end
  end
end
