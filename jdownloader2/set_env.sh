#!/bin/bash
# check UID/GID
# create .env.jdownloader2

# 시작 메시지
echo "##### Start Creating JDownlader2 env_file #####"

# 필요한 정보
UID_JD2=$(id -u $ID_JD2)
GID_JD2=$(id -g $ID_JD2)

# .env.jdownloader2 내용 삭제
echo "Delete previous .env.jdownloader2 content"
cat /dev/null > ./jdownloader2/.env.jdownloader2

echo "USER_ID=$UID_JD2" >> ./jdownloader2/.env.jdownloader2
echo "GROUP_ID=$GID_JD2" >> ./jdownloader2/.env.jdownloader2
echo "VNC_PASSWORD=$PW_JD2" >> ./jdownloader2/.env.jdownloader2

echo -e "Your ID is \e[41;37m$ID_JD2\e[0m."

# 종료 메시지
echo "##### Finish Creating DashDot env_file #####"
echo ""
