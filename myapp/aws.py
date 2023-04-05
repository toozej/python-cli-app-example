import os
import subprocess
import click

@click.command()
@click.argument('command')
@click.help_option('--help', '-h')
def aws(command):
    """
    Run the aws-cli with a command and optional parameters

    \b
    Arguments:
    command -- the aws-cli command to run
    """
    config_file = os.path.expanduser('~/.aws/config')
    subprocess.run(['aws', command, '--config-file', config_file])
