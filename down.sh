#!/bin/bash
# 도커 컴포즈 종료

# 버전 정보 가져오기
source .version

# 네트워크 정보 가져오기
source .network

# .secret 파일 존재 확인
Secret_File=.secret

if [[ -f "$Secret_File" ]]; then
    source $Secret_File
    
else
    echo -e "\e[43;31mERROR!\e[0m"
    echo "\$Secret_File file could not be found." 
    echo -e "Exit the task. Error Code \e[43;31m101\e[0m"
    exit 101
fi

# 종료 메시지
echo "##### Start Docker-Compose Shutdown Process #####"
echo ""

# 각 폴더명 추출
for entry in */
do
    # .secret에 함수로 지정된 변수 불러오기
    ${entry:0:-1}

    # 각 폴더에 저장된 docker-compose 종료
    docker-compose -f ./${entry:0:-1}/docker-compose.yml down
done

echo "##### Finish Docker-Compose Shutdown Process #####"
echo ""

# 네트워크 삭제
echo ""
echo "##### Start Deleting External Network #####"

for check_net in ${docker_net[@]}
do
    if [[ "$(docker network ls)" == *$check_net* ]]; then
        # 있을 때 삭제
        echo "Deleting [ $check_net ] network."
        docker network rm $check_net > /dev/null
        echo "Done!"

    else
        echo "Could not find [ $check_net ] network."
    fi
done

echo "##### Finish Deleting External Network #####"
echo ""

echo "All jobs successfully completed."
