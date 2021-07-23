class AddEnumInLevelSchool < ActiveRecord::Migration[6.1]
  def change
    change_column :spells, :school, :string, default: 0
  end
end
