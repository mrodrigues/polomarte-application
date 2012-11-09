class Tarefa < ActiveRecord::Base
  belongs_to :projeto

  attr_accessible :descricao, :concluida

  validates :descricao, presence: true

  after_save do
    projeto.save
  end
end
