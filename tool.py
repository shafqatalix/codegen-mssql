
import click
from app import application

@click.command() 
@click.option('-c','--connectionstring', type=str, help="Database ConnectionString")
@click.option('-t','--target', type=str, help="Target output ", default='csharp')
def cli(connectionstring,target):
    application.generate(connectionstring,target)


 
    

