#!/bin/bash
echo "Starting Dotfiles Deployment: $(date +'%Y-%m-%d %H:%M:%S')"
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 1. OS별 선행 조건 스크립트 실행
# 현재는 Fedora만 지원
source "$DOTFILES_DIR/system/linux_fedora.sh"

# 2. 공통 설정 스크립트 실행
source "$DOTFILES_DIR/system/common.sh"

# 3. Stow를 이용한 심볼릭 링크 생성
echo "Creating symbolic links with Stow..."
# config/ 디렉토리 안의 모든 폴더에 대해 stow를 실행
for dir in "$DOTFILES_DIR"/config/*; do
    if [ -d "$dir" ]; {
        # 폴더 이름만 추출 (예: zsh, p10k)
        stow_pkg=$(basename "$dir")
        echo "Stowing $stow_pkg..."
        # --dir 플래그는 stow를 실행하는 위치를 기준으로 하므로 한 단계 위를 지정
        stow --verbose --target="$HOME" --dir="$DOTFILES_DIR/config" "$stow_pkg"
    }
done

echo ""
echo "Deployment finished at $(date +'%Y-%m-%d %H:%M:%S') Restart your shell or log back in."
