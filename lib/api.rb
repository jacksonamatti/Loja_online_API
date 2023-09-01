require 'httparty'

class Api
  attr_accessor :response

  def initialize(response)
    @response= response
  end

def configApi
# Verifique se a solicitação foi bem-sucedida (código de status 200)
if @response.code == 200
  @response.parsed_response  # Os dados da resposta (já convertidos para Ruby)
else
  puts "Erro na solicitação: #{@response.code}"
end
  end
end
