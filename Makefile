.PHONY: up down kaf

up: 
	docker-compose up -d 

down:
	docker-compose down

goto-kaf:
	docker exec -it kafka-listeners-explained_kafka-kaf_1 bash