@echo off
vim -E -s -N --cmd "set rtp+=." -c "exe 'so' argv()[0]" -c q -- py/pycompiler.vim %*
