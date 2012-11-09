class AddConcluidoToProjetos < ActiveRecord::Migration
  def change
    add_column :projetos, :concluido, :boolean, default: false
  end
end
