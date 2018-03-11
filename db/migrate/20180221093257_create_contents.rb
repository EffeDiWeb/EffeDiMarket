class CreateContents < ActiveRecord::Migration[5.1]
  def change
    create_table :contents do |t|
      t.string :titolo, null: false, default: ""
      t.text :descrizione
      t.decimal :prezzo

      t.timestamps
    end
  end
end
