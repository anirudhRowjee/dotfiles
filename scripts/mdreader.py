#!/usr/bin/python3
from rich.console import Console
from rich.markdown import Markdown
import sys

console = Console()
with open(sys.argv[1]) as readme:
	markdown = Markdown(readme.read())
console.print(markdown)
