#!/bin/sh

HERE="$PWD"
PATCH_FLAG="EasyAria2Config"

. "$HERE/config.in"

SUB_EXPR1="s|@path_to_config@|${ARIA2_CONFIG_DIR}|g"
SUB_EXPR2="s|@path_to_download@|${ARIA2_DOWNLOAD_DIR}|g"

# 配置存在则放弃修改
[ -f "${ARIA2_CONFIG_DIR}/aria2.conf" ] && {
  echo "Found the aria2.conf installed!"
  echo "Are you sure to continue? [Y/n]"
  read choice
  case "$choice" in
      n|N)
	  exit 1;;
  esac
}

# 拷贝模板配置文件
mkdir -p "${ARIA2_CONFIG_DIR}"
cp -f "$HERE/aria2.conf" "${ARIA2_CONFIG_DIR}"
#echo -n "" > "${ARIA2_CONFIG_DIR}/aria2.cookies"
echo -n "" > "${ARIA2_CONFIG_DIR}/aria2.session"

mkdir -p ~/.local/bin
cp -f "$HERE/bin"/* ~/.local/bin
chmod 0755 ~/.local/bin/aria2*
rm -rf "${ARIA2_CONFIG_DIR}/yaaw-en"
rm -rf "${ARIA2_CONFIG_DIR}/yaaw-zh-hans"
#cp -rf yaaw-zh-hans/ "${ARIA2_CONFIG_DIR}/yaaw-zh-hans" 2> /dev/null

# 修改模板配置文件
sed -i -e "${SUB_EXPR1};${SUB_EXPR2}" ~/.local/bin/aria2d
sed -i -e "${SUB_EXPR1};${SUB_EXPR2}" ~/.local/bin/aria2cli
sed -i -e "${SUB_EXPR1};${SUB_EXPR2}" "${ARIA2_CONFIG_DIR}/aria2.conf"

# 检查PATH与修改PATH
type aria2cli > /dev/null 2>&1 && \
    type aria2d > /dev/null 2>&1
if [ $? != 0 ]; then
  grep -q "${PATCH_FLAG}" ~/.profile || \
    cat >> ~/.profile <<EOF
# ${PATCH_FLAG}
# Add ~/.local/bin
export PATH=\$PATH:~/.local/bin
EOF
  grep -q "${PATCH_FLAG}" ~/.bashrc || \
    cat >> ~/.bashrc <<EOF
# ${PATCH_FLAG}
# Add ~/.local/bin
export PATH=\$PATH:~/.local/bin
EOF

fi > /dev/null 2>&1
