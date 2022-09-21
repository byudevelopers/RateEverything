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

If you receive a `fatal` warning, it is either because there are merge conflicts to be fixed OR you made a new branch that does not have a remote version. If the latter, running the command provided by git will fix that problem and push your changes. The command should look like the following
```
git push --set-upstream origin BRANCH_NAME
```

# Merging Branches
## Preparing Your Branch
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

## Making the Merge Request
Only make a merge request when you have completely finished your task. This means that no more code needs be added to your branch.

After following the above instructions, go to the [Project Repository](https://github.com/byudevelopers/RateEverything).

In a yellow bar, Github should say something like `{YOUR_BRANCH_NAME} had recent pushes {2} minutes ago` and have a green button on the right that says `Compare & pull request`. Click that button.

This is where you describe the changes that you made. Leave a general title and a description (in the comment box) that describes what changes you made. <i>This does not have to be very specific,</i> just an overview of what was changed so someone looking at your code can easily understand it. Once done, hit `Create pull request`.

Once you have done this, notify somebody who is familiar with the parent branch and can review your code. If the parent branch is the `master` branch, notify somebody in the presidency (JJ, Stephen, Keifer, J, or Spencer). Note that they might tell you to fix something. If so, all you have to do is add the changes, commit, and push them. The pull request will update with the most recent changes on your branch.

## Reviewing Merge Requests
Go to the `pull requests` tab in the [Project Repository](https://github.com/byudevelopers/RateEverything). Review the code under `files changed`. If necessary, checkout the branch of the merge request and verify that it works as intended. If there are issues to be resolved, leave comments for the person who made the request and notify them of the comments. Once they have resolved all issues and all looks well, approve and merge the branch.