class CreateDemos < ActiveRecord::Migration[5.1]
  def change
    create_table :demos do |t|
      t.text :description

      t.timestamps
    end
  end
end
