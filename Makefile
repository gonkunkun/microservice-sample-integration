WEB_REPOSITORY := https://github.com/gonkunkun/microservice-sample-web-1.git
USER_REPOSITORY := https://github.com/gonkunkun/microservice-sample-user.git
USER_REPOSITORY := https://github.com/gonkunkun/microservice-sample-tweet.git

clone:
	git clone $(WEB_REPOSITORY) ./services/microservice-sample-web-1
	git clone $(USER_REPOSITORY) ./services/microservice-sample-user
	git clone $(TWEET_REPOSITORY) ./services/microservice-sample-tweet

pull:
	cd ./services/microservice-sample-web-1 && git pull
	cd ./services/microservice-sample-user && git pull
	cd ./services/microservice-sample-tweet && git pull

build:
	docker-compose build

up:
	docker-compose up -d

down:
	docker-compose down

seed:
	docker-compose exec user node /app/scripts/initialize.js
	docker-compose exec tweet node /app/scripts/initialize.js