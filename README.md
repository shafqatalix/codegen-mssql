# codegen-mssql

## Setup Development Environment

- pip install -r dev.txt
- pip install -r requirements.txt

## How to use CLI:

codegen-mssql parms:

| Short | Long Name          | Description                   |
| ----- | ------------------ | ----------------------------- |
| -c    | --connectionstring | Database connection string    |
| -t    | --target           | Target output , default is C# |

python3 setup.py develop

## Supported Targets

- [x] C# (default)
- [ ] Typescript
- [ ] Java
- [ ] Rust

## Publish

- python3 setup.py sdist bdist_wheel

## Refs:

https://medium.com/nerd-for-tech/how-to-build-and-distribute-a-cli-tool-with-python-537ae41d9d78
