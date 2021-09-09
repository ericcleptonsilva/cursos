class Loja
   def promoção_do_dia(dia)
   if dia == "quarta-feira"
       return "descontos de 10% em monitores"
   end
   end
 end

Dado("que hoje é {string}") do |dia|
   @hoje = dia
end  
Quando("eu pergunto qual é a promoção do dia") do
   @valor_obtido = Loja.new.promoção_do_dia(@hoje)
end  
Então("a resposta deve ser {string}") do |promoção_esperada|
   expect(@valor_obtido).to eql promoção_esperada
end