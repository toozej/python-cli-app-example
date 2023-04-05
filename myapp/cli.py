import click
import os
import subprocess

@click.group()
def cli():
    pass

@cli.command()
@click.argument('script')
@click.argument('args', nargs=-1)
@click.help_option('--help', '-h')
def run(script, args):
    """
    Run a sub-command script file.

    \b
    Arguments:
    script -- the name of the Python script file to execute
    args -- variable number of arguments to pass to the script
    """
    script_path = os.path.join(os.path.dirname(os.path.abspath(__file__)), script)
    subprocess.run(['python', script_path, *args])

if __name__ == '__main__':
    cli()

