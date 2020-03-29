# Kull Convention

Some clarifications of terms are [here](terms.md). If you want to adopt Kull in your project, follow the [setup guide](setup.md).

## Summary

Kull is a collaboration convention aimed at Git on GitHub that preserves order through clear rules and processes. These are the main points:

- **commit message format**: `type(scope): summary` as described in [Karma Runner](http://karma-runner.github.io/latest/dev/git-commit-msg.html) with predefined scopes, enforced using a Git commit-msg hook
- **branching**: master and feature branches with descriptive names; draft pull requests for documentation
- **reviewing**: the contributor is responsible for opening and merging his pull requests; review comments are only resolved by the reviewer
- **merging**: after approval, merge a branch via squash or rebase and then delete it

## 1. Committing

To ease grasping the history, back-tracing of regressions and automated processing, Kull follows the [Karma Runner commit message convention](http://karma-runner.github.io/latest/dev/git-commit-msg.html). The first line is in `type(scope): summary` format with the summary in [imperative mood](https://chris.beams.io/posts/git-commit/#imperative). List closed issues with the "Closes" keyword on a separate line in the footer, e.g. "Closes #1, #23, #34".

### The hook

The convention is managed and enforced by a `.dev` folder in the root of the repository. It holds shared git hooks in a folder called `githooks`, enabled by running `git config core.hooksPath .dev/githooks`. The [commit-msg hook](https://raw.githubusercontent.com/Xerus2000/kull/master/.dev/githooks/commit-msg) will then automatically refuse commits which do not adhere to the format.

Since there is no single definition of what constitutes a "scope", the script requires a file `.dev/scopes.txt` in the repository. It should contain a newline-separated list of scopes that are allowed in the project.

The script allows an additional commit type called *rework* for migration from a less strict convention or for beta stages where commits often end up too broad to fit into a single type. However, it should not be used in production code, so for a mature project it might be removed from the hook. A *release* type is also included in case the project wants to specially highlight release commits.

## 2. Branching

A repository will usually consist of a master branch and feature branches as described in [GitHub Flow](https://githubflow.github.io/). Feature branch names should be descriptive and follow a similar style as the commits, i.e. `type/scope/summary`, though either scope or type are often omitted. Direct pushes to master should be avoided to prevent failing builds and hasty fixes.

Sometimes there is an additional development branch, but it is often superfluous. Releases are generally better handled with tags instead of separate branches. Whether it is master or development, the default branch should always build, so there is rarely a clear distinction.

## 3. Reviewing

Upon pushing a new feature branch, create a corresponding draft pull request with a title that summarizes the changes and conforms to the commit message convention. An open pull request is above all documentation and should be ignored until its creator explicitly requests reviews. If a branch has no associated PR and no recent activity, it is subject to deletion.

Review thoroughly to ensure long term alignment. To prevent misunderstandings, the PR owner should comment on a review comment with a reference to the fix once he considers it fixed and only the reviewer who created that comment may then resolve it.

To build on top of unmerged changes, branch off rather than adding features to a branch in review. Only request review for that new branch once the base branch is merged.

## 4. Merging

A pull request should be approved by at least one other person and pass all tests before being merged. The owner of the PR should merge it as he knows the state and content best.

Merge using either squash or rebase to keep noise such as experimental and merge commits out of the main history. The default is squash merging, with the title of the PR as the title of the commit and a description summarising the changes and fixes. Due to this it is not as important to keep feature branch history clean - experimental and even merge commits are acceptable within a branch if it is certain to be squashed. 
A rebase may be appropriate if each commit in the PR has meaning on its own. On the other hand, if the changes are too big for a squash to seem appropriate, they should be split up - rebase merging will likely put many redundant or meaningless commits into master.
