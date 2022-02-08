env : .venv/bin/activate

.venv/bin/activate : requirements.txt setup.py
	test -d .venv || python3 -m venv .venv
	. .venv/bin/activate; pip install --upgrade pip setuptools wheel; pip install -Ur requirements.txt ; pip install --editable .
	touch .venv/bin/activate
	@echo 'Run "source .venv/bin/active" to activate your new virtual env'

clean :
	rm -rf .venv
	find . -name "*.pyc" -delete
