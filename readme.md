# Kull Convention

Some clarifications of terms are [here](terms.md). If you want to adopt Kull in your project, follow the [setup guide](setup.md).

## Summary

Kull is a collaboration convention aimed at git on GitHub, focused on maintaining a clean history by alignment through clear boundaries and structures. It addresses these main points:

- **commit message style**: `type(scope): summary` as seen in [Karma Runner](http://karma-runner.github.io/latest/dev/git-commit-msg.html) with predefined scopes, enforced using a commit-msg git hook
- **branching**: master and feature branches with descriptive names; branches are always merged via squash or rebase; a branch should be deleted once it has been merged into master
- **reviewing**: the contributor is responsible for opening and merging his Pull Requests, review comments are only resolved by the reviewer

## 1. Committing

To ease grasping the history, back-tracing of regressions and automated processing, Kull follows the [Karma Runner](http://karma-runner.github.io/latest/dev/git-commit-msg.html) commit message convention.

### The hook

The convention is managed and enforced by a `.dev` folder in the root of the repository. It contains shared git hooks in a folder called `githooks`, which has to be enabed by running `git config core.hooksPath .dev/githooks`. It should contain at least the [commit-msg hook](https://raw.githubusercontent.com/Xerus2000/kull/master/.dev/githooks/commit-msg) which will automatically refuse commits which do not adhere to the style.

Since there is no single definition of what constitutes a "scope", the script requires a file `.dev/scopes.txt` in the repository. It should contain a newline-separated list of scopes that are allowed in the project.

The script includes an additional commit type called *rework* for migration from a less strict convention or for beta stages where commits often end up too broad to fit into a single type. However, it should  not be used in production code, so for a mature project that type might be removed from the hook. A *release* type is also included in case the project wants to specially highlight release commits.

## 2. Branching

A repository will usually consist of a master branch and feature branches as described in [GitHub Flow](https://githubflow.github.io/). Pushing to master is not forbidden, but strongly discouraged to preserve integrity. Feature branch names should be descriptive and follow a similar style as the commits, i.e. `type/scope/summary`, though either scope or type are often omitted.

The usage of a development branch is a common practice, but often superfluous. Releases are generally better handled with tags instead of separate branches. Whether it is master or development, the default branch should always build, so there is rarely a clear distinction.

## 3. Reviewing

Upon pushing a new feature branch, create a corresponding Draft Pull Request with a title that summarizes the changes and conforms to the commit message convention. An open Pull Request is above all documentation and should be ignored until its creator explicitly requests reviews. If a branch has no associated PR and no recent activity, it is subject to deletion.

Review thoroughly to ensure long term alignment. To prevent misunderstandings, the PR owner should comment on a review comment with a reference to the fix once he considers it fixed and only the reviewer who created that comment may then resolve it.

To build on top of unmerged changes, branch off rather than adding features to a branch in review. Only request review for that new branch once the base branch is merged. This alleviates the work of reviewers.

## 4. Merging

A PR should be approved by at least one other person and pass all tests before being merged. The owner of the Pull Request should merge it as he knows the state and content best.

Pull Requests are always merged using either squash or rebase to prevent noise from merge commits and superfluous small commits. The default is squash merging, with the title of the PR as the title of the commit and a description summarising the changes and fixes. Due to this it is not important to keep the branch history clean - experimental and even merge commits are acceptable within a branch if it is certain to be squashed.  
A rebase may be appropriate if each commit in the PR has meaning on its own. On the other hand, if a PR is too big for a squash to seem appropriate, it should be split up because rebase merging will likely put many redundant or meaningless commits into master.
