"""""""""""""""""""""""""""""""""" vundle needed begin """""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" golang
Plugin 'fatih/vim-go'
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
"Plugin 'scrooloose/nerdtree'
"Plugin 'ludovicchabant/vim-gutentags'
"Plugin 'vim-php/tagbar-phpctags.vim'
Plugin 'ctrlpvim/ctrlp.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"""""""""""""""""""""""""""""""""" vundle needed end """""""""""""""""""""""""""""""""""""


"""""""""""""""""""""" vim自身相关配置 begin """"""""""""""""""""""

if(has("win32") || has("win64") || has("win95") || has("win16"))
    set runtimepath=$HOME/_vim,~/vimfiles,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/vimfiles/after
endif


"启动时窗口最大化
function! MaximizeWindow()
    silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunction
if has('win32')
    au GUIEnter * simalt ~x
else
    au GUIEnter * call MaximizeWindow()
endif

"记住上次编辑位置
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \ exe "normal g`\"" |
     \ endif

"定义快捷键的前缀，即<Leader>
let mapleader="\<Space>"

if has("win32")
    map <silent> <leader>ss :source $HOME/_vimrc<cr>
    map <silent> <leader>ee :e $HOME/_vimrc<cr>
else
    "快速重新加载vimrc配置的快捷键
    map <silent> <leader>ss :source $HOME/.vimrc<cr>
    "快速编辑vimrc快捷键
    map <silent> <leader>ee :e $HOME/.vimrc<cr>
endif


"设置编码
set enc=utf-8
set fenc=utf-8
set fencs=utf-8,gb18030,gb2312,gbk,cp936
"去掉bom标记
set nobomb

"设置gvim无菜单栏与工具栏
set guioptions-=m
set guioptions-=T

" history文件中需要记录的行数
set history=5000

" 在处理未保存或只读文件的时候，弹出确认
set confirm

"在windows时编码设置
if has("win32")
    set termencoding=utf-8
    set langmenu=zh_CN.utf-8
    language messages zh_cn.utf-8
    language messages zh_cn.utf-8
endif


"用于语法高亮的配色方案
"colorscheme 256-jungle
"colorscheme vividchalk
"colorscheme jellybeans
"colorscheme Tomorrow
"colorscheme github
"colorscheme bensday
colorscheme wintersday

"set background=dark
"colorscheme solarized

"禁止光标闪烁
"set gcr=a:block-blinkon0

"开启语法高亮功能
syntax enable
"允许用指定语法高亮配色方案替换默认方案
syntax on

"设置制表符占用空格数
set expandtab
set softtabstop=4
set tabstop=4
set shiftwidth=4
set wrap

"设置非可见字符的显示
"set list
"set listchars=tab:>-,trail:^

"开启行号显示
set number

" 自动格式化
set formatoptions=tcrqn

" 继承前一行的缩进方式，特别适用于多行注释
set autoindent

" 为C程序提供自动缩进
set smartindent

"开启高亮显示结果
set hlsearch

"开启实时搜索功能
set incsearch

"智能搜索,全是小写时不区分大小写，有一个大写则区分大小写
set ignorecase smartcase

"在命令行显示当前输入的命令
set showcmd

" 总是显示状态行
set laststatus=1

"禁止折行
"set nowrap

"关闭兼容模式
set nocompatible

"解决方向键不能用的问题
"set t_ku=OA
"set t_kd=OB
"set t_kl=OD
"set t_kr=OC

"禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

"开启文件类型侦测
filetype on
"根据侦测到的不同类型加载对应的插件
filetype plugin on
"根据侦测到的不同类型采用不同的缩进格式
filetype indent on


"定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>

"定义快捷键保持当前窗口内容
nmap <Leader>w :w<CR>

"设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
"设置快捷键将系统剪贴板内容粘贴至vim
nmap <Leader>p "+p

" 不要备份文件（根据自己需要取舍）
set nobackup
set noswapfile

" 增强模式中的命令行自动完成操作
set wildmenu

" 命令行（在状态行下）的高度，默认为1，这里是2
set cmdheight=2

" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2

" 启动的时候不显示那个援助索马里儿童的提示
set shortmess=atI

"VIM支持多种文本折叠方式，我VIM多用于编码，所以选择符合编程语言语法的代码折叠方式。
set foldmethod=manual
"启动vim时打开所有折叠代码。foldlevel用于设置闭合折叠代码的层级
set foldlevel=100


"使用 /something 查找
"使用 cs 替换第一个，然后按 <Esc> 键
"使用 n.n.n.n.n. 查找以及替换余下匹配项。
"vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
"    :<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
"omap s :normal vs<CR>
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>

"""""""""""""""""""""" vim自身相关配置 end """"""""""""""""""""""



"""""""""""""""""""""" 最大化当前窗口, <Leader>z """"""""""""""""""""""""""""
function! Zoom ()
    " check if is the zoomed state (tabnumber > 1 && window == 1)
    if tabpagenr('$') > 1 && tabpagewinnr(tabpagenr(), '$') == 1
        let l:cur_winview = winsaveview()
        let l:cur_bufname = bufname('')
        tabclose
        " restore the view
        if l:cur_bufname == bufname('')
            call winrestview(cur_winview)
        endif
    else
        tab split
    endif
endfunction
nmap <leader>z :call Zoom()<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""" vim标签配置 begin """"""""""""""""""""""
"hi TabLineSel   ctermfg=White  ctermbg=DarkBlue  cterm=NONE
" 显示标签页顺序，便于切换标签页，如需要切换到编号为3的标签页，按 3gt 即可
if exists("+showtabline")
    function! MyTabLine()
        let s = ''
        let t = tabpagenr()
        let i = 1
        while i <= tabpagenr('$')
            let buflist = tabpagebuflist(i)
            let winnr = tabpagewinnr(i)
            let s .= '%' . i . 'T'
            let s .= (i == t ? '%1*' : '%2*')
            let s .= ' '
            let s .= i . '}'
            let s .= '%*'
            let s .= (i == t ? '%#TabLine#' : '%#TabLineSel#' )

            let buf_filename = bufname(buflist[winnr - 1])
            let filepath = fnamemodify(buf_filename, ":h")
            let filename = fnamemodify(buf_filename, ":p:t")

            if filename == ''
                let s .= ' [NEW]'
            else

                let sfname = ''
                if strpart(filepath, 0, 1) == '/'
                    let sfname = '/'
                endif
                let sflist = split(filepath, '/')
                let sflist_len = len(sflist)
                let jj = 0
                while jj < sflist_len
                    if 3 >= strlen(sflist[jj])
                        let sfname .= sflist[jj] . '/'
                    else 
                        let sfname .= strpart(sflist[jj], 0, 1) . '/'
                    endif
                    let jj = jj + 1
                endwhile

                let m = 0       " &modified counter
                let bc = len(tabpagebuflist(i))     "counter to avoid last ' '
                " loop through each buffer in a tab
                for b in tabpagebuflist(i)
                    " check and ++ tab's &modified count
                    if getbufvar( b, "&modified" )
                        let m += 1
                        break
                    endif
                endfor

                " add modified label + where n pages in tab are modified
                if m > 0
                    let s .= ' @' . sfname . filename
                else
                    let s .= ' ' . sfname . filename
                endif
            endif


            let i = i + 1
        endwhile
        "let s .= '%T%#TabLineFill#%='
        let s .= ' %T%#TabLineFill#%'
        "let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
        return s
    endfunction
    set stal=2
    set tabline=%!MyTabLine()
endif

"定义标签快捷键，H键前一个标签页，L键后一个标签页
nmap H gT<CR>
nmap L gt<CR>

""""""""""""""""""""" vim标签配置 end """"""""""""""""""""""

""""""""""""""" nerdtree begin """"""""""""""""""""
"map <F3> :NERDTreeToggle<CR>
"
"" 当没有选定文件时，自动打开文件窗口
""autocmd StdinReadPre * let s:std_in=1
""autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"
"" 当只剩文件管理器窗口时一并关闭
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
""""""""""""""" nerdtree end """""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""" vim-go begin """"""""""""
let g:go_bin_path = expand("~/.vim/bin")

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goimports"
"let g:go_fmt_fail_silently = 1
"let g:go_fmt_autosave = 0
let g:go_play_open_browser = 0

" golang函数定位 godef 配置
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

" go-doc
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

" 显示变量类型信息
au FileType go nmap <Leader>i <Plug>(go-info)
" 重命名变量
au FileType go nmap <Leader>e <Plug>(go-rename)

""""""""""""""""""""""""""""""""""""""""""""""" vim-go end """"""""""""

""""""""""""""""""""" YouCompleteMe begin """"""""""""""""
" 不开户preview窗口
set completeopt-=preview

" 设置跳转到方法/函数定义的快捷键
nnoremap <leader>j :YcmCompleter GoToDefinitionElseDeclaration<CR>

" 触发补全快捷键
let g:ycm_key_list_select_completion = ['<TAB>', '<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<c-p>', '<Up>']
let g:ycm_auto_trigger = 1

" 最小自动触发补全的字符大小设置为 2
let g:ycm_min_num_of_chars_for_completion = 2

" YCM的previw窗口比较恼人，还是关闭比较好
set completeopt-=preview
""""""""""""""""""""" YouCompleteMe end""""""""""""""""

"""""""""""""""""""""""""""""" tagbar begin """"""""""""""""""""""""""""
nmap <F8> :TagbarToggle<CR>

" 选取后自动关闭
let g:tagbar_autoclose = 1

" 启动时自动focus
let g:tagbar_autofocus = 1


" for golang
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : '~/.vim/bin/gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }


" for ruby, delete if you do not need
let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
    \ }




"""""""""""""""""""""""""""""" tagbar end """"""""""""""""""""""""""""


""""""""""""""""""""""""""""""" gutentags begin """""""""""""""""""""""""""""""""""
"let g:gutentags_exclude = ['*.css', '*.html', '*.js']
"let g:gutentags_cache_dir = '~/.vim/gutentags'

"map <silent> <leader>jd :CtrlPTag<cr><c-\>w
""""""""""""""""""""""""""""""" gutentags end """""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""" tagbar-phpctags begin """""""""""""""""""""""""""""""""""""""""""""""
"let g:tagbar_phpctags_bin='~/.vim/bin/phpctags'
"let g:tagbar_phpctags_memory_limit = '256M'
""""""""""""""""""""""""""""""""" tagbar-phpctags end """""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""" ctrlp begin """""""""""""""""""""""""""""""
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

map <leader>f :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

"" open in a new tab
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }
""""""""""""""""""""""""""""" ctrlp end """""""""""""""""""""""""""""""
