import vim
from io import StringIO
import sys


def format_line():
    old_stdout = sys.stdout
    try:
        buffer = vim.current.buffer
        line_nr = vim.current.window.cursor[0] - 1
        line = buffer[line_nr]

        stdout = StringIO()
        sys.stdout = stdout

        try:
            eval_result = eval(line)
            print(eval_result)
        except:
            print(line)

        output = stdout.getvalue()
        sys.stdout = old_stdout

        lines = [line.rstrip() for line in output.splitlines()]
        if not lines:
            lines = [""]

        # Replace the lines and show message
        buffer[line_nr : line_nr + 1] = lines
        vim.api.out_write(f"Formatted line {line_nr + 1} into {len(lines)} lines\n")

    except Exception as e:
        sys.stdout = old_stdout
        vim.api.err_write(f"Error: {str(e)}\n")
