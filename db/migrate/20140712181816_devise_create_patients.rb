class DeviseCreatePatients < ActiveRecord::Migration
  def change
    create_table(:patients) do |t|
      t.string :name
      t.string :city
      
      t.timestamps
    end
  end
end
