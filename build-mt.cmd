@echo Removing the old docker image patricktslee/mt-anchk-org:uat
docker image rm patricktslee/mt-anchk-org:uat

@echo building the flutter web
flutter build web --web-renderer canvaskit --release

@echo building the docker image patricktslee/mt-anchk-org:uat
docker build -t patricktslee/mt-anchk-org:uat .

@echo pushing the docker image patricktslee/mt-anchk-org:uat
docker push patricktslee/mt-anchk-org:uat

@echo stopping the kube service
kubectl delete -f mt-anchkorg.yml

@echo starting the kube service
kubectl apply -f mt-anchkorg.yml

@echo checking the kube pod status
kubectl get all -n mt-anchkorg