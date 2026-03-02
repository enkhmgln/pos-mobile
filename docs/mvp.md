This is **micro-retailer first**, **offline-friendly**, **Ebarimt ready later**.

---

# 🚀 1. Vendly MVP — Exact Feature List

## 🧾 Core Sales (MOST IMPORTANT)

- Create product catalog
- Add price + cost price
- Track stock quantity
- Quick sale (tap product → checkout)
- Manual sale entry
- Discount support
- Multiple payment types (cash / transfer / other)
- Sale history
- Receipt number generation (simple first)

---

## 📦 Inventory

- Stock increase / decrease
- Low stock alerts
- Purchase cost tracking
- Inventory adjustment logs
- Stock movement history

---

## 💸 Expense Tracking

- Record business expenses
- Categories (rent, electricity, supplier, etc.)
- Expense history
- Daily total expenses

---

## 📊 Profit Dashboard (HUGE VALUE)

- Today revenue
- Today expenses
- Today profit
- Weekly summary
- Monthly summary
- Best selling product
- Low stock warnings

Simple numbers. No complex charts initially.

---

## 👤 Merchant Profile

- Shop name
- Owner name
- Phone
- Address
- Currency
- Timezone

---

## 🧾 Receipt System (Phase 1 simple)

- Local receipt ID
- Export PDF / share
- Mark for Ebarimt submission (future)

---

## ☁️ Data Safety

- Offline-first storage
- Cloud backup sync (optional login)
- Auto restore

---

## 🔐 Authentication (simple)

- Phone login OR email login
- Local guest mode allowed

---

## 🚫 NOT in MVP (build later)

❌ Barcode scanning
❌ Multi branch
❌ Employee roles
❌ Supplier management
❌ Payment gateway integration
❌ Accounting exports
❌ Analytics graphs
❌ AI predictions
❌ Ebarimt auto API

Keep MVP small.

---

# 📱 2. Screen-by-Screen UX Flow

Design rule:
👉 1 tap = 1 action
👉 big buttons
👉 no clutter

---

## 0️⃣ Splash Screen

Logo
Loading sync

---

## 1️⃣ Onboarding (first launch only)

Screen 1 — Welcome
“Manage your shop from phone”

Screen 2 — Create Shop

- Shop name
- Currency

Button → Start Selling

---

## 2️⃣ Home Dashboard (MAIN SCREEN)

Top cards:

- Today sales
- Today expenses
- Today profit

Below:

- Low stock alert list

Bottom navigation:
🏠 Home
💰 Sales
📦 Inventory
💸 Expenses
⚙ Settings

Floating button:
➕ New Sale

---

## 3️⃣ New Sale Flow

Tap ➕ New Sale

Screen — Product list
Search bar
Product grid

Tap product → added to cart

Bottom cart bar:
Total amount

Tap Checkout

Checkout screen:

- Payment type
- Discount
- Confirm sale

Success screen:
Sale saved ✔
Share receipt

Return Home

---

## 4️⃣ Sales History

List view:
Date
Amount
Payment type

Tap sale → details

---

## 5️⃣ Inventory Screen

Product list:
Name
Stock count
Low stock indicator

Tap product → details

Product details:
Edit price
Edit cost
Adjust stock

Add product button

---

## 6️⃣ Add Product Screen

- Name
- Selling price
- Cost price
- Initial quantity
  Save

---

## 7️⃣ Expense Screen

Expense list
Total today

Add expense button

---

## 8️⃣ Add Expense Screen

- Amount
- Category
- Note
  Save

---

## 9️⃣ Settings

Shop info
Backup sync
Export data
Future: Ebarimt connect

---

# 🗄 3. Full Database Schema (Production-ready)

Relational structure.

---

## users

```
id (uuid)
phone
email
password_hash
created_at
```

---

## shops

```
id (uuid)
user_id (fk)
name
currency
timezone
created_at
```

---

## products

```
id (uuid)
shop_id (fk)
name
selling_price
cost_price
stock_quantity
low_stock_threshold
created_at
updated_at
```

---

## sales

```
id (uuid)
shop_id (fk)
total_amount
discount_amount
payment_method
receipt_number
created_at
```

---

## sale_items

```
id (uuid)
sale_id (fk)
product_id (fk)
quantity
unit_price
total_price
```

---

## expenses

```
id (uuid)
shop_id (fk)
amount
category
note
created_at
```

---

## inventory_movements

```
id (uuid)
product_id (fk)
change_amount
reason
reference_id
created_at
```

reason examples:
SALE
RESTOCK
MANUAL_ADJUST

---

## receipts (future ebarimt link)

```
id (uuid)
sale_id (fk)
status
external_tax_id
created_at
```

status:
LOCAL
SUBMITTED
FAILED

---

# ⚙️ 4. Recommended Tech Stack (fastest build)

Mobile:
Flutter OR React Native

Backend:
Supabase (fastest MVP)
or
Node.js + PostgreSQL

Offline DB:
SQLite / Realm

Auth:
Firebase Auth OR Supabase Auth

Hosting:
Supabase / Railway / Render

---

# ⏱ Realistic 8 Week Build Plan

Week 1 — database + auth
Week 2 — product + inventory
Week 3 — sales flow
Week 4 — expenses
Week 5 — dashboard
Week 6 — offline sync
Week 7 — receipts export
Week 8 — polish + testing

Launch.

---

# 🧨 What happens after launch (important)

First 20 merchants give feedback → rebuild UX.

Do NOT scale immediately.

---

# If you want next level founder execution:

I can design:

✅ UI wireframe drawings
✅ API endpoints spec
✅ Flutter project structure
✅ State management architecture
✅ Offline sync algorithm
✅ Ebarimt integration technical plan
✅ Pricing tiers
✅ First 100 customer acquisition strategy
✅ Investor pitch deck

Just say:

**“Design system architecture”**
or
**“Help me build step-by-step dev plan”**
