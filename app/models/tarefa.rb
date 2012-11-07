class Tarefa < ActiveRecord::Base
  belongs_to :projeto

  attr_accessible :descricao, :concluida

  validates :descricao, presence: true
end
