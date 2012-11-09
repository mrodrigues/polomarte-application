# encoding: utf-8

require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the ProjetosHelper. For example:
#
# describe ProjetosHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe ProjetosHelper do
  describe "status_nav_item" do
    it "exibe um item de navegação inativo" do
      item = helper.status_nav_item(true) {}
      item.should == "<li></li>"
    end

    it "exibe um item de navegação ativo quando está na página de projetos concluídos" do
      params[:concluido] = "true"
      item = helper.status_nav_item(true) {}
      item.should == '<li class="active"></li>'
    end

    it "exibe um item de navegação ativo quando está na página de projetos em andamento" do
      params[:concluido] = "false"
      item = helper.status_nav_item(false) {}
      item.should == '<li class="active"></li>'
    end
  end
end
