# Kull Convention one-pager

Kull is a Collaboration convention to maintain a clean history and preserve order through clear rules and processes.

### 1. Committing

*`type(scope): summary`*

For a consistent and readable history, Kull follows the [Karma Runner](http://karma-runner.github.io/6.2/dev/git-commit-msg.html) commit message convention. Type and scope are checked against the allowed values by a git hook that has to be enabled with the following command:

    git config core.hooksPath .dev/githooks

### 2. Branching

*Protect master and create feature branches with descriptive names*

The repository consists of a master branch and feature branches as described in [GitHub Flow](https://githubflow.github.io/). Branch names should be descriptive and follow a similar style as the commits, i.e. `type/scope/summary`, though either scope or type often omitted.

### 3. Reviewing

*Pull Request are managed by their contributor; review comments are only resolved by the reviewer*

Upon pushing a new feature branch, create an associated Draft Pull Request as documentation. A PR needs to be approved by at least one person and pass all automated checks before merging. 

The contributor should respond to review comments with reference to the fix, and only the reviewer may resolve the conversation. Don't add features to branches that are in Review.

### 4. Merging

*Merge via squash or rebase and delete the branch afterwards*

A PR title should follow the commit message convention. The owner of the Pull Request should merge it, using either squash or rebase.

Use squash merging by default, summarising the changes and fixes in the description of the squash commit. A rebase may be appropriate if each commit in the PR makes sense standing on its own. If a PR is too big for either to seem appropriate, it should be split up instead.
