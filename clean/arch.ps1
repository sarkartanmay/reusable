# If unable to execute this power sheel script then open power shell and execute the following code - 
# Get-ExecutionPolicy <- To check the policy , output might be Restricted
# Set-ExecutionPolicy Unrestricted
# Get-ExecutionPolicy

# Change Project Name
$project_name = "MyProject"

#----------------- MAIN -----------------
$solution_name = $project_name+".sln"

echo $project_name 

New-Item -ItemType Directory -Path $project_name

cd $project_name

dotnet new sln --name $project_name

$API_PROJECT = $project_name + ".API"
$API_PROJECT_PATH = "src/Services/"+ $project_name +"/" + $project_name+".API"

$APP_PROJECT = $project_name + ".Application"
$APP_PROJECT_PATH = "src/Services/"+ $project_name +"/" + $project_name+".Application"

$DOM_PROJECT = $project_name + ".Domain"
$DOM_PROJECT_PATH = "src/Services/"+ $project_name +"/" + $project_name+".Domain"

$INF_PROJECT = $project_name + ".Infrastructure"
$INF_PROJECT_PATH = "src/Services/"+ $project_name +"/" + $project_name+".Infrastructure"

$TEST_PROJECT = $project_name + ".Test"
$TEST_PROJECT_PATH = "tests/Services/"+ $project_name +"/" + $project_name+".Test"

dotnet new webapi -n $API_PROJECT -o $API_PROJECT_PATH
dotnet new classlib -n $APP_PROJECT -o $APP_PROJECT_PATH
dotnet new classlib -n $DOM_PROJECT -o $DOM_PROJECT_PATH
dotnet new classlib -n $INF_PROJECT -o $INF_PROJECT_PATH
dotnet new nunit -n $TEST_PROJECT -o $TEST_PROJECT_PATH

dotnet sln $solution_name add $API_PROJECT_PATH 
dotnet sln $solution_name add $APP_PROJECT_PATH
dotnet sln $solution_name add $DOM_PROJECT_PATH
dotnet sln $solution_name add $INF_PROJECT_PATH
dotnet sln $solution_name add $TEST_PROJECT_PATH

dotnet add $APP_PROJECT_PATH reference $DOM_PROJECT_PATH
dotnet add $INF_PROJECT_PATH reference $APP_PROJECT_PATH

dotnet add $API_PROJECT_PATH reference $INF_PROJECT_PATH
dotnet add $API_PROJECT_PATH reference $APP_PROJECT_PATH

dotnet add $TEST_PROJECT_PATH reference $API_PROJECT_PATH

New-Item -ItemType Directory -Path $APP_PROJECT_PATH"/Contract/Persistence"
New-Item -ItemType Directory -Path $APP_PROJECT_PATH"/Features/Feature01/Command"
#New-Item -ItemType Directory -Path $APP_PROJECT_PATH"/Mapping"
#New-Item -ItemType Directory -Path $INF_PROJECT_PATH"/Persistence"


dotnet new class -n ApplicationServiceRegistration -o $APP_PROJECT_PATH
dotnet new class -n AppPersistence -o $APP_PROJECT_PATH"/Contract/Persistence"
dotnet new class -n AddFeature01Command -o $APP_PROJECT_PATH"/Features/Feature01/Command"
dotnet new class -n MappingProfile -o $APP_PROJECT_PATH"/Mapping"

dotnet new class -n InfrastructureServiceRegistration -o $INF_PROJECT_PATH
dotnet new class -n AppManagementDbContext -o $INF_PROJECT_PATH"/Persistence"

dotnet add $APP_PROJECT_PATH package AutoMapper -v 11.0.1
dotnet add $APP_PROJECT_PATH package AutoMapper.Extensions.Microsoft.DependencyInjection -v 11.0.0
dotnet add $APP_PROJECT_PATH package Commonts.ArchFeatures -v 0.0.2
dotnet add $APP_PROJECT_PATH package FluentValidation -v 11.1.0
dotnet add $APP_PROJECT_PATH package FluentValidation.DependencyInjectionExtensions -v 11.1.0
dotnet add $APP_PROJECT_PATH package MediatR.Extensions.Microsoft.DependencyInjection -v 10.1.0
dotnet add $APP_PROJECT_PATH package Microsoft.Extensions.Logging.Abstractions -v 6.0.2


dotnet add $API_PROJECT_PATH package Microsoft.AspNetCore.Authentication.JwtBearer -v 6.0.25
dotnet add $API_PROJECT_PATH package Microsoft.EntityFrameworkCore.Design -v 6.0.10
dotnet add $API_PROJECT_PATH package Microsoft.EntityFrameworkCore.Tools -v 6.0.10
dotnet add $API_PROJECT_PATH package Serilog.AspNetCore -v 6.1.0
dotnet add $API_PROJECT_PATH package Serilog.Sinks.Console -v 6.0.0
dotnet add $API_PROJECT_PATH package Serilog.Sinks.OpenTelemetry -v 4.2.0
dotnet add $API_PROJECT_PATH package Serilog.Enrichers.Environment -v 3.0.1
dotnet add $API_PROJECT_PATH package OpenTelemetry -v 1.12.0
dotnet add $API_PROJECT_PATH package OpenTelemetry.Exporter.OpenTelemetryProtocol -v 1.9.0
dotnet add $API_PROJECT_PATH package OpenTelemetry.Exporter.Hosting -v 1.9.0
dotnet add $API_PROJECT_PATH package OpenTelemetry.Exporter.AspNetCore -v 1.9.0
dotnet add $API_PROJECT_PATH package OpenTelemetry.Exporter.Http -v 1.9.0
dotnet add $API_PROJECT_PATH package OpenTelemetry.Exporter.Runtime -v 1.9.0

dotnet add $INF_PROJECT_PATH package Pomelo.EntityFrameworkCore.MySql -v 6.0.2

cd ..
