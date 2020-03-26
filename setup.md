# Adopting Kull in you project

- Create a `.dev/githooks` folder and add the [commit-msg hook](https://raw.githubusercontent.com/Xerus2000/kull/master/.dev/githooks/commit-msg) into it, ensuring it is executable
- Define meaningful scopes in `.dev/scopes.txt`
- Include a short summary and a link to the full convention in the Readme
- When using GitHub: In the repository merge settings disable "Allow merge commits" and enable "Automatically delete head branches"

## Sample text for the Readme

This project uses the [Kull Convention](https://xerus2000.github.io/kull) to ensure consistent collaboration. Please read through it and run the following command after cloning to enable the git hook:

    git config core.hooksPath .dev/githooks
