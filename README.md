# COREX Framework — txAdmin Recipe

> Deployment recipe for [CoreX](https://corex-zombies.gitbook.io/corex-docs/). Install into a fresh server-data directory, verify the downloaded resources and database, then test with a connected player before opening the server.

COREX is a FiveM zombie-survival framework: character creation, inventory, crafting, survival, zombies, loot and world events. You do not need to write code to install it. Its QB/Qbox/ESX compatibility resources translate supported APIs; they do not install every dependency required by third-party scripts.

## September 2026 compatibility update

The compatibility resources are published in the corex-zombies organization. The installer pins the reviewed COREX resource revisions and template to immutable commits so a deployment does not mix moving branches. Do not deploy this repository over an existing player's database as an upgrade procedure.

The old `ABUGIZA/COREX-Framework` repository is not the framework installation package. Use the recipe and verify its contents against **Get started → Installation** in the [CoreX documentation](https://corex-zombies.gitbook.io/corex-docs/).

---

## 🎬 Video Tutorial

Video overview (older screens may differ; use the written steps below as the current installation instructions):

[![Watch the install video](https://img.youtube.com/vi/Y7mIvYN7gVo/maxresdefault.jpg)](https://youtu.be/Y7mIvYN7gVo)

▶ <https://youtu.be/Y7mIvYN7gVo>

---

## 📋 Prerequisites

### 1️⃣ FXServer (the FiveM server binary)

This is the program that runs your FiveM server. txAdmin is bundled inside it.

1. Download the latest **recommended Windows build**, at least artifact `12913`, from:
   <https://runtime.fivem.net/artifacts/fivem/build_server_windows/master/>
2. Extract the downloaded server archive (usually `server.7z`) into a folder of your choice — for example `C:\COREX_Server\`. Use an archive tool that supports `.7z`.
   Inside you should see:
   ```
   C:\COREX_Server\
   ├── FXServer.exe
   └── ... (other files)
   ```

### 2️⃣ Cfx.re License Key

Free key required to run any FiveM server.

1. Open the [Cfx.re Portal](https://portal.cfx.re/) and sign in.
2. Register your server and obtain its server registration key.
3. Keep the key private. Enter it in txAdmin's recipe parameters when requested; linking your account is not a substitute for supplying this key.

### 3️⃣ Database and game client

Have MariaDB/MySQL installed and running before deploying. Keep its host, port, username and password available locally. Use a dedicated empty database for COREX, never another server's player database. The database account needs permission to create the required tables and run the framework's schema migrations.

txAdmin's own player database does not replace COREX's SQL database. A hosted server may provide database details in its control panel; the recipe does not install a database server for you.

To join and test, you also need a working FiveM client and its supported GTA V installation. This recipe's game configuration targets the established GTA V build `3258`; do not assume it is an Enhanced-specific configuration.

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

> `localhost` refers to the machine running your browser. For a remote server, use its configured management address securely; do not expose the management port publicly just to make this link work.

Official txAdmin: <https://github.com/citizenfx/txAdmin>

---

## 🪄 First-Time txAdmin Setup

txAdmin opens a setup wizard the first time:

1. Use the PIN supplied by the running FXServer console/browser setup page; you do not invent that initial PIN.
2. Link your Cfx.re account and complete the administrator password/setup prompts yourself.
3. Give the server a name and continue to the deployment screen.

The [official txAdmin setup guide](https://docs.fivem.net/docs/server-manual/setting-up-a-server-txadmin/) shows the account/setup screens. For COREX, use the remote recipe option below instead of the guide's vanilla template.

---

## ⚡ Install COREX (One-Click)

In the **Deployment Type** screen:

1. Choose: **`Remote URL Template`**
2. Paste this URL exactly:
   ```
   https://raw.githubusercontent.com/corex-zombies/txAdminRecipe/main/corex.yaml
   ```
3. Select a **fresh server-data folder**. This is where `server.cfg` and `resources/` will live, separate from your FXServer binaries.
4. Review the recipe, then provide your server registration key and SQL connection details in the input parameters. Use the actual database port supplied by your database installation or host.
5. Click **Run Recipe** and wait for every task to finish. Do not start the server after a failed download or failed SQL task.
6. Review the generated `server.cfg`, save it, and use txAdmin's **Start Server** control. Keep txAdmin/FXServer running while you play.

---

## 📦 What the recipe installs

- CFX `mapmanager`, `spawnmanager` and `baseevents` from a pinned [cfx-server-data revision](https://github.com/citizenfx/cfx-server-data/tree/32d98e7524b952faf8b220d719615b0346b0a6cc); `chat` is supplied by the supported FXServer artifact. CFX example/test resources and RedM maps are not installed.
- Built [`oxmysql 2.14.1`](https://github.com/overextended/oxmysql/releases/tag/v2.14.1) and [`ox_lib 3.39.0`](https://github.com/overextended/ox_lib/releases/tag/v3.39.0), pinned for repeatable dependency downloads
- Native COREX resources declared by this recipe:
  - `corex-core`, `corex-spawn`, `corex-death`, `corex-hud`, `corex-survival`
  - `corex-inventory`, `corex-crafting`, `corex-notify`, `corex-events`
  - `corex-weather`, `corex-zombies`, `corex-zones`, `corex-redzones`, `corex-loot`, `corex-skills`, `corex-admin`
- Compatibility foundation: `corex-capabilities`, `corex-ui-compat`, `corex-adapters`, CoreX's `qb-core`, `qbx_core`, `es_extended`, `corex-content`, and `corex-lab`
- UI proxies: `progressbar`, `qb-input`, `qb-menu`, `esx_context`, `esx_notify`, `esx_progressbar`, and `esx_textui`
- Map assets (`patoche_halloween_house`)
- A pre-configured `server.cfg` (license key + MySQL string filled in by txAdmin)
- The COREX database schema (auto-imported)

---

## ✅ After Install

Verify the generated `sv_licenseKey` and `mysql_connection_string` point to the intended server and database before starting. Never publish either value. Check the server log for missing resources, SQL failures and script errors.

If `sv_licenseKey` still contains a placeholder, enter your key locally through txAdmin's configuration editor before starting. Account linking alone does not prove the generated configuration has a valid key.

On the same computer, open FiveM, press **F8**, and enter `connect 127.0.0.1:30120` (substitute your configured game port). For a hosted server use its game-server address, not its txAdmin web-management address. Complete character creation, then check spawn, HUD, inventory, item use and reconnect persistence before inviting other players.

When you return later, launch the same FXServer/txAdmin profile and use **Start Server**. Do not redeploy the recipe merely to start the server again. Back up the database and resource configuration before upgrades.

Run `qbcore_compat_status`, `qbx_compat_status`, `esx_compat_status`, `corex_inventory_adapters`, and `corex_content_status` in the server console. These diagnostics do not certify gameplay. Join with a test client and verify item use, inventory UI and save/reconnect behavior.

The final `start [corex]` starts remaining gameplay without restarting the already initialized foundation. Do not replace it with `ensure [corex]` when those resources are running. Run only groups containing resources you intend to enable; a third-party script's private SQL or companion requirements are not removed by installing a framework facade.

For upgrades, prefer a planned full server restart with players disconnected. Restarting a dependency can stop its dependent resources: for example, restarting `corex-loot` stops `corex-events` and `corex-redzones`. After the dependency is ready, `start` those dependents (or your reviewed `start [corex]` group). `restart` does not start an already-stopped resource. Verify statuses and saved data before reopening the server.

## Customize your server

Start with [Add items](https://corex-zombies.gitbook.io/corex-docs/start-here/add-items), [Add a resource](https://corex-zombies.gitbook.io/corex-docs/start-here/add-a-resource), and [Change inventory](https://corex-zombies.gitbook.io/corex-docs/start-here/change-inventory). Edit each resource's documented configuration rather than replacing the framework. Target libraries and vendor SQL remain separate dependencies.

---

## 🩹 Troubleshooting

| Problem | Fix |
|---|---|
| txAdmin asks for a new deployment unexpectedly | Check that you launched the correct existing txAdmin profile and server-data folder. Do not redeploy over saved player data. |
| A download fails with `404` | Check the exact repository/ref in the failing task. The installer uses pinned published revisions; report the failing URL and do not bypass the failure. |
| A download fails with `403` or a rate-limit message | Keep the first failing task's details, wait for the upstream limit to clear, then retry in the fresh deployment. Do not substitute random download mirrors. |
| Server key rejected | Verify the key from the Cfx.re Portal and the generated `sv_licenseKey`. Never post the key in a support screenshot. |
| `oxmysql` connection fails | Make sure MySQL is running. Check `mysql_connection_string` matches your DB. |
| Port `30120` already in use | Identify the existing service first. Select a free game port for this installation; do not terminate another server blindly. |
| `localhost:40120` won't open | Check the existing FXServer process, selected txAdmin profile, configured panel port and startup error first. Start FXServer only if it is not already running; do not launch a duplicate server. |
| Compatibility status says `this session only` | Check the intended SQL connection and compatibility tables. Do not open a production server while character persistence is unavailable. |
| An imported dependency or NUI file is missing | Inspect the first startup error and use the resource's required built release, not an incomplete source ZIP. |

For help, include the failing task/resource name, versions and the first relevant error. Remove keys, passwords, connection strings and player identifiers from anything you share. See [Troubleshooting](https://corex-zombies.gitbook.io/corex-docs/start-here/troubleshooting).

---

## 📖 Docs
<https://corex-zombies.gitbook.io/corex-docs>

## 💬 Community
<https://discord.gg/G95rtnb9sg>

## License
[MIT](LICENSE)

## Validation scope

This update was checked with automated contracts and an isolated FXServer/database cold-start and restart. These checks do not certify connected-player gameplay or client performance. Test your own fresh installation with a connected player before opening it to the public.
