class ChangeConcluidaDefaultOnTarefas < ActiveRecord::Migration
  def change
    change_column :tarefas, :concluida, :boolean, default: false
  end
end
