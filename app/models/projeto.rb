class Projeto < ActiveRecord::Base
  has_many :tarefas

  attr_accessible :nome, :tarefas_attributes

  validates :nome, presence: true

  accepts_nested_attributes_for :tarefas, allow_destroy: true

  def concluido?
    result = true
    tarefas.each { |tarefa| result &&= tarefa.concluida }

    result
  end
end
