# Contributing

This Contribution guide describes:

- [Work with branches](#branches-model-and-naming).
- [Work with commits](#work-with-commits).
- [Work with versions](#work-with-versions).
- [Work with testing](#work-with-testing).
- [Work with issues/PRs](#work-with-issues-and-pull-requests).


## Work with branches

We use [git-flow model](https://nvie.com/posts/a-successful-git-branching-model/).

### Branches model 

#### The main branches

The central repo holds [two main branches](https://nvie.com/posts/a-successful-git-branching-model/#the-main-branches) with an infinite lifetime:

`master` and `develop`.

#### Supporting branches

As supporting branches we will use branches with limited lifetime: 
- [Feature branches](https://nvie.com/posts/a-successful-git-branching-model/#feature-branches)
- [Release branches](https://nvie.com/posts/a-successful-git-branching-model/#release-branches)
- [Hotfix branches](https://nvie.com/posts/a-successful-git-branching-model/#hotfix-branches)

### Branches naming

The main branches:
- `master`
- `develop`

Supporting branches:
- `release-[version number in format X.Y+1]` (`release-1.2`)
- `hotfix-[version number in format X.Y.(Z+1)]` (`hotfix-1.0.2`)
- `feature-[issue number]` (`feature-59`)


## Work with commits

### Commit Message

1. Use the present tense.
2. Start your message with an uppercase letter.
3. Write in English.
4. The first line of your commit message must be maximum 50 characters long. If you need more verbose description, write the first line as a summary, leave a blank line and then start writing the description. Each line in the description should though wrap at the 72nd mark.
5. Use the imperative in the title. For example, you can start the title with these words: Refactor, Update, Remove, Release, Fix, Merge, Rename, etc.

### Operations that are allowed on the commit history

1. Try to avoid using `git commit .`. Instead, try to get into the habit of checking which files are actually changed (with git status), and then add files to your commits explicitly: `git add {file1} {file2}`.
2. For local repository!! If you’ve created a commit already, but then you do more work that should logically be included in that same commit, you can simply add new work to the previous commit with `git commit --amend`.

## Work with versions

We use [SemVer](https://semver.org/) for versioning.

## Work with testing

### In our project we use:

Manual and unit tests.

### Process

1. Make sure everything is stable in your branch before the merge:
- Do manual testing.
- Create your own unit test to test your feature, if it is needed.
2. Merge.
3. If you found a bug, file a new issue.


## Work with issues and pull requests

### Issues 

#### Create a new issue

1. [How create an issue](https://help.github.com/en/github/managing-your-work-on-github/creating-an-issue)

1.1 Title:

- Keep your titles short and descriptive.
- The title should always be 50 characters or less.

1.2 Description:

- Include links to the specific application views you’re describing.
- Context: explain the conditions which led you to write this issue. For example: “Since we’ve moved to the latest version of smth, we’ve experienced a few performance issues (#14 and #15) on production.”
- Use @mentions and references inside of Issues, for notifying other GitHub users and teams, and cross-connect issues to each other. Often times issues are dependent on other issues, or at least relate to them and you’d like to connect the two, example:

>This is subtask for #2

1.3 Use color-coded labels, they help us categorize and filter our issues.

1.4 When you choose an issue, you should add yourself (someone from your team) in the assignees' section.

2. Avoid duplication in issues.

#### Issue estimation

Matching Scrum Methodology.
1. The Development Team is responsible for all estimates.
2. Issues are estimated before the sprint on Sprint Planning.
3. Update the estimate of the remaining work when part of the work is completed.

### Pull Request

#### Create Pull Request

1. [How to create a pull request](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request).

1.2 Pull request title: 

The pull request’s name should tell the changes itself generally, to give an overview idea of what the pull request is about.

1.3 Pull request’s description: 

Should answer the following questions:

WHY — Which tickets/issues/proposals you are working on?

WHAT — What have you done?

HOW — What the reviewers should know?

1.4 Add Linked issue.

1.5 Add Project in the Project section.

2. A list of reviewers does not change for every sprint.
3. Use Labels if necessary.
4. Don't set a Milestone.

#### Reviewing process

1. If you do not like the existing implementation - suggest your implementation and justify why it is better.
2. Resolve conversation can only a person, who opened it.
3. Merge pull request can only a person, who created a pull request.

### Agile board movement

1. Backlog - ordered list of known product requirements.
2. Sprint Backlog - set of Backlog issues that are taken in Sprint.
3. In Progress - set of Sprint Backlog issues that are assigned to the developer.
4. PR - set of In Progress issues that are having a Pull Request.
5. Done - set of completed tasks.
