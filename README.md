# COREX Framework — txAdmin Recipe

> One-click installer for the [COREX Framework](https://github.com/ABUGIZA/COREX-Framework). Follow the steps below in order — by the end you'll have a fully working server.

---

## 📋 Prerequisites

### 1️⃣ FXServer (the FiveM server binary)

This is the program that runs your FiveM server. txAdmin is bundled inside it.

1. Download the latest **recommended Windows build** from:
   <https://runtime.fivem.net/artifacts/fivem/build_server_windows/master/>
2. Extract the ZIP into a folder of your choice — for example `C:\COREX_Server\`.
   Inside you should see:
   ```
   C:\COREX_Server\
   ├── FXServer.exe
   ├── run.cmd
   └── ... (other files)
   ```

### 2️⃣ Cfx.re License Key

Free key required to run any FiveM server.

1. Go to <https://keymaster.fivem.net/>
2. Sign in → **+ New Server Key**
3. Copy the key — you'll paste it into `server.cfg` later.

---

## 🚀 Run FXServer & Open txAdmin

1. Double-click `FXServer.exe` inside the folder you just extracted.
2. A black console window opens. Wait until you see:
   ```
   All ready! Please access:
     http://localhost:40120/
   ```
3. Open your browser (Chrome / Firefox / Edge).
4. Go to: **<http://localhost:40120/>**

> txAdmin runs **only on your own PC** while FXServer is running — there is no public website. Bookmark `http://localhost:40120/` for one-click access.

Official txAdmin: <https://github.com/citizenfx/txAdmin>

---

## 🪄 First-Time txAdmin Setup

txAdmin opens a setup wizard the first time:

1. **Set a PIN** (4 digits — write it down).
2. **Link Cfx.re account** (recommended) or create a local admin user.
3. Continue to the deployment screen.

---

## ⚡ Install COREX (One-Click)

In the **Deployment Type** screen:

1. Choose: **`Remote URL Template`**
2. Paste this URL exactly:
   ```
   https://raw.githubusercontent.com/corex-zombies/txAdminRecipe/main/corex.yaml
   ```
3. Click **Next** — txAdmin downloads everything automatically.

---

## 📦 What the recipe installs

- All [`cfx-default`](https://github.com/citizenfx/cfx-server-data) resources
- [`oxmysql`](https://github.com/overextended/oxmysql) (latest release)
- All 14 COREX scripts:
  - `corex-core`, `corex-spawn`, `corex-death`, `corex-hud`, `corex-survival`
  - `corex-inventory`, `corex-crafting`, `corex-notify`, `corex-events`
  - `corex-weather`, `corex-zombies`, `corex-zones`, `corex-redzones`, `corex-loot`
- A pre-configured `server.cfg`
- The COREX database schema (auto-imported)

---

## ⚙️ Final Configuration (Required)

When the wizard finishes, open `server.cfg` (txAdmin shows you where it is) and edit:

```cfg
# Your Cfx.re license key from https://keymaster.fivem.net/
sv_licenseKey "PASTE_YOUR_KEY_HERE"

# MySQL connection — pick the format that matches your setup:

# A) MySQL WITH a password (Workbench, production)
set mysql_connection_string "mysql://root:YOUR_PASSWORD@localhost/corex?charset=utf8mb4"

# B) MySQL WITHOUT a password (XAMPP / Laragon default)
set mysql_connection_string "mysql://root@localhost/corex?charset=utf8mb4"
```

Save the file, then click **Start Server** in txAdmin. ✅

---

## 🩹 Troubleshooting

| Problem | Fix |
|---|---|
| txAdmin asks for a new deployment | You picked the wrong option earlier. Pick **Remote URL Template** and paste the recipe URL. |
| `oxmysql` connection fails | Make sure MySQL is running. Check `mysql_connection_string` matches your DB. |
| Port `30120` already in use | Another FiveM server is running. Close it or change the port in `server.cfg`. |
| `localhost:40120` won't open | FXServer is not running. Double-click `FXServer.exe` first. |

---

## 📖 Docs
<https://corex-zombies.gitbook.io/corex-docs>

## 💬 Community
<https://discord.gg/G95rtnb9sg>

## License
[MIT](LICENSE)
