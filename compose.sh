echo "Build API"
ARCH=${ARCH-64} docker compose -f dockers/api/docker-compose.yaml build --no-cache
echo "Build Nightly"
docker compose -f dockers/nightly-website/docker-compose.yaml build --no-cache
echo "Build Production"
docker compose -f dockers/prod-website/docker-compose.yaml build --no-cache
echo "Build Weld"
docker compose -f dockers/weld/docker-compose.yaml build --no-cache
