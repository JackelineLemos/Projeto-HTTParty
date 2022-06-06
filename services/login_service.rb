
module Login #Para definir o modulo como global é necessário adiciona-lo no spec_helper.rb
    include HTTParty
    base_uri 'https://api-de-tarefas.herokuapp.com'
  format :json
    @headers = {"Accept": 'application/vnd.tasksmanagers.v2',
        'Content-Type': 'application/json'
    }  
end