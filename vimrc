syntax on
set nocp
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set ignorecase          " Do case insensitive matching
set smartcase           " Do smart case matching
set incsearch           " Incremental search
set hlsearch
set hidden             " Hide buffers when they are abandoned
"set mouse=a             " Enable mouse usage (all modes) in terminals
set nu
set cin
set ts=4
set shiftwidth=4
set sts=4
set listchars=tab:__
set list
set ru
set lbr
set fo+=mB
set cpt=.,w,b

set cursorline

set laststatus=2
function! CurDir()
	let curdir=substitute(getcwd(), '/Users/amir/', "~/", "g")
	return curdir
endfunction
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c

""""""""""""""""""
"Tag list(ctags)
""""""""""""""""""
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Use_Left_Window = 1
let Tlist_Show_One_File = 1
let Tlist_Close_On_Select = 1

nnoremap <silent> <F8> :TlistToggle<CR>

""""""""""""""""""
"cscope setting
""""""""""""""""""
if has("cscope")
set csto=1
set cst

set nocsverb
endif

colo desert



nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>


autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/


set showmatch  " let '(','{','[' can auto match by ')','}',']'
set matchtime=2 " set matchtime = 10ms

nmap <C-h> <Esc>:noh<cr>


"""""""""""""""""""""""
"buffer operation
""""""""""""""""""""""
nmap <C-l> :ls<cr>
nmap <silent><C-p> :bp<cr>
nmap <silent><C-n> :bn<cr>
nmap <C-k> :bd<cr>
nmap t :b<Space>

" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

if has("cscope") && filereadable("/usr/bin/cscope")
	set csprg=/usr/bin/cscope
	set csto=0
	set cst
	set nocsverb

	" add any database in current directory
	if filereadable("cscope.out")
		cs add cscope.out
" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif

	set csverb

endif

"编码设置
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936

"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn

" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0
" 不要使用vi的键盘模式，而是vim自己的
set nocompatible
" 用空格键来开关折叠
set foldenable
set foldmethod=manual
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

set paste
