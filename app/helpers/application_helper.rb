module ApplicationHelper
  def mensagem
    texto = ""
    [:aviso, :importante, :erro, :info].each {|type|
    if flash[type]
      texto += "<class=" + '"' + "#{type}" + '"' + ">#{flash[type]}"
    end
    }
    texto
  end

  #formatar o preço como moeda
  def numero_em_reais(numero)
    number_to_currency(numero, {:format => "%u %n", :unit => "R$", :separator =>
                        ",", :delimiter => "."})    
  end
  
end
