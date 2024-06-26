
Go look [here](https://github.com/Linbreux/wikmd) for docs & stuff.

Simple bug fix in the `pandoc-xnos` library:

```bash
# After installing the virtual environment
$ sed -i '' 's/1-2/1-3/g' env/lib/python3.10/site-packages/pandocxnos/core.py
```

[ref](https://github.com/tomduck/pandoc-xnos/pull/29)