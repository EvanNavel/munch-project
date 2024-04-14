class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :heading
      t.string :body

      t.timestamps
    end
  end
end
