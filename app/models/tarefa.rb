class Tarefa < ActiveRecord::Base
  belongs_to :projeto

  attr_accessible :descricao

  validates :descricao, presence: true
end
