#!/usr/bin/env sh
# edba111a2be8bcb10d1ffb2072116c84
# 确保脚本抛出遇到的错误
# set -e

# 生成静态文件
npm run build

# 进入生成的文件夹
cd docs/.vuepress/dist

# deploy to github
echo 'www.wangjinhai.cn' > CNAME

if [ -z "$GITHUB_TOKEN" ]; then
  echo "部署到码云"
  msg='deploy'
  githubUrl=git@gitee.com:jinhaiwang/giteeblog.git
else
  echo "github"
  msg='来自github actions的自动部署'
  githubUrl=https://wangjinhai555:${GITHUB_TOKEN}@github.com/wangjinhai555/githubblog.git
  git config --global user.name "wangjinhai"
  git config --global user.email "506984994@qq.com"
fi
echo "git init"
git init
echo "git add -A"
git add -A
echo "git commit -m "
git commit -m "${msg}"

echo "git push"
git push -f $githubUrl master:gh-pages # 推送到github

## deploy to coding
#echo 'blog.wangjinhai.cn' > CNAME  # 自定义域名
#echo 'google.com, pub-7828333725993554, DIRECT, f08c47fec0942fa0' > ads.txt # 谷歌广告相关文件
#
#if [ -z "$CODING_TOKEN" ]; then  # -z 字符串 长度为0则为true；$CODING_TOKEN来自于github仓库`Settings/Secrets`设置的私密环境变量
#  codingUrl=git@e.coding.net:xgy/xgy.git
#else
#  codingUrl=https://HmuzsGrGQX:${CODING_TOKEN}@e.coding.net/xgy/xgy.git
#fi
#git add -A
#git commit -m "${msg}"
#git push -f $codingUrl master # 推送到coding

## deploy to coding
#echo 'blog.wangjinhai.cn' > CNAME  # 自定义域名
#echo 'google.com, pub-7828333725993554, DIRECT, f08c47fec0942fa0' > ads.txt # 谷歌广告相关文件
#
#if [ -z "$CODING_TOKEN" ]; then  # -z 字符串 长度为0则为true；$CODING_TOKEN来自于github仓库`Settings/Secrets`设置的私密环境变量
#  codingUrl=git@e.coding.net:xgy/xgy.git
#else
#  codingUrl=https://HmuzsGrGQX:${CODING_TOKEN}@e.coding.net/xgy/xgy.git
#fi
#git add -A
#git commit -m "${msg}"
#git push -f $codingUrl master # 推送到coding


cd - # 退回开始所在目录
rm -rf docs/.vuepress/dist
