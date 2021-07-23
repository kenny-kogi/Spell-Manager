class AddEnumNotNull < ActiveRecord::Migration[6.1]
  def change
    change_table(:spells) do |t|
    t.change :name, :string, limit: 70, null: false
    t.change :level, :integer, null: false
    t.change :school, :string, limit: 20, null: false
    t.change :classes, :string, limit: 10, null: false
    t.change :concentration, :boolean, null: false
    t.change :description, :string, limit: 60, null: false
    end
  end
end
