#!/bin/bash

active_terminal_workdir() {
  APP_ID=$(niri msg --json focused-window | jq -e '.app_id') || return 1
  [[ "\"Alacritty\"" != "${APP_ID}" ]] && return 1

  TERMINAL_PID=$(niri msg --json focused-window | jq -e '.pid') || return 1
  [[ -z "$TERMINAL_PID" ]] && return 1

  SHELL_PID=$(pgrep --parent "$TERMINAL_PID" '\b(bash|fish|sh|zsh)\b' | head -n1) || return 1
  [[ -z "$SHELL_PID" ]] && return 1

  SHELL_WORKDIR=$(readlink "/proc/$SHELL_PID/cwd") || return 1
  [[ ! -d "$SHELL_WORKDIR" ]] && return 1

  echo "$SHELL_WORKDIR"
}

WORKDIR=$(active_terminal_workdir) && cd "$WORKDIR"

exec alacritty "$@"

