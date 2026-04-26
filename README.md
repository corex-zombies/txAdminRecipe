# COREX Framework — txAdmin Recipe

> One-click installer for the [COREX Framework](https://github.com/ABUGIZA/COREX-Framework). Paste the URL below into txAdmin to deploy a complete server in minutes.

---

## 🖥️ How to Open txAdmin

txAdmin runs **locally on your own PC** — there is no public website. Open it at:

### 👉 http://localhost:40120

**Steps:**
1. Run `FXServer.exe` (a console window opens — keep it running).
2. The console prints:
   ```
   All ready! Please access:
     http://localhost:40120/
   ```
3. Open that URL in any browser (Chrome / Firefox / Edge).
4. First time only — set a PIN, link Cfx.re, then continue with the install below.

> Bookmark <http://localhost:40120/> for one-click access.

Official txAdmin: <https://github.com/citizenfx/txAdmin>

---

## 🚀 Install COREX

In the **txAdmin setup wizard**:

1. **Deployment Type** → `Remote URL Template`
2. Paste this URL:
   ```
   https://raw.githubusercontent.com/corex-zombies/txAdminRecipe/main/corex.yaml
   ```
3. Click **Next** and let txAdmin do the rest.

---

## 📦 What it installs

- All [`cfx-default`](https://github.com/citizenfx/cfx-server-data) resources
- [`oxmysql`](https://github.com/overextended/oxmysql) (latest release)
- All 14 COREX scripts:
  - `corex-core`, `corex-spawn`, `corex-death`, `corex-hud`, `corex-survival`
  - `corex-inventory`, `corex-crafting`, `corex-notify`, `corex-events`
  - `corex-weather`, `corex-zombies`, `corex-zones`, `corex-redzones`, `corex-loot`
- A pre-configured `server.cfg`
- The COREX database schema (auto-imported)

---

## ⚙️ After install

Open `server.cfg` and set:
- `sv_licenseKey` → generate at <https://keymaster.fivem.net/>
- `mysql_connection_string` → adjust for your MySQL credentials

---

## 📖 Docs
<https://corex-zombies.gitbook.io/corex-docs>

## 💬 Community
<https://discord.gg/G95rtnb9sg>

## License
[MIT](LICENSE)
