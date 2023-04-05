import os
import subprocess
import click

@click.command()
@click.argument('directory')
@click.option('--help', '-h')
def ls(directory):
    """
    List a directory

    \b
    Arguments:
    directory -- the directory to list
    """
    subprocess.run(['ls', directory])
