# PLUGINS CACHING
## For Ubuntu
```
mkdir -p /tmp/.terraform.d/plugin-cache
touch ~/.terraformrc
cat ~/.terraformrc
echo 'plugin_cache_dir   = "/tmp/.terraform.d/plugin-cache"' > ~/.terraformrc
cat ~/.terraformrc
```

## Windows
- Open cmd
```
cmd
```

- Run below commands on cmd
```
md C:\\Temp
notepad %APPDATA%/terraform.rc
```

- Put below contents in notepad opened
```
plugin_cache_dir = "C:\\Temp\\.terraform.d\\plugin-cache"
```

- Close cmd
```
exit
```
