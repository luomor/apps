#! /bin/bash
git commit -a -m 'update'
#git push -u origin main
cp -r * ../../aliyun/apps/public/3d-rotating-background-wall
cd ../../aliyun/apps
git commit -a -m 'update'
git push -u origin master
