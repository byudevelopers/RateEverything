# Git Practices

Before reading this, if you are in VSCode, click the icon in the top right that looks like an open book with a magnifying glass. This makes .md files easier to read.

![VSCodeView](./icons/VSCodeView.png)

# Starting to Code

## Existing Branch

If a branch already exists that you are coding in, run the following and start coding:
```
git checkout BRANCH_NAME
git pull
```

## New Branch
### Branching off Branches

If you need to make a new branch to code in, first checkout the base branch for your code changes.

I.e., if you are creating a new feature on the leadership screen, first checkout the existing `leadership` branch with:
```
git checkout leadership
git pull
```
Then you can create a new branch from this point with
```
git checkout -b NEW_BRANCH_NAME
```

### Branching off Master

If there is no branch that involves the feature you are creating, you can branch off of master and create a new branch with the following:
```
git checkout master
git pull
git checkout -b NEW_BRANCH_NAME
```

# Pushing code
When you are finished with your code changes and know that your changes work, it is time to add them to your branch!

First run
```
git pull
```
This makes sure that your local branch is up to date with what is currently on the deployed branch. Since you should not be coding on the same branch as everyone else, this should never do anything.

Next run
```
git status
```
this shows you what files have changed and what needs to be added.

To add changes, run
```
git add FILE_NAME
```

If you're adding multiple changes, for example all changes within the `src` directory, you can run
```
git add src/*
```

Rerunning `git status` should reflect what has been added.

If for some reason you have added a file that you did not want to add, run 
```
git restore --staged FILE_NAME
```
Then run the following, but be sure to replace `MESSAGE_HERE` with a summary of the changes that you are committing:
```
git commit -m "MESSAGE_HERE"
```

Finally running the following will push your changes to the remote branch.
```
git push
```

# Merging Branches

If you are ready to add your branch's changes to its parent branch, first checkout and pull the parent branch. This assures that you have the changes that the parent branch has:
```
git checkout PARENT_BRANCH
git pull
```

Then checkout your branch and merge master into your branch
```
git checkout MY_BRANCH
git merge master
```

If there are merge conflicts, you first need to fix them and then follow the instructions above for pushing code.

If there are no merge conflicts, a file should open in a text editor (probably with VIM). Save that file as it is (i.e., in VIM hit `escape` then capital `ZZ`). Now you have local changes that need to be pushed. Run `git push`

Now your local branch is up-to-date with its parent branch

