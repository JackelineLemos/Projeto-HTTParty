describe 'Cadastrar tarefa' do
    def login(field_email, field_password)
        @body = {
            session: {
                email: field_email,
                password: field_password
            }
        }.to_json
        @login = Login.post('/sessions', body: @body) #Contextualização do metodo
        
    end
    context 'tarefas' do
        before {login('jackjoia@gmail.com', 'treinamento123')} #Chamada do metodo antes de iniciar o teste
        
            it 'com sucesso' do 
                header = {
                    'Content-Type': 'application/json',
                    Accept: 'application/vnd.tasksmanager.v2',
                    Authorization: @login.parsed_response['data']['attributes']['auth-token']#caminho para entrar dentro dos arrays e pegar o que tem dentro
                }

                @body = {
                    task: {
                        title:'Tarefa 1209',
                        description: 'descrição da terefa 1209',
                        deadline: '2022-06-06 14:00:00',
                        done: true
                    }
                }.to_json

                @tarefas = Cadastrar.post('/tasks', body: @body, headers: @header)
                puts tarefas
                expect(@tarefas.parsed_response['data']['attributes']['title']).to eql 'Tarefa 1209'#Checa se dentro de data nos atributos o titulo é igual ao nome 'Tarefa 1209'
            end        
        end  
    end

