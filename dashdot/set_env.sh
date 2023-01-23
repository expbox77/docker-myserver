#!/bin/bash
# Check Synology DSM version
# Create .env

SAVE_DIR='./env/dashdot.env'

# 시작 메시지
echo -e "##### Start Creating DashDot env_file #####"
echo -e "Create new DSM version INFO"

# Synology DSM VERSION 파일 경로
source /etc.defaults/VERSION

# dashdot.env 내용 삭제
echo -e "Delete previous dashdot.env content"
cat /dev/null > $SAVE_DIR

# dashdot.env에 새로운 내용 삽입
echo -e "The current DSM version is [ \e[41;37m${productversion}-${buildnumber} Update ${smallfixnumber}\e[0m ]"
echo -e "DASHDOT_OVERRIDE_OS=Synology DSM ${productversion}-${buildnumber} Update ${smallfixnumber}" >> $SAVE_DIR

# 종료 메시지
echo -e "##### Finish Creating DashDot env_file #####"
