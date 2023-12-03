 cd ..

 echo '开始编译clientFront...'
./gradlew front-end:dist

rm -rf ./docker/nginx/wwwroot/client/*
cp -r ./front-end/dist/* ./docker/nginx/wwwroot/client

echo '开始编译client-server...'
./gradlew bs-server:bootJar

rm -rf ./docker/server/financial.jar
cp ./bs-server/build/libs/financial-0.1.jar ./docker/server/financial.jar

cd ./docker
docker-compose up -d

echo 'docker编译完成，执行 docker-compose up -d 启动服务即可'
echo 'client访问127.0.0.1:89'
