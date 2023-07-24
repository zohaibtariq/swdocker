# DOCKER SW API

## NOTE
###
Remember your user must have appropriate permissions to make it work flawlessly.
assuming docker desktop did not require sudo
while hosts do
if it is not like that feel free to edit ./build.sh file first

# STEPS TO FOLLOW
### Please follow all steps in sequence 1 by 1
###
#### STEP 1 - clone the docker repo
```
git clone git@github.com:zohaibtariq/swdocker.git 
```

#### STEP 2 - move to cloned repo
```
cd swdocker
```

#### STEP 3 - give executables permission
```
chmod u+x ./*.sh
```

#### STEP 4 - build and up the docker
```
./build.sh
```

#### STEP 5 - composer install for dependencies

make sure you are inside docker cloned repo, if you have fast hands please wait few seconds (to boot mysql completely) before executing migration command.

```
docker exec -it php bash -c "cd api ; composer install" 
```

#### STEP 6 - docker is up we need to run migrations now

make sure you are inside docker cloned repo, if you have fast hands please wait few seconds (to boot mysql completely) before executing migration command.

```
docker exec -it php bash -c "cd api ; php artisan migrate" 
```

OR

```
docker exec -it php bash -c "cd api ; php artisan migrate:fresh" 
```

#### STEP 7 - seed the database
```
docker exec -it php bash -c "cd api ; php artisan db:seed" 
```

#### STEP 8 - clear cache (IMPORTANT DO NOT SKIP)
```
docker exec -it php bash -c "cd api ; php artisan config:clear ; php artisan cache:clear ; php artisan route:clear ; php artisan view:clear " 
```

#### STEP 9 - run test

```
docker exec -it php bash -c "cd api ; php artisan test" 
```

OR

```
docker exec -it php bash -c "cd api ; ./vendor/bin/phpunit --configuration phpunit.xml" 
```


#### STEP 10 - generate docs

```
docker exec -it php bash -c "cd api ; php artisan l5-swagger:generate" 
```

DOCKER SETUP IS COMPLETED.

###
## Additional Helper Command (No Need To Execute Them)
###

### Docker down
```
./down.sh
```

### Docker up after docker down
```
./up.sh
```

### Remove docker completely
```
./remove.sh
```

### Mysql database details can be found at
```
mysql.env
```