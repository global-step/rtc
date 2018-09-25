class CreateGsaClasses < ActiveRecord::Migration[5.1]
  def change
    create_table :gsa_classes do |t|
      t.string :title
      t.integer :spaces

      t.timestamps
    end
  end
end
