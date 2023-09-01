# exibe todos os pordutos
require_relative "api"


baseApi = 'https://fakestoreapi.com/products/'
response = HTTParty.get(baseApi)
classApi = Api.new(response)
@data = classApi.configApi

@carrinho_de_compras = []


def showproducts
  @data.each do |produto|
    puts "#{produto['id'].to_i} - #{produto['title']}"
  end
end

def productselect
  print "\nDigite o id do produto que deseja visualizar:"
  resposta = gets.chomp.to_i
  for produto in @data
    if (resposta == produto["id"])
      puts "Nome: #{produto['title']} \nPreço: R$#{produto['price']}\nDescrição:#{produto['description']}"

    end
  end
end

def addProductCart(carrinho_de_compras)
  print "\nDigite o id do produto que gostaria de adicionar ao carrinho"
  product_id = gets.chomp.to_i
  produto = @data.find { |item| item['id'].to_i == product_id }
  if produto
     @carrinho_de_compras << { produto: produto['title'], preco: produto['price'] }
    puts "Produto Adicionado!"
  else
    puts "Produto não encontrado!"
  end
  end











def start
  flag = true
  puts "bem vindo a loja virtual\n"
  while flag
    print("selecione o que gostaria de fazer:\n1. Exibir todos produtos\n2. Ver produto expecifico\n3. adicionar produto no carrinho\n4. Editar produto no carrinho\n5. Remover produto do carrinho 6. Calcular Frete\n7. Ver produtos no carrinho\n8.Ver valor total dos produtos no carrinho \n0. Sair\n")
    resposta = gets.chomp.to_i
    case resposta
    when 0
      puts "Muito obrigado pela visita"
      flag=false
    when 1
      showproducts
      when 2
        productselect
      when 3
        addProductCart(@carrinho_de_compras)




    end
  end
  end

  start
