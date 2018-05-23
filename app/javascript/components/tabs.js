function tabActive() {
  const tabs = document.querySelectorAll(".tab");
  tabs.forEach((tab) => {
    tab.addEventListener("click", (event) => {
      event.preventDefault();
      tabs.forEach((tab2) => {
        tab2.classList.remove('active');
      });
      event.currentTarget.classList.add('active');
    });
  });
}

export { tabActive };
