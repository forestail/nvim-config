set encoding=utf-8
scriptencoding utf-8
"全体に関する設定
let g:mapleader = " "
"map <Leader>a ggVG
"---------------------------------------------------------------------------
" 検索の挙動に関する設定:
"
" 検索時に大文字小文字を無視 (noignorecase:無視しない)
set ignorecase
" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase

"---------------------------------------------------------------------------
" 編集に関する設定:
"
" タブの画面上での幅
set tabstop=4
" タブをスペースに展開しない (expandtab:展開する)
set noexpandtab
" 自動的にインデントする (noautoindent:インデントしない)
set autoindent
" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan
" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set showmatch
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM
"Shift-Insertでクリップボード貼り付け(insert mode)
inoremap <silent> <S-Insert> <C-r>+
"Ctrl-Insertでクリップボードコピー(visual mode)
vnoremap <silent> <C-Insert> "+y
"マウス操作を有効にする
set mouse=a
"---------------------------------------------------------------------------
" GUI固有ではない画面表示の設定:
"
" 行番号を非表示 (number:表示)
"set number
" 行番号を相対表示
set relativenumber number
"F3で通常の行番号表示とトグル
nnoremap <F3> :<C-u>setlocal relativenumber!<CR>
" ルーラーを表示 (noruler:非表示)
set ruler
" タブや改行を表示 (list:表示)
set nolist
" どの文字でタブや改行を表示するかを設定
"set listchars=tab:>-,extends:<,trail:-,eol:<
" 長い行を折り返して表示 (nowrap:折り返さない)
set wrap
" 常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2
" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set cmdheight=2
" コマンドをステータス行に表示
set showcmd
" タイトルを表示
set title
"---------------------------------------------------------------------------
" ファイル操作に関する設定:
"
" バックアップファイルを作成しない (次行の先頭の " を削除すれば有効になる)
set nobackup


" -------------dein--------------------------------
if &compatible
  set nocompatible
endif
"set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim')
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/denite.nvim')
call dein#add('Shougo/vimfiler.vim')
"call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/neoyank.vim')
"call dein#add('Shougo/neocomplcache')
"call dein#add('Shougo/neosnippet')
"call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/deoplete.nvim')
call dein#add('itchyny/lightline.vim')
call dein#add('scrooloose/nerdtree')
"call dein#add('tpope/vim-endwise')
""call dein#add('tomtom/tcomment_vim')
"call dein#add('vim-syntastic/syntastic')
call dein#add('tpope/vim-commentary')
call dein#add('kana/vim-textobj-user')
call dein#add('kana/vim-textobj-entire')
call dein#add('mattn/emmet-vim')
call dein#add('tpope/vim-surround')
"call dein#add('tpope/vim-unimpaired')
call dein#add('twitvim/twitvim')
call dein#add('deton/jasegment.vim')
call dein#add('kana/vim-textobj-lastpat')
call dein#add('tpope/vim-abolish')
call dein#add('kana/vim-smartchr')
call dein#add('godlygeek/tabular')
call dein#add('plasticboy/vim-markdown')
call dein#add('kannokanno/previm')
call dein#add('tyru/open-browser.vim')
call dein#add('simeji/winresizer')
call dein#add('Shougo/vimshell.vim')
"call dein#add('haya14busa/vim-migemo')
call dein#add('rhysd/migemo-search.vim')
call dein#add('rhysd/vim-textobj-ruby')
call dein#add('fuenor/qfixhowm')

call dein#end()
" -------------dein--------------------------------


"未保存でもバッファ切替可に
set hidden


" -------------lightline--------------------------------
set laststatus=2
let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ],
	\   'right': [	[ 'lineinfo', 'syntastic' ],
	\		[ 'percent' ],
	\		[ 'fileformat', 'fileencoding', 'filetype']]
        \ },
        \ 'component_function': {
        \   'modified': 'LightlineModified',
        \   'readonly': 'LightlineReadonly',
        \   'fugitive': 'LightlineFugitive',
        \   'filename': 'LightlineFilename',
        \   'fileformat': 'LightlineFileformat',
        \   'filetype': 'LightlineFiletype',
        \   'fileencoding': 'LightlineFileencoding',
        \   'mode': 'LightlineMode',
        \ },
        \ }

function! LightlineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
    return fugitive#head()
  else
    return ''
  endif
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction
" -------------lightline--------------------------------

"フォント設定
set guifont="Ricty Diminished":h12
"Guifont! Ricty Diminished:h12


au BufRead,BufNewFile *.md set filetype=markdown
let g:previm_open_cmd = 'C:/Program\ Files/Google/Chrome/Application/chrome.exe'

"実践Vimからの有益な設定
set history=200
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>


let g:python3_host_prog = 'C:\Python35\python.exe'
let g:winresizer_start_key = '<C-T>'


"---------------------------------------------------------------------------
" ウインドウに関する設定:
"
" ウインドウの幅
set columns=120
" ウインドウの高さ
set lines=40
" コマンドラインの高さ(GUI使用時)
set cmdheight=2
" 画面を黒地に白にする (次行の先頭の " を削除すれば有効になる)
colorscheme darkblue " (GUI使用時)
"---------------------------------------------------------------------------

"migemo
"let g:migemodict = '$VIM/runtime/dict/utf-8/migemo-dict'
let g:migemosearch_migemodict = '$VIM/runtime/dict/utf-8/migemo-dict'
if executable('cmigemo')
    cnoremap <expr><CR> migemosearch#replace_search_word()."\<CR>"
endif

"---------------------------------------------------------------------------
"実践Vimからの有益な設定
set history=200
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>


let g:python3_host_prog = 'C:\Python35\python.exe'
let g:winresizer_start_key = '<C-T>'

xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call<SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>

function! s:VSetSearch()
  let temp = @s
    norm! gv"sy
      let @/ = '\V' . substitute(escape(@s,'/\'),'\n','\\n','g')
        let @s = temp
	endfunction

	"&だけで前回のオプションも含めた同じ置換実行
	nnoremap & :&&<CR>
	xnoremap & :&&<CR>

"---------------------------------------------------------------------------

"---------------------------------------------------------------------------
"Howm設定
" キーマップリーダー
let QFixHowm_Key = 'g'

" howm_dirはファイルを保存したいディレクトリを設定
let howm_dir             = '~/.howm'
let howm_filename        = '%Y/%m/%Y-%m-%d-%H%M%S.txt'
let howm_fileencoding    = 'utf-8'
let howm_fileformat      = 'dos'
" 休日定義ファイル
let QFixHowm_HolidayFile = '~/.howm/Sche-Hd-0000-00-00-000000.txt'

" キーコードやマッピングされたキー列が完了するのを待つ時間(ミリ秒)
set timeout timeoutlen=3000 ttimeoutlen=100

" プレビューや絞り込みをQuickFix/ロケーションリストの両方で有効化(デフォルト:2)
let QFixWin_EnableMode = 1
"---------------------------------------------------------------------------
