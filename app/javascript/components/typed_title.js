import Typed from 'typed.js';

function loadDynamicTitleText() {
  new Typed('#title-typed-text', {
    strings: ["Rent your favorite band."],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicTitleText };
