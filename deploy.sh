docker build -t stephengrider/multi-client -f ./client/Dockerfile ./client
docker build -t stephengrider/multi-server -f ./server/Dockerfile ./server
docker build -t stephengrider/multi-worker -f ./worker/Dockerfile ./worker
docker push stephengrider/multi-client
docker push stephengrider/multi-server
docker push stephengrider/multi-worker
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=stephengrider/multi-server
