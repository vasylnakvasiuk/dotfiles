local wezterm = require 'wezterm'

return {
  font = wezterm.font {
    family = 'FiraCode Nerd Font',
    harfbuzz_features = { 'ss05' },
  },
  color_scheme = "OneDark (base16)",
  hide_tab_bar_if_only_one_tab = true,
  cell_width = 0.9,
}
