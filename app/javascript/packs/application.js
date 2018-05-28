import "bootstrap";
import "jquery";
import "../plugins/flatpickr";

console.log('Hello World from Webpacker');

import { tabActive } from '../components/tabs';

tabActive();



window.sr = ScrollReveal();
sr.reveal('.box', { duration: 2000 }, 50);
