"---------------------------------------------------------------------------
" GUIに関する設定:
"フォント設定
"set guifont="Ricty Diminished":h12
"Guifont! Ricty Diminished:h13
Guifont! Consolas:h12
"Guifont Myrica M:h14

if has('multi_byte_ime')
    highlight Cursor guifg=NONE guibg=Green
    highlight CursorIM guifg=NONE guibg=Purple
endif

"function! RedGem()
"ruby << EOF
"require 'neovim'
"class Garnet
	"def initialize(s)
		"@buffer = Neovim::Buffer.current
		"vimputs(s)
	"end
	"def vimputs(s)
		"@buffer.append(@buffer.count,s)
	"end
"end
"gem = Garnet.new("pretty")
"EOF
"endfunction

