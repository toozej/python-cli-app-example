import click
import cli

@cli.command()
@click.argument('message')
@click.help_option('--help', '-h')
def echo(message):
    """
    Print a message to the console.

    \b
    Arguments:
    message -- the message to print
    """
    click.echo(message)
