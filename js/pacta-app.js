/* pacta-app.js — modals, row-menus, sidebar, export stubs */

/* Inject logout confirmation modal into every page */
(function () {
  var html =
    '<div class="modal-overlay" id="logoutModal" role="dialog" aria-modal="true" aria-labelledby="logoutModalTitle">' +
      '<div class="modal" style="max-width:400px;">' +
        '<div class="modal__head">' +
          '<h2 class="modal__title" id="logoutModalTitle">Tizimdan chiqish</h2>' +
          '<button type="button" class="modal__close" data-modal-close aria-label="Yopish"><i class="ph ph-x"></i></button>' +
        '</div>' +
        '<div class="modal__body">' +
          '<div style="display:flex;gap:16px;align-items:flex-start;">' +
            '<div style="width:44px;height:44px;flex-shrink:0;border-radius:12px;background:#fef2f2;display:flex;align-items:center;justify-content:center;font-size:22px;color:#dc2626;">' +
              '<i class="ph ph-sign-out"></i>' +
            '</div>' +
            '<div>' +
              '<p style="margin:0 0 4px;font-size:14px;font-weight:600;color:var(--grey-900,#0d0d12);">Haqiqatan ham chiqmoqchimisiz?</p>' +
              '<p style="margin:0;font-size:13px;color:var(--grey-500,#666d80);">Tizimdan chiqsangiz, qayta kirishingiz kerak bo\u2018ladi.</p>' +
            '</div>' +
          '</div>' +
        '</div>' +
        '<div class="modal__foot">' +
          '<button type="button" class="btn btn--secondary" data-modal-close>Bekor qilish</button>' +
          '<button type="button" class="btn btn--danger" id="logoutConfirmBtn"><i class="ph ph-sign-out"></i> Ha, chiqish</button>' +
        '</div>' +
      '</div>' +
    '</div>';

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', function () {
      document.body.insertAdjacentHTML('beforeend', html);
    });
  } else {
    document.body.insertAdjacentHTML('beforeend', html);
  }
})();

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

  /* ── Logout link → modal ───────────────────────────────────── */
  document.querySelectorAll('.logout').forEach(function (link) {
    link.addEventListener('click', function (e) {
      e.preventDefault();
      var dest = link.getAttribute('href');
      var confirmBtn = document.getElementById('logoutConfirmBtn');
      if (confirmBtn) {
        confirmBtn.onclick = function () {
          window.location.href = dest || 'admin-login.html';
        };
      }
      openModal('logoutModal');
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
