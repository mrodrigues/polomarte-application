# encoding: utf-8

module ProjetosHelper
  def status_nav_item(concluido, &block)
    klass = "active" if params[:concluido] == concluido.to_s

    content_tag(:li, class: klass) do
      block.call
    end
  end
end
