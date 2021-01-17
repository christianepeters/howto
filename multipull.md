# Pull multiple git repositories at once

I'd like to pull multiple git repositories at once. I could `cd` in each of the repositories and run `git pull`.

```
folder-containing-git-repos
├── gitrepo1
├── gitrepo2
├── gitrepo3
├── gitrepo4
```

A neat way to do all at once is to run:
```
find . -mindepth 1 -maxdepth 1 -type d -print -exec git -C {} pull \;
```

I created an alias in `~/.bash_profile` called `multipull`. Alternatively you can use this [bash script](code/multipull.sh) and run it on the top level (in my case `folder-containing-git-repos`).

---
Credit: https://gabac.blog/posts/git-pull-many-repos-at-once/
