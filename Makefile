# Define default target.
all: install lint test format launch

# Target to install dependencies.
install:
	pip install --upgrade pip
	pip install -r requirements.txt

# Target to run tests with coverage for different components.
test:
	python -m pytest -vvv --cov=hello --cov=greeting --cov=math --cov=web tests
	python -m pytest --nbval notebook.ipynb

# Uncomment the line below to test only the web component.
# python -m pytest -v tests/test_web.py

# Debugging target to enter Python Debugger (pdb) for the first three failures.
debugthree:
	python -m pytest -vv --pdb --maxfail=4

# Format Python code with Black
format:
	black *.py

# Lint Python files to check for coding standards
lint:
	pylint --disable=R,C *.py

# Target to launch the application.
launch:
	python app.py  # Assuming your main application script is named app.py

# Complete sequence of installation, testing, linting, formatting, and launching the app
all: install lint test format launch
