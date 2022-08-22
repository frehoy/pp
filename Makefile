env : .venv/bin/activate

.venv/bin/activate : lock.txt requirements.txt requirements_dev.txt setup.py
	@# Create a new venv if it doesn't exist already
	test -d .venv || python3 -m venv .venv 
	@# Always use latest pip, setuptools and wheel
	.venv/bin/pip install --upgrade pip setuptools wheel 
	@# Install requirements
	.venv/bin/pip install --requirement requirements_dev.txt 
	@# If we have a setup.py, install the package as editable
	test -f setup.py && .venv/bin/pip install --editable . 
	@# Freeze our versions to the lockfile
	.venv/bin/pip freeze --exclude-editable > lock.txt
	@# Touch .venv/bin/activate so make knows it's fresh
	touch .venv/bin/activate 
	@echo 'Run "source .venv/bin/active" to activate your new virtual env'

clean :
	rm -rf .venv
	find . -name "*.pyc" -delete
	rm -rf *.egg-info
	rm -rf .mypy_cache
	rm -rf .pytest_cache
	find . -name '*__pycache__*' -delete

update : env
	@# Clear the lockfile
	:> lock.txt
	@# Update all the dependencies
	.venv/bin/pip install --upgrade --requirement requirements_dev.txt
	.venv/bin/pip freeze --exclude-editable > lock.txt
	touch .venv/bin/activate

dbuild : 
	 docker build -t pp:latest .

ddoit : dbuild
	docker run --interactive --tty --rm pp:latest pp --doit

check: env
	.venv/bin/black .
	.venv/bin/mypy pp test
	.venv/bin/isort pp test
	.venv/bin/pytest