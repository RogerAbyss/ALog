chmod 600 ~/.ssh/id_rsa
eval $(ssh-agent)
ssh-add ~/.ssh/id_rsa
cp .travis/ssh_config ~/.ssh/config
git config --global user.name "abyss_travis"
git config --global user.email roger_ren@qq.com