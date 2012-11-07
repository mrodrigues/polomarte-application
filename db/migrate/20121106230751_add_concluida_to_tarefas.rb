class AddConcluidaToTarefas < ActiveRecord::Migration
  def change
    add_column :tarefas, :concluida, :boolean
  end
end
