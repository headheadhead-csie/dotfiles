# My dot files
## Reminder for Deploying
- Run `chezmoi init headheadhead-csie` to initialize `chezmoi`.
- Run `chezmoi apply` to update all targets only when you have super user rights.
    - Otherwise, you may see some errors regarding the `sudo` commands.
    - Run `chezmoi apply ~/$FILE` to manually deploy the dot files you need.
- Scripts under `scripts/` should be run manually.
    - These are advanced settings.
