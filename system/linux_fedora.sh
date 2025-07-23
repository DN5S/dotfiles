#!/bin/bash
echo "Phase 1: Installing prerequisites for Fedora..."

# 시스템 최신화 및 필수 도구 설치
sudo dnf update -y
sudo dnf groupinstall -y "Development Tools"
sudo dnf install -y git zsh stow

# Zsh 경로를 /etc/shells에 안전하게 추가 및 기본 셸 지정
ZSH_PATH=$(which zsh)
if ! grep -q "$ZSH_PATH" /etc/shells; then
  echo "Adding $ZSH_PATH to /etc/shells"
  echo "$ZSH_PATH" | sudo tee -a /etc/shells
fi
sudo chsh -s "$ZSH_PATH" "$USER"
