const pay = () => {
  Payjp.setPublicKey("pk_test_09216bd54a5a7997e4e53ce8"); // PAY.JPテスト公開鍵
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

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("purchaser_destniation[number]").removeAttribute("name");
      document.getElementById("purchaser_destniation[cvc]").removeAttribute("name");
      document.getElementById("purchaser_destniation[exp_month]").removeAttribute("name");
      document.getElementById("purchaser_destniation[exp_year]").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);