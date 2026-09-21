<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>ReCycle Cash</title>

  <style>
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    body {
      font-family: Inter, Arial, sans-serif;
      background: #f4f8f5;
      color: #173b2b;
    }

    /* NAVBAR */
    nav {
      background: #0f5132;
      color: white;
      padding: 18px 7%;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .logo {
      font-size: 22px;
      font-weight: 800;
    }

    .nav-wallet {
      background: #ffffff20;
      padding: 10px 16px;
      border-radius: 30px;
    }

    /* MAIN */
    main {
      max-width: 1100px;
      margin: 40px auto;
      padding: 0 20px;
    }

    .hero {
      margin-bottom: 30px;
    }

    .hero h1 {
      font-size: 38px;
      margin-bottom: 8px;
    }

    .hero p {
      color: #638073;
      font-size: 16px;
    }

    /* WALLET */
    .wallet {
      background: linear-gradient(135deg, #0f5132, #1f7a4c);
      color: white;
      padding: 28px;
      border-radius: 20px;
      margin-bottom: 30px;
      box-shadow: 0 10px 30px #0f513225;
    }

    .wallet-label {
      opacity: 0.8;
      font-size: 14px;
    }

    .balance {
      font-size: 42px;
      font-weight: 800;
      margin: 8px 0 20px;
    }

    .wallet-stats {
      display: flex;
      gap: 40px;
    }

    .stat span {
      display: block;
      font-size: 13px;
      opacity: 0.75;
    }

    .stat strong {
      font-size: 18px;
    }

    /* GRID */
    .grid {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 25px;
    }

    .card {
      background: white;
      border-radius: 18px;
      padding: 25px;
      box-shadow: 0 5px 20px #173b2b10;
    }

    .card h2 {
      margin-bottom: 20px;
      font-size: 21px;
    }

    /* MATERIAL SELECTOR */
    .materials {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 12px;
      margin-bottom: 20px;
    }

    .material {
      border: 2px solid #e2ebe5;
      padding: 15px;
      border-radius: 12px;
      cursor: pointer;
      transition: 0.2s;
    }

    .material:hover {
      border-color: #35a76a;
    }

    .material.selected {
      border-color: #1f8a50;
      background: #eaf8ef;
    }

    .material-icon {
      font-size: 25px;
    }

    .material-name {
      font-weight: 700;
      margin-top: 5px;
    }

    .rate {
      color: #638073;
      font-size: 13px;
      margin-top: 3px;
    }

    /* FORM */
    label {
      display: block;
      margin-bottom: 7px;
      font-size: 14px;
      font-weight: 600;
    }

    input {
      width: 100%;
      padding: 13px;
      border: 1px solid #d9e5dc;
      border-radius: 10px;
      font-size: 16px;
      margin-bottom: 16px;
      outline: none;
    }

    input:focus {
      border-color: #1f8a50;
    }

    .unit {
      color: #638073;
      font-size: 13px;
      margin-top: -10px;
      margin-bottom: 15px;
    }

    .cashback-preview {
      background: #effaf2;
      border-radius: 12px;
      padding: 15px;
      margin-bottom: 18px;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .cashback-preview strong {
      color: #13753f;
      font-size: 22px;
    }

    button {
      width: 100%;
      border: none;
      padding: 14px;
      border-radius: 10px;
      background: #168047;
      color: white;
      font-size: 16px;
      font-weight: 700;
      cursor: pointer;
      transition: 0.2s;
    }

    button:hover {
      background: #106638;
      transform: translateY(-1px);
    }

    /* TRANSACTIONS */
    .transactions {
      margin-top: 25px;
    }

    .transaction {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 15px 0;
      border-bottom: 1px solid #edf1ee;
    }

    .transaction:last-child {
      border-bottom: none;
    }

    .transaction-left {
      display: flex;
      align-items: center;
      gap: 12px;
    }

    .transaction-icon {
      width: 42px;
      height: 42px;
      background: #eaf8ef;
      border-radius: 50%;
      display: grid;
      place-items: center;
      font-size: 20px;
    }

    .transaction-name {
      font-weight: 700;
    }

    .transaction-date {
      color: #84958c;
      font-size: 12px;
      margin-top: 3px;
    }

    .amount {
      color: #168047;
      font-weight: 800;
    }

    .empty {
      color: #84958c;
      text-align: center;
      padding: 20px 0;
    }

    /* MOBILE */
    @media (max-width: 750px) {
      .grid {
        grid-template-columns: 1fr;
      }

      .hero h1 {
        font-size: 30px;
      }

      .wallet-stats {
        gap: 25px;
      }
    }
  </style>
</head>

<body>

  <nav>
    <div class="logo">♻️ ReCycle Cash</div>
    <div class="nav-wallet">
      Wallet: <strong id="navBalance">$0.00</strong>
    </div>
  </nav>

  <main>

    <section class="hero">
      <h1>Recycle. Earn. Repeat.</h1>
      <p>
        Turn your recyclable materials into cashback and build your recycling wallet.
      </p>
    </section>

    <!-- WALLET -->
    <section class="wallet">
      <div class="wallet-label">Your recycling wallet</div>

      <div class="balance" id="balance">$0.00</div>

      <div class="wallet-stats">
        <div class="stat">
          <span>Total recycled</span>
          <strong id="totalWeight">0 kg</strong>
        </div>

        <div class="stat">
          <span>Items recycled</span>
          <strong id="totalItems">0</strong>
        </div>

        <div class="stat">
          <span>Transactions</span>
          <strong id="transactionCount">0</strong>
        </div>
      </div>
    </section>

    <div class="grid">

      <!-- ADD RECYCLING -->
      <section class="card">

        <h2>Add Recycling</h2>

        <div class="materials">

          <div class="material selected" data-type="plastic">
            <div class="material-icon">🧴</div>
            <div class="material-name">Plastic</div>
            <div class="rate">$0.80 / kg</div>
          </div>

          <div class="material" data-type="glass">
            <div class="material-icon">🍾</div>
            <div class="material-name">Glass</div>
            <div class="rate">$0.50 / kg</div>
          </div>

          <div class="material" data-type="cans">
            <div class="material-icon">🥫</div>
            <div class="material-name">Cans</div>
            <div class="rate">$1.20 / kg</div>
          </div>

          <div class="material" data-type="paper">
            <div class="material-icon">📦</div>
            <div class="material-name">Paper</div>
            <div class="rate">$0.30 / kg</div>
          </div>

        </div>

        <label for="weight">How much did you recycle?</label>

        <input
          type="number"
          id="weight"
          placeholder="Enter weight"
          min="0"
          step="0.1"
        />

        <div class="unit">
          Weight is measured in kilograms (kg).
        </div>

        <div class="cashback-preview">
          <span>Estimated cashback</span>
          <strong id="preview">$0.00</strong>
        </div>

        <button id="addButton">
          Add to Wallet
        </button>

      </section>

      <!-- TRANSACTIONS -->
      <section class="card">

        <h2>Recent Activity</h2>

        <div id="transactions">

          <div class="empty">
            No recycling transactions yet.
          </div>

        </div>

      </section>

    </div>

  </main>

  <script>

    /*
      Recycling cashback rates.
      You can change these values to whatever
      pricing system your app uses.
    */

    const rates = {
      plastic: 0.80,
      glass: 0.50,
      cans: 1.20,
      paper: 0.30
    };

    const materialInfo = {
      plastic: {
        name: "Plastic",
        icon: "🧴"
      },
      glass: {
        name: "Glass",
        icon: "🍾"
      },
      cans: {
        name: "Cans",
        icon: "🥫"
      },
      paper: {
        name: "Paper",
        icon: "📦"
      }
    };

    let selectedMaterial = "plastic";

    let balance = 0;
    let totalWeight = 0;
    let totalItems = 0;
    let transactions = [];


    /* SELECT MATERIAL */

    const materialCards = document.querySelectorAll(".material");

    materialCards.forEach(card => {

      card.addEventListener("click", () => {

        materialCards.forEach(item => {
          item.classList.remove("selected");
        });

        card.classList.add("selected");

        selectedMaterial = card.dataset.type;

        updatePreview();

      });

    });


    /* UPDATE CASHBACK PREVIEW */

    const weightInput = document.getElementById("weight");

    weightInput.addEventListener("input", updatePreview);

    function updatePreview() {

      const weight = parseFloat(weightInput.value) || 0;

      const cashback = weight * rates[selectedMaterial];

      document.getElementById("preview").textContent =
        "$" + cashback.toFixed(2);

    }


    /* ADD TRANSACTION */

    document.getElementById("addButton").addEventListener("click", () => {

      const weight = parseFloat(weightInput.value);

      if (!weight || weight <= 0) {
        alert("Please enter a valid recycling weight.");
        return;
      }

      const cashback = weight * rates[selectedMaterial];

      balance += cashback;
      totalWeight += weight;
      totalItems++;

      const transaction = {
        material: selectedMaterial,
        weight: weight,
        cashback: cashback,
        date: new Date()
      };

      transactions.unshift(transaction);

      weightInput.value = "";

      updatePreview();
      updateWallet();
      renderTransactions();

    });


    /* UPDATE WALLET */

    function updateWallet() {

      document.getElementById("balance").textContent =
        "$" + balance.toFixed(2);

      document.getElementById("navBalance").textContent =
        "$" + balance.toFixed(2);

      document.getElementById("totalWeight").textContent =
        totalWeight.toFixed(1) + " kg";

      document.getElementById("totalItems").textContent =
        totalItems;

      document.getElementById("transactionCount").textContent =
        transactions.length;

    }


    /* RENDER TRANSACTIONS */

    function renderTransactions() {

      const container = document.getElementById("transactions");

      if (transactions.length === 0) {

        container.innerHTML = `
          <div class="empty">
            No recycling transactions yet.
          </div>
        `;

        return;
      }

      container.innerHTML = transactions.map(transaction => {

        const info = materialInfo[transaction.material];

        const date = transaction.date.toLocaleDateString();

        return `
          <div class="transaction">

            <div class="transaction-left">

              <div class="transaction-icon">
                ${info.icon}
              </div>

              <div>
                <div class="transaction-name">
                  ${info.name}
                </div>

                <div class="transaction-date">
                  ${transaction.weight.toFixed(1)} kg · ${date}
                </div>
              </div>

            </div>

            <div class="amount">
              +$${transaction.cashback.toFixed(2)}
            </div>

          </div>
        `;

      }).join("");

    }

  </script>

</body>
</html>
