class TarefasController < ApplicationController
  def update
    tarefa = Tarefa.find(params[:id])
    tarefa.update_attributes(params[:tarefa])
    render json: tarefa
  end
end
