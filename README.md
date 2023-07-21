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
