/* pacta-app.js — modals, row-menus, sidebar, export stubs */
document.addEventListener('DOMContentLoaded', function () {

  /* ── Modal ─────────────────────────────────────────────────── */
  function openModal(id) {
    var overlay = document.getElementById(id);
    if (overlay) { overlay.classList.add('is-open'); document.body.style.overflow = 'hidden'; }
  }
  function closeModal(id) {
    var overlay = document.getElementById(id);
    if (overlay) { overlay.classList.remove('is-open'); document.body.style.overflow = ''; }
  }

  // [data-modal-open="modalId"] → open that modal
  document.querySelectorAll('[data-modal-open]').forEach(function (btn) {
    btn.addEventListener('click', function () { openModal(btn.getAttribute('data-modal-open')); });
  });

  // [data-modal-close] inside a modal → close nearest overlay
  document.querySelectorAll('[data-modal-close]').forEach(function (btn) {
    btn.addEventListener('click', function () {
      var overlay = btn.closest('.modal-overlay');
      if (overlay) { overlay.classList.remove('is-open'); document.body.style.overflow = ''; }
    });
  });

  // Click on overlay backdrop (not on .modal itself) → close
  document.querySelectorAll('.modal-overlay').forEach(function (overlay) {
    overlay.addEventListener('click', function (e) {
      if (e.target === overlay) { overlay.classList.remove('is-open'); document.body.style.overflow = ''; }
    });
  });

  // Esc key → close all modals
  document.addEventListener('keydown', function (e) {
    if (e.key === 'Escape') {
      document.querySelectorAll('.modal-overlay.is-open').forEach(function (overlay) {
        overlay.classList.remove('is-open');
      });
      document.body.style.overflow = '';
    }
  });

  /* ── Row-menu dropdown ──────────────────────────────────────── */
  var openMenu = null;

  document.querySelectorAll('[data-action="row-menu"]').forEach(function (btn) {
    btn.addEventListener('click', function (e) {
      e.stopPropagation();
      var wrap = btn.closest('.row-menu-wrap');
      var menu = wrap ? wrap.querySelector('.row-menu') : null;
      if (!menu) return;

      if (openMenu && openMenu !== menu) { openMenu.classList.remove('is-open'); }
      menu.classList.toggle('is-open');
      openMenu = menu.classList.contains('is-open') ? menu : null;
    });
  });

  document.addEventListener('click', function () {
    if (openMenu) { openMenu.classList.remove('is-open'); openMenu = null; }
  });

  /* ── Export stub ────────────────────────────────────────────── */
  document.querySelectorAll('[data-action="export"]').forEach(function (btn) {
    btn.addEventListener('click', function () {
      var title = btn.getAttribute('data-export-title') || 'Eksport';
      alert(title + ' funksiyasi tez orada qo\'shiladi.');
    });
  });

  /* ── Sidebar toggle ─────────────────────────────────────────── */
  var sidebarToggle = document.getElementById('sidebarToggle');
  var sidebar = document.querySelector('.sidebar');
  if (sidebarToggle && sidebar) {
    sidebarToggle.addEventListener('click', function () {
      sidebar.classList.toggle('is-collapsed');
      var expanded = !sidebar.classList.contains('is-collapsed');
      sidebarToggle.setAttribute('aria-expanded', expanded);
      sidebarToggle.textContent = expanded ? '\u2039' : '\u203a';
    });
  }

});
