if version < 600
  syntax clear
elseif exists('b:current_syntax') && b:current_syntax != 'mi'
  finish
endif

syntax case ignore

" Basics {{{
" Decimal numbers
syntax match miNumber /\<[-]\?\d\+\>/
" Hex numbers
syntax match miNumber /\<\x\+\>/
" Floating-point numbers
syntax match miNumber /\<[+-]\?\d\+\(\.\d\+\)\?\([eE][+-]\?\d\+\)\?\>/

syntax region miHexString start=/h'/ end=/'/
syntax region miBinaryString start=/b'/  end=/'/
syntax region miString start=/'/ skip=/\\'/ end=/'/

syntax match miLabel /\w\+:/

syntax match miSeparator /[,;]/
"}}}

" Registers {{{
" This is for the regular registers R0 ... R15
let i = 0
while i < 16
    execute 'syntax match miRegister /\<r' . i . '\>/'
    let i = i + 1
endwhile
" Special (privileged) registers
syntax keyword miRegister ipl rkmap sb sl scbadr pcbadr
" Special (aliased) registers
syntax keyword miSpecialRegister bp hp sp pc
"}}}

" Instructions {{{
syntax keyword miControlFlowInstruction halt call ret jump
syntax keyword miControlFlowInstruction jv jnv jeq jne jgt jge jlt jle jc jnc

syntax keyword miPrivInstruction rei sppcb lpcb spsb spsl
syntax keyword miPrivInstruction spscbadr sppcbadr spipl sprkmap spmapen
syntax keyword miPrivInstruction lsb lsl lscbadr lpcbadr lipl lrkmap lmapen

syntax match miUnprivInstruction /\<move[nca]\?\>/
syntax keyword miUnprivInstruction rkalarm cmp clear conv
syntax keyword miUnprivInstruction or andnot xor sh rot 
syntax keyword miUnprivInstruction add sub mult div pushr popr
syntax keyword miUnprivInstruction exts ext ins finds findc jbssi jbcci chmk
syntax keyword miUnprivInstruction sbpsw lbpsw
" }}}

syntax match miDataType /\<[bhwfd]\>/

syntax match miOperator /[-+*!\/]/

syntax match miImmediate /\<i\>/

syntax keyword miControlDirective seg end equ

syntax keyword miIncludeDirective import all exp export

syntax keyword miDataDirective dd res reserve ali align

syntax match miTodo /\<\(todo\|xxx\|fixme\|note\):\?\>/ contained

syntax match miComment /--.*$/ contains=miTodo,@Spell

"" Highlights Linking {{{
highlight def link miTodo Todo
highlight def link miComment Comment
highlight def link miString String
highlight def link miHexString String
highlight def link miBinaryString String
highlight def link miNumber Number
highlight def link miImmediate Typedef
highlight def link miRegister Character
highlight def link miSpecialRegister Special
highlight def link miDataType Type
highlight def link miOperator Operator
highlight def link miSeparator Normal
highlight def link miLabel Identifier
highlight def link miPrivInstruction Function
highlight def link miUnprivInstruction Function
highlight def link miControlFlowInstruction Statement
highlight def link miDataDirective PreProc
highlight def link miControlDirective PreProc
highlight def link miIncludeDirective Include
""}}}

let b:current_syntax = "mi"
