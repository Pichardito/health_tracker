class AddReferencesToRecord < ActiveRecord::Migration
  def change
  	add_reference :records, :patient, index: true
  	add_reference :records, :doctor, index: true
  end
end
