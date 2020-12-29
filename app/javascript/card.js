const pay = () => {
  Payjp.setPublicKey("pk_test_******************"); // PAY.JPテスト公開鍵
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("purchaser_destniation[number]"),
      cvc: formData.get("purchaser_destniation[cvc]"),
      exp_month: formData.get("purchaser_destniation[exp_month]"),
      exp_year: `20${formData.get("purchaser_destniation[exp_year]")}`,
    };
  });
};

window.addEventListener("load", pay);