# encoding: utf-8

require 'spec_helper'

describe Projeto do
  it { should have_attribute :nome }
  it { should have_attribute :concluido }
  it { should accept_nested_attributes_for :tarefas }
  it { should allow_mass_assignment_of :tarefas_attributes }

  it { should have_many :tarefas }

  let(:projeto) { FactoryGirl.build :projeto }

  it "deve possuir nome" do
    projeto.nome = nil
    projeto.should have_error(:blank).on :nome

    projeto.nome = "NOME"
    projeto.should_not have_error(:blank).on :nome
  end

  describe "#concluido" do
    before(:each) do
      projeto.tarefas << FactoryGirl.build_list(:tarefa, 2)
      projeto.save
    end

    it "não deve estar concluído se suas tarefas não estiverem concluídas" do
      projeto.tarefas.each { |tarefa| tarefa.concluida = false; tarefa.save}
      projeto.save!
      projeto.should_not be_concluido
    end

    it "não deve estar concluído se apenas algumas de suas tarefas estiverem concluídas" do
      projeto.tarefas.first.concluida = false
      projeto.tarefas.first.save
      projeto.save!
      projeto.should_not be_concluido
    end

    it "deve estar concluído apenas se todas as suas tarefas estiverem concluídas" do
      projeto.tarefas.each { |tarefa| tarefa.concluida = true; tarefa.save }
      projeto.save! 
      projeto.should be_concluido
    end
  end
end
