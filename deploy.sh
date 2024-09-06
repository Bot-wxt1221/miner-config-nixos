git add .
git commit -m "Upd"
git push origin master
nixos-rebuild switch --flake .#nixos-1 --target-host root@192.168.42.225 --build-host root@192.168.42.225  --log-format internal-json -v |& nom --json
