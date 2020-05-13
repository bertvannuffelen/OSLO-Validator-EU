run:
	docker-compose -f docker-compose-dvl.yml up -d


buildf:
	cd Validator-frontend && docker build -f Dockerfile -t terraformtestcontainerregistry.azurecr.io/oslo2/validator-eu-frontend:1.1.1 --build-arg NPM_TOKEN=1a5c678e-c077-4854-8eeb-07aa1413b18e .

build-fdev:
	cd Validator-frontend && docker build -f Dockerfile -t terraformtestcontainerregistry.azurecr.io/oslo2/validator-eu-frontend:dev-1.1 --build-arg NPM_TOKEN=1a5c678e-c077-4854-8eeb-07aa1413b18e .

buildb:
	cd Validator-Backend && docker build -f Dockerfile -t terraformtestcontainerregistry.azurecr.io/oslo2/validator-eu-backend:1.1 --build-arg NPM_TOKEN=1a5c678e-c077-4854-8eeb-07aa1413b18e .
	
gitlabci:
	 docker run --rm -t -i -v $CURDIR:$CURDIR -v /var/run/docker.sock:/var/run/docker.sock --workdir $CURDIR gitlab/gitlab-runner exec docker  --docker-privileged  build


