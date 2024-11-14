-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.font = wezterm.font_with_fallback({
		"HackGen"
})

-- For example, changing the color scheme:
config.color_scheme = 'iceberg-dark'

-- 日本語変換時の CTRL-h を修正
-- c.f. https://fjtkfm.hatenablog.com/entry/2023/12/16/164346
config.use_ime = true
config.macos_forward_to_ime_modifier_mask = "SHIFT|CTRL"

config.keys = {
	-- なぜかALT+¥で「\」ではなく、「«」が入力されるので修正
	{key="«", action=wezterm.action{SendString="\\"}},
}

-- 左 ALT キーを押したときも、コンポジットキーを送信する
config.send_composed_key_when_left_alt_is_pressed = true

-- and finally, return the configuration to wezterm
return config
