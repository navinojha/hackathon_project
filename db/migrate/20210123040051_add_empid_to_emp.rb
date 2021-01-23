class AddEmpidToEmp < ActiveRecord::Migration[6.1]
  def change
    add_column :emps, :empid, :string
    add_index :emps, :empid, unique: true
  end
end
