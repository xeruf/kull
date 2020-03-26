# Kull Convention

[Kull Convention one-pager](https://www.notion.so/Kull-Convention-one-pager-ebefa0e3957e492b8643440438fd293f)

[Terms](https://www.notion.so/Terms-00afc51c02154d2f9e921e7a10878d42)

## Summary

Kull is a Collaboration convention focused on, but not solely applicable to, git and GitHub. It addresses the following points:

- **commit message style**: `type(scope): summary` as seen in [Karma Runner](http://karma-runner.github.io/4.0/dev/git-commit-msg.html) with predefined scopes, should be enforced using a commit-msg git hook
- **branching**: master and feature branches with descriptive names; branches are always merged via squash or rebase; a branch should be deleted once it has been merged into master
- **reviewing**: the contributor is responsible for opening and merging his Pull Requests, review comments are only resolved by the reviewer

## 1. Committing

To ease grasping the history, back-tracing of error sources and automated processing, Kull follows the [Karma Runner](http://karma-runner.github.io/4.0/dev/git-commit-msg.html) commit message convention.

### The hook

The convention is managed and enforced by a `.dev` folder in the root of the repository. It contains shared git hooks in a folder called `githooks`, which includes at least the commit-msg hook:

[commit-msg](Kull%20Convention/commit-msg.txt)

The script additionally requires a file `.dev/scopes.txt` in the repository which contains a newline-separated list of scopes used in the project - the script will then allow only these through. This is to avoid confusion and inconsistencies among using scopes, because there is no single definition what should be considered a scope.

Once set up, the hook has to be enabled in the local repository by running `git config core.hooksPath .dev/githooks`. It is recommended to include this into the Collaboration instructions to remind everyone to follow the convention, ensuring a consistent history.

The script also includes an additional commit type called *rework* for cases where you are migrating from a less strict convention or are in beta stages and create commits too broad to fit to a single type - this should *never be used in production code*. It might make sense to remove that type from the hook if you'd rather not have that wildcard option.

## 2. Branching

A repository will usually consist of a master branch and feature branches as described in [GitHub Flow](https://githubflow.github.io/). Pushing to master is not forbidden, but strongly discouraged to preserve integrity. Feature branch names should be descriptive, and it is often sensible to follow a similar style as the commits, i.e. `type/scope/summary`, though either scope or type often omitted.

The usage of a development branch is a common practice, but often superfluous. Releases are generally better handled with tags instead of keeping them on branches. Whether it is master or development, the default branch should always build, so often there is no hard differentiation between these two. 

## 3. Reviewing

Upon pushing a new feature branch, an associated Draft Pull Request should be created as documentation. If a branch has no associated PR and no recent activity, it is subject to deletion.

An open Pull Request is above all documentation and should not be looked after by anyone else than its creator until he explicitly requests Reviews. A PR needs to be approved by at least one person and pass the Unit tests before it can be merged.

When reviewing a Pull Request, comment even on small things. This might be annoying at first, but will lead to better alignment in the long term. The PR owner should comment on a review comment with a reference to the fix once he considers it fixed and only the reviewer who created that comment may then resolve it to avoid confusion and misunderstandings.

If a Review is taking a long time and you need to base your work on that branch, create a new branch off of it and implement it there. *Do not* request review for this new branch until its base work is merged and don't add features to branches that are in Review to avoid duplicate work for reviewers.

## 4. Merging

Before merging a PR, its title should be adjusted to reflect the changes according to the commit message convention. The owner of the Pull Request should merge it as he knows the state and content best.

Pull Requests are always merged using either squash or rebase to prevent noise from merge commits and superfluous small commits. The default is squash merging, with the title of the PR as the title of the commit and a description summarising the changes and fixes. Due to this it is not as important to keep the branch history clean and tidy - experimental and even merge commits are acceptable if a squash is certain.

A rebase may be appropriate if each commit in the PR makes sense standing on its own. On the other hand, if a PR is too big for a squash to seem appropriate, it should be split up because rebase merging will likely put many redundant or meaningless commits into master.

[Scrapped/Notes](https://www.notion.so/Scrapped-Notes-5957d1a293d54d1a89a14554414e2a79)