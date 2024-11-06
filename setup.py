from setuptools import setup, find_packages;

with open ("README.md", "r",encoding="utf-8") as readme:
    long_description=readme.read()

with open ("requirements.txt","r",encoding="utf-8") as reqs:
    requirements=reqs.read()

setup(
        name="codegen-mssql",
        version="0.0.1",
        author="Shafqat",
        author_email="broxtontee@gmail.com",
        license="",
        description="Codegen for Database object in MS SQL Server Database i.e. C#, Typescript",
        long_description = long_description,
        long_description_content_type = "text/markdown",
        url = '<github url where the tool code will remain>',
        py_modules = ['my_tool', 'app'],
        packages = find_packages(),
        install_requires = [requirements],
        python_requires='>=3.7',
        classifiers=[
            "Programming Language :: Python :: 3.13.0",
            "Operating System :: OS Independent",
        ],
        entry_points = '''
            [console_scripts]
            codegen-mssql=tool:cli
        '''
)