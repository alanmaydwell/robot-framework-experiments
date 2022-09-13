# Robot Framework Experiments
Some experiments in using Robot Framework

## `task_hello_from_py.robot`
Simple example of using a function imported from a python file `my_lib.py` and printing the output to the console.

Couple of things to note that are different from actual Python:

- The import includes the .py file extension: `Library  my_lib.py`
- The Python function call does not include terminal `()`brackets

## `task_simple_process_run.robot`
Simple example of running a external process using Robot Framework Process Library. Runs `go.bat`

## `task_run_cypress_script.robot`
Robot Framework does not currently include convenient support for working with Cypress. This is an example of invoking a Cypress script from Robot Framework and capturing its output.

Note

- Requires a Cypress install to work. Not included here (apart from a few files in the cypress directory but these are **not** sufficient to run Cypress).
- I've found that Cypress seems to have restrictions about the directories Cypress files can be run from and will sometimes claim no spec file found even when full path to an actual file is provided as an argument. Found that it does cooperate with files in files in `cypress/e2e/` directory.
- The script uses two ways of invoking the Cypress script: one using a Python function imported from `cypress_runner.py` and another that uses Robot framework Process library.
- The Python function run tends to be a few seconds quicker. It also captures the output of the Cypress script in a nicer way whereas the non-python one includes a lot of weird characters, e.g. `ΓöÇΓ`(Python version applies `decode` method to output but I've not worked out if this is possible for the non-Python one)
