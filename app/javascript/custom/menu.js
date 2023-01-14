
function addToggleListener(sel_id, m_id, toggle) {
  let element = document.querySelector(`#${sel_id}`);
  element.addEventListener('click', e => {
    e.preventDefault();
    let menu = document.querySelector(`#${m_id}`);
    menu.classList.toggle(toggle);
  });
}

document.addEventListener('turbo:load', () => {
  addToggleListener('hamburger', 'navbar-menu', 'collapse');
  addToggleListener('account', 'dropdown-menu', 'active');
});