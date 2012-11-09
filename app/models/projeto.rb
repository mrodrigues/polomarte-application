class Projeto < ActiveRecord::Base
  has_many :tarefas

  attr_accessible :nome, :tarefas_attributes

  validates :nome, presence: true

  accepts_nested_attributes_for :tarefas, allow_destroy: true

  def check_concluido
    self.concluido = true
    tarefas.each { |tarefa| self.concluido &&= tarefa.concluida }
  end

  before_save do
    check_concluido
  end
end
