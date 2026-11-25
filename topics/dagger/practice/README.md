## Dagger practice

1. **Break it, then fix it**: run [`basics/dagger_test_demo.sh`](../basics/dagger_test_demo.sh), then change `add` in `basics/app/calc.py` to return `a - b`. Re-run the script and confirm the pipeline fails with the failing test name in the output. Revert the change and confirm it passes again.

2. **Change the toolchain, not the code**: edit the script to use `python:3.11-alpine` in `from --address=...`. Run it again and note that you didn't install any Python on your machine — the toolchain lives in the container.

3. **Add a syntax-check step**: chain one more `with-exec` before the tests that runs `python -m py_compile calc.py test_calc.py`. Introduce a syntax error and see the pipeline stop at that step.

4. **Turn it into a module**: run `dagger init --sdk=python --name=ci` in a scratch directory, then write a `test` function that takes a `dagger.Directory` source, mounts it into a `python:3.12-alpine` container and returns the output of `python -m unittest`. Call it with `dagger call test --source=./app`. Compare this to the `dagger core` one-liner: what do you gain by having the pipeline in a real language?

5. **Run it in CI**: add a GitHub Actions step that installs the Dagger CLI and runs the same command (see the [`github-action`](../../github-action/) topic). Verify the result matches your laptop run.

- Dagger quickstart: https://docs.dagger.io/quickstart/
