# Contributing
This Contribution guide describes:

- [How we work with branches](*Branches)?
- [How we work with commits](*Commits)?
- [How we version our app?](*Version)
- [how we test our application?](*Testing)
- [How we work with issues/PRs](*Issue)?


## <a name="Branches">Branches model and naming</a>

We Use [Github Flow](https://nvie.com/posts/a-successful-git-branching-model/).

### Branches model
#### The main branches
The central repo holds two main branches with an infinite lifetime:
1. `master`:
We consider `origin/master` to be the main branch where the source code of `HEAD` always reflects a production-ready state. When changes are merged into `master`, this is a new production release by definition.
2. `develop`: 
We consider `origin/develop` to be the main branch where the source code of `HEAD` always reflects a state with the latest delivered development changes for the next release. Some would call this the “integration branch”. When the source code in the `develop` branch reaches a stable point and is ready to be released, all of the changes should be merged back into `master` somehow and then tagged with a release number.

#### Supporting branches
Unlike the main branches, supporting branches always have a limited life time, since they will be removed eventually. 

1. Feature branches 
May branch off from develop. Must merge back into develop. In our model we use `--no-ff` flag, when we merge back into develop branch.

2. Release branches
May branch off from `develop`. Must merge back into `develop` and `master`. Release branches support preparation of a new production release. The key moment to branch off a new release branch `from develop` is when develop (almost) reflects the desired state of the new release. They allow for minor bug fixes and preparing meta-data for a release (version number, build dates, etc.), we can not add new features into release branch.

3. Hotfix branches
May branch off from `master`. Must merge back into `develop` and `master`. They arise from the necessity to act immediately upon an undesired state of a live production version.

### Branches naming
The main branches:
- `master`
- `develop`
Supporting branches:
- `release-[issue number]`
- `hotfix-issue number]`
- `feature-issue number]`


## <a name="Commits">Commit</a>

### Commit Message

1. Do not use past tense.
2. Message starts with a uppercase letter.
3. Write in English.
4. The first line(title) should always be 50 characters or less and that it should be followed by a blank line and then a more detailed description.
5. Use the imperative in the title. For example, you can start title with this words: Refactor, Update, Remove, Release, Fix, Merge, Rename and etc.

### Operations that are allowed over history

1. Try to avoid using `git commit .`. Instead, try to get into the habit of checking which files are actually changed (with git status), and then adding files to your commits explicitly: `git add {file1} {file2}`.
2. For local work!! If you’ve created a commit already, but then you do more work that should logically be included in that same commit, you can simply add new work to the previous commit with `git commit --amend`.

## <a name="Version"></a>
Version template X.Y.Z where:
1. X, Y, Z - are non-negative integers, and MUST NOT contain leading zeroes.
2. X is the major version, Y is the minor version, and Z is the patch version.
`1.9.0 -> 1.10.0 -> 1.11.0.`
3. Once a versioned package has been released, the contents of that version MUST NOT be modified. Any modifications MUST be released as a new version.
4. Major version zero (0.y.z) is for initial development. 
5. Version 1.0.0 defines the public API.
6. Patch version Z MUST be incremented if only backwards compatible bug fixes are introduced.
7. Minor version Y MUST be incremented if new, backwards compatible functionality is introduced to the public API.
8. Major version X MUST be incremented if any backwards incompatible changes are introduced to the public API. 

## <a name="Testing"> Testing</a>
### In our project we use:
1. iOS UI Testing
2. Automated Testing using CI/CD.

### Process
1. Make sure everything is stable in your branch befome merge:
- Do manual testing.
- Create your own Unit test for testing your feature and test your feature, if it needed.
3. Merge.
4. If an bag is found, a new issue is created.


## Issues and Pull Requests

### Issues 
1. [How create an issue](https://help.github.com/en/github/managing-your-work-on-github/creating-an-issue)
2. Title:
- Keep your titles short and descriptive.
- Title should always be 50 characters or less.
3. Description:
- Include links to the specific application views you’re describing.
- Context: explain the conditions which led you to write this issue. For example: “Since we’ve moved to the latest version of smth, we’ve experienced a few performance issues (#14 and #15) on production.”
- Use @mentions and references inside of Issues, for notify other GitHub users and teams, and cross-connect issues to each other. Often times issues are dependent on other issues, or at least relate to them and you’d like to connect the two, example:
>This is subtask for #2
4. Use color-coded labels, they helps us categorize and filter our issues .
5. Add Project in Project section, and issue will be displayed on board.
6. Avoid duplication in issues.
7. When you choose an issue, you should add yourself (someone from your team) in the assignees' section.

### Pull Request
1. [How create an pull request](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request)
2. [List of reviewers changes every sprint](https://docs.google.com/spreadsheets/d/1qT-_LOewagvy2EIWhjzVdvrnLMwuYYRqaSpaFY1JTdk/edit?usp=sharing)
3. Pull request name: 
The pull request’s name should tell the changes itself generally, to give an overview idea of what the pull request is about.
4. Pull request’s descriptions:
Should answer the following questions:
WHY — Which tickets/issues/proposals you are working on? 
WHAT — What have you done?
HOW — What the reviewers should know?
5. Use Tags, Labels if necessary.



