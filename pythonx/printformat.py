import vim

def format_line():
    # Get the current buffer
    buffer = vim.current.buffer
    # Get the current line number (0-based index)
    line_nr = vim.current.window.cursor[0] - 1
    # Get the current line content
    line = buffer[line_nr]
    # Print the line (this will appear in Neovim's message area)
    print(line)
    # Replace the current line with the printed output
    buffer[line_nr] = line
