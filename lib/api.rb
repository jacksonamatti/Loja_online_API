require 'httparty'

response = HTTParty.get('https://fakestoreapi.com/products')

# Verifique se a solicitação foi bem-sucedida (código de status 200)
if response.code == 200
  data = response.parsed_response  # Os dados da resposta (já convertidos para Ruby)
else
  puts "Erro na solicitação: #{response.code}"
end


data.each do |produto|
  puts "\n" + produto['title'] + " - R$ #{produto['price']} por unidade"
end
