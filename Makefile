.PHONY: build
build:  # Should be run in project root	- results go in `target/`
	docker volume create --name maven-repo && \
	docker run --rm -it \
		-v maven-repo:/root/.m2 \
		-v "${shell pwd}":/usr/src/mymaven \
		-w /usr/src/mymaven \
		maven:3.9.3-eclipse-temurin-8-focal \
		mvn clean install


.PHONY: run-jenkins
run-jenkins:
	docker run -p 8080:8080 -p 50000:50000 --restart=on-failure -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts-jdk11
