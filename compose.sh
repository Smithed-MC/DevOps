echo "Build API"
ARCH=${ARCH-64} docker compose -f dockers/api/docker-compose.yaml up --build --detach
echo "Build Nightly"
docker compose -f dockers/nightly-website/docker-compose.yaml up --build --detach
echo "Build Production"
docker compose -f dockers/prod-website/docker-compose.yaml up --build --detach
