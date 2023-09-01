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

  def viewCart
    if @carrinho_de_compras.empty?
      puts "Carrinho vazio."
    else
      puts "Produtos no Carrinho:\n\n"
      @carrinho_de_compras.each do |itens|
        puts itens[:produto], itens[:preco]
      end
    end
  end

def removeCart
  print"\n Digite o nome do produto para remover da lista"
  productname=gets.chomp
  produto = @carrinho_de_compras.find { |item| item[:produto] == productname }
  if produto
    print "deseja deletar o produto #{produto[:produto]} - #{produto[:preco]}"
    deleteProduto = gets.chomp.downcase
    if  deleteProduto=="s"
      @carrinho_de_compras.delete(produto)
      puts 'Produto removido com sucesso!'
      else
        puts "deu erro"
      end
    else
      puts "Produto não encontrado no carrinho."
    end
  end


  def show_total
    if !@carrinho_de_compras.empty?
      puts "Total a pagar R$ #{@carrinho_de_compras.map{|x| x[:preco].to_f}.reduce(:+)} \n"
      else
        puts "Nenhum Produto cadastrado"
        end
        end



def start
  flag = true
  puts "bem vindo a loja virtual\n"
  while flag
    print("selecione o que gostaria de fazer:\n1.
      Exibir todos produtos\n2. Ver produto expecifico\n3.
      adicionar produto no carrinho\n4.
      Ver produtos no carrinho\n5. Remover produto do carrinho\n6.editar produto
      \n7.Ver valor total dos produtos no carrinho \n0. Sair\n")
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
      when 4
        viewCart
      when 5
        removeCart
        when 6
          show_total
    end
  end
  end

  start
