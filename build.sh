echo "Adding Host started..."
sudo ./host-helper.sh addhost sw.api.local
echo "Adding Host completed..."

echo "Cloning API ..."
git clone -b master git@github.com:zohaibtariq/swapi.dev.git api

echo "Building Docker..."
docker compose build

echo "Composer Installing dependencies..."

cp api/.env.example api/.env

docker exec -it php bash -c 'cd api ; composer install; php artisan key:generate ; php artisan route:clear; php artisan view:clear ; php artisan cache:clear ; php artisan config:clear ; php artisan config:cache'

echo "Starting Docker..."
docker compose up -d

echo -e "\033[33;32m Environment Setup Completed ... :)"
