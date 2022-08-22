import setuptools

with open("README.md", "r") as fh:
    long_description = fh.read()

setuptools.setup(
    name="pp",
    version="0.0.1",
    author="frehoy",
    author_email="your.email@example.com",
    description="pp",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/frehoy/pp",
    packages=setuptools.find_packages(),
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
    entry_points={"console_scripts": ["pp = pp.cli:main"]},
    python_requires=">=3.10",
)
