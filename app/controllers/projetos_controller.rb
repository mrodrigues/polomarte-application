class ProjetosController < ApplicationController

  def index
    @projetos = Projeto.all
  end

  def show
    @projeto = Projeto.find(params[:id])
  end

  def new
    @projeto = Projeto.new
    3.times { @projeto.tarefas.build }
  end

  def create
    @projeto = Projeto.new(params[:projeto])
    if @projeto.save
      flash[:notice] = "Projeto salvo com sucesso!"
      redirect_to @projeto
    else
      flash.now[:error] = setup_error_messages @projeto.errors
      render action: :new
    end
  end

  def edit
    @projeto = Projeto.find(params[:id])
  end

  def update
    @projeto = Projeto.find(params[:id])

    if @projeto.update_attributes(params[:projeto])
      flash[:notice] = "Projeto atualizado com sucesso"
      redirect_to @projeto
    else
      flash.now[:error] = setup_error_messages @projeto.errors
      render action: :edit
    end
  end

  def destroy
    @projeto = Projeto.find(params[:id])
    @projeto.destroy
    redirect_to projetos_path
  end
end
