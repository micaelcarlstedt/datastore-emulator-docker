
GCLOUD_SDK_VERSION=304.0.0-alpine

.PHONY: build
build:
	docker build --build-arg GCLOUD_SDK_VERSION=$(GCLOUD_SDK_VERSION) --tag micael/datastore-emulator:$(GCLOUD_SDK_VERSION) --tag micael/datastore-emulator:latest .

.PHONY: push
push:
	docker push micael/datastore-emulator
