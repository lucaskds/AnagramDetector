class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :str_1
      t.string :str_2
      t.boolean :match

      t.timestamps
    end
  end
end
