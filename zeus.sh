#!/bin/bash

# 换清华源
# 备份原始的 sources.list 文件
sudo cp /etc/apt/sources.list /etc/apt/sources.list.backup
# 使用清华源替换原有的源
sudo tee /etc/apt/sources.list << EOF
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy main restricted universe multiverse

deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-updates main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-updates main restricted universe multiverse

deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-backports main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-backports main restricted universe multiverse

deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-security main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-security main restricted universe multiverse
EOF

sudo apt update
sudo apt install python-is-python3 python3-pip mosh universal-ctags docker.io docker-compose -y

# config screen
read -d '' screenrc << EOF
caption always "%{= kw}%-w%{= kG}%{+b}[%n %t]%{-b}%{= kw}%+w %=%d %M %0c %{g}%H%{-}"
shell $SHELL
EOF

echo "$screenrc" > ~/.screenrc

# config git
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.last 'log -1 HEAD'

git config --global color.ui true

git config --global color.diff-highlight.oldNormal    "red bold"
git config --global color.diff-highlight.oldHighlight "red bold 52"
git config --global color.diff-highlight.newNormal    "green bold"
git config --global color.diff-highlight.newHighlight "green bold 22"

git config --global color.diff.meta       "yellow"
git config --global color.diff.frag       "magenta bold"
git config --global color.diff.commit     "yellow bold"
git config --global color.diff.old        "red bold"
git config --global color.diff.new        "green bold"
git config --global color.diff.whitespace "red reverse"

# config vim
git clone https://github.com/simpx/dotfiles
cd dotfiles
sh install.sh

# 增加到sudoers
TMP_FILE=$(mktemp)
# 确保在脚本退出时删除临时文件
trap 'rm -f $TMP_FILE' EXIT
# 将当前的sudoers文件复制到临时文件
cp /etc/sudoers $TMP_FILE
username=`whoami`

# 添加无密码sudo权限的条目
echo "$username ALL=(ALL) NOPASSWD: ALL" >> $TMP_FILE

# 验证修改后的sudoers文件是否有语法错误
visudo -c -f $TMP_FILE
if [ $? -eq 0 ]; then
    # 如果没有错误，覆盖原sudoers文件
    cp $TMP_FILE /etc/sudoers
else
    echo "sudoers编辑有误，更改未应用" 1>&2
    exit 1
fi

# 增加到docker group
sudo usermod -aG docker $username

# 配置vim
./install.sh
