#!/usr/bin/env bash

cargo build -p slint-lsp &> /dev/null
if [ $? -eq 0 ]; then
  cargo run -p slint-lsp --quiet -- "$@"
else
  slint-lsp "$@"
fi

