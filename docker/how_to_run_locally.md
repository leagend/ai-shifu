current docker compose up -d may lead to container exit，to solve the know issue.

got src/api to build a new image:

```
cd src/api
docker build -t aishifu/ai-shifu-api:latest . 
cp ../../docker
cp .env.example .env
# add an api-key for model provider and model name to .env. Attention, for the silicon model, it needs a prefix "silicon/", such as "silicon/Qwen/Qwen2.5-7B-Instruct"

docker compose up -d
```

The api container may not run success because the mysql may not be ready. If it happens，my suggestion is to connect the mysql，and run the ai-shifu*.sql in mysql container before try restart it again.

To solve the login issue on http://localhost:8081/，
the username shows in /app/auth_config.yml is ai-shifu, but the password had been hashed. To solve it, you can run a script to create a new one then replace it which in container. You can find the clear text in that script 

```
cd src\cook\tools
python generate_password_hash.py
```


When all goes fine, the ai-shifu runs on http://127.0.0.1:8080, as well as the cook site runs on http://127.0.0.1:8081.

Enjoy it!
