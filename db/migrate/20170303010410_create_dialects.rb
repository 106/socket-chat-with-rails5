class CreateDialects < ActiveRecord::Migration[5.0]
  def change
    create_table :dialects do |t|
      t.string :name
      t.string :icon_name

      t.timestamps
    end
  end
end
