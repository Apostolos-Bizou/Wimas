# WIMAS ERP — Live Demo Script (Φ6)

**Live URL:** https://apostolos-bizou.github.io/Wimas/  ·  **App:** `WIMAS-ERP.html`
All accounts use password **`demo123`**. Every login screen shows one-click **demo chips**.

State is shared and persisted in the browser (`localStorage`), so actions by one role are visible to the others. **Start every demo with Reset** so the walkthrough is reproducible.

---

## 0. Reset (do this first)
1. Log in as **Training Administrator** — chip **"Charlene Wima"** (`charlene@wimas.io` / `demo123`).
2. Sidebar → **Settings** → card **🧪 Demo Data** → **↺ Reset demo data**.
   *You'll see:* toast "Demo data reset to defaults". Seed is now clean (8 seafarers, 10 OTRs, 6 sessions, etc.).

---

## The end-to-end chain (one continuous story: an OTR becomes a certificate becomes an invoice)

### 1. Money Agent / Admin — create a Training Request (OTR)
- As **Training Administrator** → **OTR Requests** → **＋ New OTR**.
- Seafarer **Petros Nikolaou**, Principal **Shell**, pick a course → **Submit OTR**.
- *You'll see:* toast "OTR … created — ⚠ N compliance gaps" (E07-02 compliance gate), new row `OTR-2026-0155` at the top with a **⚠ Missing: …** note.

### 2. Admin — route the OTR to a training center
- On `OTR-2026-0155` → **View →** → dialog: **Assign to Training Center = WIMAS Training Center** → **Assign & Confirm**.
- *You'll see:* toast "routed to WIMAS for confirmation"; the OTR status becomes **routed → WIMAS**.

### 3. Training Center Staff — confirm
- **Sign Out** → log in as **Center Staff** — chip **"WIMAS Center Ops"** (`ops.wimas@wimas.io`).
- Landing screen **Routed OTRs** shows `OTR-2026-0155` → **✅ Confirm → Schedule**.
- *You'll see:* status flips to **scheduled**. (Try **✖ Decline** on another to see the reason flow returning to admin.)

### 4. Admin — create the course session (with conflict detection)
- Sign Out → log in as **Training Administrator**. Sidebar → **Course Schedule** → **New Session**.
- Course **STCW Basic Safety Training**, Center **WIMAS**, Instructor **K. Papadopoulos**, dates e.g. **01→03 Jul 2026**, Room **Q** → **Create Session**.
- *Show conflict detection (optional):* try the same instructor with dates overlapping an existing session → **blocked** with a red "Conflict — instructor … booked" toast.

### 5. Admin — enroll the seafarer (+ notification)
- On the new session row (All Sessions) → **＋ Enroll** → seafarer **Petros Nikolaou** → **Enroll**.
- *You'll see:* enrollment recorded; a notification is queued for Petros. *(If a session is full, you get "added to waitlist" instead.)*

### 6. Instructor — attendance + grade → certificate auto-issues
- Sign Out → log in as **Instructor** — chip **"Kostas Papadopoulos"** (`k.papa@wimas.io`).
- **My Sessions** (only his sessions) → open the STCW session → **Attendance**: mark **Petros = Present** → **Grades**: enter **88** → **💾 Save & Issue Certs**.
- *You'll see:* toast "certificate issued". A new cert appears in `DATA.certs` (idempotent — saving again issues no duplicate).

### 7. Seafarer — sees the certificate, notification, and upcoming training
- Sign Out → log in as **Seafarer** — chip **"Petros Nikolaou"** (`petros@seafarer.io`).
- **My Certificates** → the new STCW certificate is listed (same cert the admin sees — single source).
- **Notifications** → "Certificate issued" **and** "Enrolled in course".
- **Upcoming Training** → the session he was enrolled into.

### 8. Admin — create an invoice and send for approval
- Sign Out → log in as **Training Administrator**. Sidebar → **Certificates & Invoices** → **＋ New Invoice**.
- Agent **Aegean Crew Mgmt**, Principal **Shell**, Amount **4800** → **Create Draft**.
- On that draft invoice → **Send for Approval**.
- *You'll see:* status **ready_for_approval / Awaiting CFO**. (Note: the admin has **no Approve button** — segregation of duties.)

### 9. CFO — approve (the money loop closes)
- Sign Out → log in as **CFO / Final Approver** — chip **"Niki Varia"** (`niki@wimas.io`).
- **Invoice Approvals** → the invoice is listed → **✅ Approve** (or **✖ Reject** with a reason).
- *You'll see:* status **approved**, approver "Niki Varia". Back as Admin, the invoice shows **approved**.

---

## Bonus screens to show
- **Reports** (Admin): "Compliance by Principal" bars are **clickable → drill-down** to the fleet list; External-Center-Usage market panel.
- **Compliance** (Admin): click a requirement's **status cell** → drill-down showing which seafarers are valid/expiring/expired/missing.
- **Money Agent profile:** in Certificates & Invoices, click an **agent name** → fleet / OTRs / invoices / total billed.
- **Career:** **Promotions** → training leaderboard with current→target promotion paths.
- **System Admin** (`admin@wimas.io`): Users, Training Centers (**＋ Add Center**), org settings.
- **Money Agent** (`agent@shell.com`): agent-scoped dashboard, My OTRs, My Seafarers.

## Roles quick reference
| Role | Chip / email |
|---|---|
| Training Administrator | Charlene Wima · `charlene@wimas.io` |
| Money Agent | Shell Agent · `agent@shell.com` |
| System Admin | System Admin · `admin@wimas.io` |
| Seafarer | Petros Nikolaou · `petros@seafarer.io` |
| Instructor | Kostas Papadopoulos · `k.papa@wimas.io` |
| Training Center Staff | WIMAS Center Ops · `ops.wimas@wimas.io` |
| CFO / Final Approver | Niki Varia · `niki@wimas.io` |

*Reset any time via Settings → Demo Data → Reset. This is a front-end mockup; all data lives in the browser.*
