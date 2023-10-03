echo "Build API"
docker compose -f dockers/api/docker-compose.yaml build
echo "Build Nightly"
docker compose -f dockers/nightly-website/docker-compose.yaml build
echo "Build Production"
docker compose -f dockers/prod-website/docker-compose.yaml build