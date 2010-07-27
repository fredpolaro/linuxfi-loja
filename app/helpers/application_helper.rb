# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def cabecalho_de_tabela(*args)
    colunas = args.map { |coluna| "<th>#{coluna}</th>"}
    linha = content_tag( :tr, colunas )
    content_tag( :thead, linha )
  end

  def render_flash
    render "compartilhados/flash", :flash => flash
  end

  def will_paginate( object, options = {})
    options.merge!( {:previous_label => "<< Anterior", :next_label => "Próximo >>"})
    super( object, options )
  end

  def mensagem_de_paginacao( colecao )
    content_tag :p, "Mostrando #{colecao.size} de #{colecao.total_entries}"
  end

end
