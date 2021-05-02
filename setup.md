# Adopting Kull in you project

- Create a `.dev/githooks` folder and add the [commit-msg hook](https://raw.githubusercontent.com/xeruf/kull/master/.dev/githooks/commit-msg) into it, ensuring it is marked executable
- Define meaningful scopes in `.dev/scopes.txt` - one scope per line, empty lines and comments starting with # are allowed
- Include a short summary with instructions on how to use the hook in the Readme, as well as a link to this convention
- When using GitHub: In the repository merge settings disable "Allow merge commits" and enable "Automatically delete head branches"

## Example text for use in a Readme
```
This project follows the [Kull Convention](https://kull.jfischer.org) to ensure consistent collaboration. Please read through it and run the following command after cloning to enable the git hook:

    git config core.hooksPath .dev/githooks

In short:
- Write commit messages in `type(scope): summary` format according to the [Karma Runner convention](http://karma-runner.github.io/latest/dev/git-commit-msg.html), using the [imperative mood](https://chris.beams.io/posts/git-commit/#imperative) for the summary and the "Closes" keyword in the footer for closed issues
- Create feature branches with descriptive names and utilize draft pull requests as documentation
- Only the reviewer resolves review comments to avoid confusion; do not add features to branches in review
- Pull requests should be merged by their creator after approval using squash or rebase, keeping a clean history
```
