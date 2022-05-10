" Vim syntax highlighting definition for FASTL
" Copyright 2018 The MathWorks, Inc.

" See http://vim.wikia.com/wiki/Creating_your_own_syntax_files
" and http://vimdoc.sourceforge.net/htmldoc/syntax.html#syntax

if exists("b:current_syntax")
    finish
endif
let b:current_syntax = "fastl"

" To fold/unfold FASTL nodes and lists, use the command: za
syn region fastlFold start="(" end=")" transparent fold
syn region fastlFold start="\[" end="\]" transparent fold

syn match fastlComment ";.*$"

syn match fastlSrcPos "#[0-9][0-9]*"

syn keyword fastlKeyword MatlabCode Function Assignment BangStatement BreakStatement CommandInvocation
syn keyword fastlKeyword EmptyStatement ExpressionStatement ForStatement GlobalStatement IfStatement
syn keyword fastlKeyword ImportCommand MultiLhsAssignment ParforStatement PersistentStatement Print
syn keyword fastlKeyword SpmdStatement SwitchStatement TryStatement WhileStatement
syn keyword fastlKeyword ContinueStatement ReturnStatement
syn keyword fastlKeyword AnonymousFunction BraceOperation CellArray CharVectorIdentifier
syn keyword fastlKeyword CharVectorLiteral ColonIndex DotOperation DotParenOperation EndIndex
syn keyword fastlKeyword Matrix RangeExpression ParenOperation ParenthesizedExpression StringLiteral
syn keyword fastlKeyword Identifier Field
syn keyword fastlKeyword Ignored ElseifBlock ElseBlock CatchBlock CaseSelection OtherwiseBlock Row
syn keyword fastlKeyword CustomNode
syn keyword fastlKeyword Classdef Attribute PropertiesBlock Property Validation MethodsBlock Method
syn keyword fastlKeyword EventsBlock Event EnumerationBlock Enumerator
syn match fastlKeyword "\~"
syn match fastlKeyword "UnaryOperation:.[^ ]\?"
syn match fastlKeyword "BinaryOperation:.[^ ]\?"
syn match fastlKeyword "NumberLiteral:"

syn keyword fastlAddl def pdef unknown variable nested local_function external
syn keyword fastlAddl integer double complex

syn match fastlSuffix "%[A-Za-z0-9][A-Za-z0-9]*"

syn match fastlString "\"[^\n]*\""
syn match fastlString "'[^\n]*'"

hi def link fastlComment Comment
hi def link fastlSrcPos PreProc
hi def link fastlKeyword Statement
hi def link fastlAddl Type
hi def link fastlSuffix Constant
hi def link fastlString Constant
