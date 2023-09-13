.PHONY: build
build:
	docker build -t parca-demo:python .
	docker build -t parca-demo:python-no-frame-pointer -f Dockerfile.no_frame_pointer .

.PHONY: pex
pex:
	# pex $(pip freeze) -o fibonnaci.pex
	pex -r requirements.txt -o parca-demo.pex

.PHONY: pex-run
pex-run:
	./parca-demo.pex -- threadpool_main.py
