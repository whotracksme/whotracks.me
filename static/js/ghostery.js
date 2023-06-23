const navbar = document.querySelector('.navbar-ghostery');

if (navbar) {
  if (window.location.href.indexOf('utm_campaign=WTM_explainer') > -1) {
    navbar.classList.add('open');
  }

  navbar.querySelector('button').addEventListener('click', () => {
    navbar.classList.toggle('open');
  });
}
