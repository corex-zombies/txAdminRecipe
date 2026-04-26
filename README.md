# COREX Framework — txAdmin Recipe

> One-click installer for the [COREX Framework](https://github.com/ABUGIZA/COREX-Framework). Paste the URL below into txAdmin to deploy a complete server in minutes.

## 🚀 Install

In **txAdmin** setup wizard:

1. **Deployment Type** → `Remote URL Template`
2. Paste this URL:
   ```
   https://raw.githubusercontent.com/corex-zombies/txAdminRecipe/main/corex.yaml
   ```
3. Click **Next** and let txAdmin do the rest.

## 📦 What it installs

- All [`cfx-default`](https://github.com/citizenfx/cfx-server-data) resources
- [`oxmysql`](https://github.com/overextended/oxmysql) (latest release)
- All 14 COREX scripts:
  - `corex-core`, `corex-spawn`, `corex-death`, `corex-hud`, `corex-survival`
  - `corex-inventory`, `corex-crafting`, `corex-notify`, `corex-events`
  - `corex-weather`, `corex-zombies`, `corex-zones`, `corex-redzones`, `corex-loot`
- A pre-configured `server.cfg`
- The COREX database schema (auto-imported)

## ⚙️ After install

Open `server.cfg` and set:
- `sv_licenseKey` → generate at <https://keymaster.fivem.net/>
- `mysql_connection_string` → adjust for your MySQL credentials

## 📖 Docs
<https://corex-zombies.gitbook.io/corex-docs>

## 💬 Community
<https://discord.gg/G95rtnb9sg>

## License
[MIT](LICENSE)
