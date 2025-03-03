local wezterm = require 'wezterm'
local config = {
  enable_tab_bar = false,
  window_close_confirmation = "NeverPrompt",
  disable_default_key_bindings = true,
  font_size = 14, -- change font size to taste
  default_prog = {'/home/izzym/.cargo/bin/nu'},
  font = wezterm.font_with_fallback{{ -- change font to taste
                   family = 'FairfaxHaxHD Nerd Font',
                   stretch = 'ExtraCondensed'}
  },
  color_scheme = 'rose-pine', -- change colorscheme to taste
}
return config
