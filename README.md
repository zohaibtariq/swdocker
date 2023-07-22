# DOCKER

## Steps to follow

### Clone the docker repo
```
git clone git@github.com:zohaibtariq/swdocker.git 
```

### Move to cloned repo
```
cd swdocker
```

### Give executables permission
```
chmod u+x *.sh
```

### To build and up docker
```
./build.sh
```

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

## NOTE

Remember your user must have appropriate permissions to make it work flawlessly.
assuming docker desktop did not require sudo
while hosts do
if it is not like that feel free to edit ./build.sh file first


### DOCKER IS UP WE NEED TO RUN MIGRATIONS NOW

make sure you are inside docker cloned repo, if you have fast hands please wait few seconds (to boot mysql completely) before executing migration command.

```
docker exec -it php bash -c "cd api ; php artisan migrate" 
```

### RUN TEST

```
docker exec -it php bash -c "cd api ; php artisan test" 
```