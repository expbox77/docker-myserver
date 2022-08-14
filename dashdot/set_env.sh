#!/bin/bash
# check Synology DSM version
# create .env.dashdot

# 시작 메시지
echo "##### Start Creating DashDot env_file #####"
echo "Create new DSM version INFO"

# Synology DSM VERSION 파일 경로
VERSION_FILE=/etc.defaults/VERSION

# 필요한 정보
version="productversion"
build="buildnumber"
update="smallfixnumber"

# 정보 뽑아내기
dsm_version=($(grep "$version\|$build\|$update" $VERSION_FILE | cut -f 2 -d '"'))

# .env.dashdot 내용 삭제
echo "Delete previous .env.dashdot content"
cat /dev/null > ./dashdot/.env.dashdot


# .env.dashdot에 새로운 내용 삽입
# 종료 메시지
echo -e "The current DSM version is [ \e[41;37m${dsm_version[0]}-${dsm_version[1]} Update ${dsm_version[2]}\e[0m ]"
echo "DASHDOT_OVERRIDE_OS=Synology DSM ${dsm_version[0]}-${dsm_version[1]} Update ${dsm_version[2]}" >> ./dashdot/.env.dashdot
echo "##### Finish Creating DashDot env_file #####"
echo ""
