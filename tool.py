
import click
from app import application

@click.command() 
@click.option('-c','--connectionstring', type=str, help="Database ConnectionString")
@click.option('-t','--target', type=str, help="Target language default is C#, other supported languages Javascript,... ", default='csharp')
#@click.option('-o','--output', type=str, help="Output folder ", default='DbObjects')
def cli(connectionstring,target):
    application.generate(connectionstring,target)


 
    

