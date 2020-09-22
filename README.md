# PHP Starting application with emphasis on running with Docker


## Run with docker
1. Change into root directory of project... not /root/ folder
2. Open terminal and run 
```
docker build -t widget .
docker run -d -p 8080:80 -p 4443:443 -v /Users/username/repo/Daily-Widget/root:/var/www widget
```
3. Remove all running containers to free up port
*Warning, will stop all containers*
```
docker rm -f $(docker ps -aq)
```

4. To get running containers
```
docker ps -a
```

5. To stop certain container; 
*run step (4) and get container ID and replace %%% with that container ID*
```
docker rm -f %%%
```


