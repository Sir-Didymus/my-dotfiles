-- hat0uma/csvview.nvim
--
-- A Neovim plugin for CSV file editing.

return {
  "hat0uma/csvview.nvim",
  ---@module "csvview"
  ---@type CsvView.Options
  opts = {
    parser = {
      --- Specifies the delimiter character to separate columns.
      --- This can be configured in one of three ways:
      ---
      --- 1. As a single string for a fixed delimiter.
      ---    e.g., delimiter = ","
      ---
      --- 2. As a function that dynamically returns the delimiter.
      ---    e.g., delimiter = function(bufnr) return "\t" end
      ---
      --- 3. As a table for advanced configuration:
      ---    - `ft`: Maps filetypes to specific delimiters. This has the highest priority.
      ---    - `fallbacks`: An ordered list of delimiters to try for automatic detection
      ---      when no `ft` rule matches. The plugin will test them in sequence and use
      ---      the first one that highest scores based on the number of fields in each line.
      ---
      --- Note: Only fixed-length strings are supported as delimiters.
      --- Regular expressions (e.g., `\s+`) are not currently supported.
      --- @type CsvView.Options.Parser.Delimiter
      delimiter = {
        ft = {
          csv = ",",
          tsv = "\t",
        },
        fallbacks = {
          ",",
          "\t",
          ";",
          "|",
          ":",
          " ",
        },
      },
    },
    keymaps = {
      -- Text objects for selecting fields
      textobject_field_inner = { "if", mode = { "o", "x" } },
      textobject_field_outer = { "af", mode = { "o", "x" } },
      -- Excel-like navigation:
      -- Use <Tab> and <S-Tab> to move horizontally between fields.
      -- Use <Enter> and <S-Enter> to move vertically between rows and place the cursor at the end of the field.
      -- Note: In terminals, you may need to enable CSI-u mode to use <S-Tab> and <S-Enter>.
      jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
      jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
      jump_next_row = { "<Enter>", mode = { "n", "v" } },
      jump_prev_row = { "<S-Enter>", mode = { "n", "v" } },
    },
  },
  cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
}
