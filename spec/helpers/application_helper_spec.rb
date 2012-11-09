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
describe ApplicationHelper do
  describe "title" do
    it "deve retornar título-base" do
      helper.title.should == "TODO"
    end

    it "deve retornar título completo" do
      @title = "Título"
      helper.title.should == "TODO | Título"
    end
  end
end
