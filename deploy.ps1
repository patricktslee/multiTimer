Write-Output "Starting flutter build for web.";
flutter build web --web-renderer html --release;
Write-Output "Starting deployment for mt";
Write-Output "Removing the old docker image patricktslee/mt-anchk-org:uat";
docker image rm patricktslee/mt-anchk-org:uat;
Write-Output "building the docker image patricktslee/mt-anchk-org:uat";
docker build -t patricktslee/mt-anchk-org:uat .;
Write-Output "pushing the docker image patricktslee/mt-anchk-org:uat";
docker push patricktslee/mt-anchk-org:uat;
Write-Output "stopping the kube service";
kubectl delete -f mt-anchkorg.yml
Write-Output "starting the kube service";
kubectl apply -f mt-anchkorg.yml
Write-Output "checking the kube pod status";
while (1) {
    clear;
    kubectl get all -n mt-anchkorg;
    sleep 5;
}