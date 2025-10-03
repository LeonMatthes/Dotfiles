#!/usr/bin/env bash

cargo build --release -p slint-lsp &> /dev/null
if [ $? -eq 0 ]; then
  cargo run --release -p slint-lsp --quiet -- "$@"
else
  slint-lsp "$@"
fi

