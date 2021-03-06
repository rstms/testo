# make clean targets

docs: clean-docs ## generate Sphinx HTML documentation, including API docs
	sphinx-apidoc -o docs/ testo
	$(MAKE) -C docs html
	$(MAKE) -C docs clean
	$(browser) docs/_build/html/index.html

clean-docs:
	rm -f docs/testo.rst
	rm -f docs/modules.rst
	$(MAKE) -C docs clean

servedocs: docs ## compile the docs watching for changes
	watchmedo shell-command -p '*.rst' -c '$(MAKE) -C docs html' -R -D .
