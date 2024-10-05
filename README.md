monstar o container 

```
docker-compose up -d --build
```


               ## Para e remove o container
                sh ```
                docker stop glances || true
                docker rm glances || true
                docker rmi glances-glances || true
                ```