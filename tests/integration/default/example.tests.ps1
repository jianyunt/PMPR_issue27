(Get-PSCallstack)[0].ScriptName
Describe 'RabbitMQ install Pre-req' {

    It 'has the RabbitMQ_Base environment variable in session' {
        $env:RABBITMQ_BASE | Should not BeNullOrEmpty
    }
    It 'has the RabbitMQ_Base environment variable in machine context' {
        [System.Environment]::GetEnvironmentVariable('RABBITMQ_BASE', 'Machine') | Should not BeNullOrEmpty
    }
    It 'Should resolve the RABBITMQ_BASE path' {
        Resolve-Path ([System.Environment]::GetEnvironmentVariable('RABBITMQ_BASE', 'Machine')) | Should not BeNullOrEmpty
    }
    It 'has the ERLANG_HOME variable set' {
        #'C:\Program Files\erl8.0'
        $Env:ERLANG_HOME | Should not BeNullOrEmpty
    }
    It 'has the ERLANG_HOME environment variable in machine context' {
        [System.Environment]::GetEnvironmentVariable('ERLANG_HOME', 'Machine') | Should not BeNullOrEmpty
    }
    It 'Should resolve ERLANG_HOME variable set' {
        #'C:\Program Files\erl8.0'
        Resolve-Path ([System.Environment]::GetEnvironmentVariable('ERLANG_HOME', 'Machine')) | Should not BeNullOrEmpty
    }
    It 'should have RabbitMQTools module installed' {
        get-module -ListAvailable RabbitMQTools | Should not BeNullOrEmpty
    }
    It 'should have PSRabbitMQ module installed' {
        get-module -ListAvailable PSRabbitMQ | Should not BeNullOrEmpty
    }
    It 'Should be able to query the management portal' {
        {iwr http://localhost:15672/ -UseBasicParsing} | should not throw
    }
}