# encoding: utf-8

require 'spec_helper'

describe Tarefa do
  it { should have_attribute :descricao }
  it { should have_attribute :concluida }
  it { should allow_mass_assignment_of :concluida }

  it { should belong_to :projeto }

  let(:tarefa) { FactoryGirl.build :tarefa }

  it "deve possuir uma descrição" do
    tarefa.descricao = nil
    tarefa.should have_error(:blank).on :descricao

    tarefa.descricao = "DESCRIÇÃO"
    tarefa.should_not have_error(:blank).on :descricao
  end
end
