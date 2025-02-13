# printformat.nvim

A Neovim plugin that uses Python's print() function to format and convert lines in your buffer. It captures Python's string representation and formatting of objects and applies it back to your buffer.

## Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
    "amitkot/printformat.nvim",
    config = function()
        require("printformat").setup()
    end
}
```

## Usage

When you're on a line containing text you want to format:
1. Enter command mode
2. Type `:PrintFormat`

The line will be processed through Python's print() function and replaced with the formatted output.

## Use Cases

- Converting string representations
- Applying Python's string formatting
- Cleaning up string literals
- Standardizing output format

## License

MIT License - see LICENSE file
