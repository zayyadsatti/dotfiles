#!/bin/env bash

# Install the all tools that are required inorder to use
# all the configuration in current working directory

RESET="\033[0m"
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"

log_info() { echo -e "${BLUE}[INFO]${RESET} $*"; }
log_success() { echo -e "${GREEN}[SUCCESS]${RESET} $*"; }
log_warn() { echo -e "${YELLOW}[WARN]${RESET} $*" >&2; }
log_error() { echo -e "${RED}[ERROR]${RESET} $*" >&2; }

declare -a packages
packages=(
  "ripgrep"
  "obsidian"
  "git"
  "bat"
  "fd"
  "foot"
  "zathura"
  "gitui"
  "hyprlock"
  "niri"
  "nushell"
  "neovim"
  "atuin"
  "fish"
  "restic"
  "resticprofile"
  "starship"
  "vicinae"
  "wezterm"
  "yazi"
  "zellij"
  "noctalia"
)

is_command_found() { command -v "$1" >/dev/null 2>/dev/null; }
echo_if_command_found() { is_command_found "$1" && echo "${2:-$1}"; }

root_gain_cmd() {
  echo_if_command_found "sudo" && return
  echo_if_command_found "doas" && return

  log_error "No known way to get root access. Aborting..."
  exit 1
}

if is_command_found "yay"; then
  PACKAGE_MANAGER="yay"
elif is_command_found "paru"; then
  PACKAGE_MANAGER="paru"
elif is_command_found "pacman"; then
  PACKAGE_MANAGER="pacman"
else
  log_error "No Known package manager found. Aborting..."
  exit 1
fi

log_info "Installation Started..."
log_info "Using $PACKAGE_MANAGER as package manager"
# shellcheck disable=SC2162
read -t 5 -N 1 -p "Enter any key to abort: " key

if [ -n "$key" ]; then
 log_error "Aborting..."
 exit 1
fi

$PACKAGE_MANAGER -S "${packages[@]}"
