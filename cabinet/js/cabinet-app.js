(function () {
  var NAV = [
    {
      label: 'Asosiy',
      items: [
        { href: 'cabinet-dashboard.html',   label: 'Dashboard',
          icon: '<rect x="2" y="2" width="7" height="7" rx="1.5"/><rect x="11" y="2" width="7" height="7" rx="1.5"/><rect x="2" y="11" width="7" height="7" rx="1.5"/><rect x="11" y="11" width="7" height="7" rx="1.5"/>' },
        { href: 'cabinet-organization.html', label: 'Hududiy kabinet',
          icon: '<circle cx="10" cy="7" r="3.5"/><path d="M3 17c0-3.3 3.1-6 7-6s7 2.7 7 6"/>' },
        { href: 'cabinet-applications.html', label: 'Markaziy kabinet',
          icon: '<rect x="3" y="3" width="14" height="14" rx="2"/><path d="M7 7h6M7 10h6M7 13h4"/>' },
        { href: 'cabinet-nnt-data.html',     label: "NNT ma'lumotlari",
          icon: '<ellipse cx="10" cy="6" rx="7" ry="3"/><path d="M3 6v4c0 1.7 3.1 3 7 3s7-1.3 7-3V6"/><path d="M3 10v4c0 1.7 3.1 3 7 3s7-1.3 7-3v-4"/>' }
      ]
    },
    {
      label: 'Tahlil',
      items: [
        { href: 'cabinet-statistics.html', label: 'Statistika va hisobotlar',
          icon: '<polyline points="2 14 7 9 11 13 18 5"/>' }
      ]
    },
    {
      label: 'Kontent',
      items: [
        { href: 'cabinet-news.html',   label: 'Yangiliklar',
          icon: '<rect x="2" y="3" width="16" height="13" rx="1.5"/><path d="M5 7h10M5 10h7"/>' },
        { href: 'cabinet-events.html', label: 'Tadbirlar',
          icon: '<rect x="3" y="4" width="14" height="13" rx="1"/><path d="M7 4V2M13 4V2M3 8h14"/>' },
        { href: 'cabinet-grants.html', label: 'Grantlar va loyihalar',
          icon: '<circle cx="10" cy="10" r="7.5"/><path d="M10 6v4l2.5 2"/>' }
      ]
    },
    {
      label: 'Tizim',
      items: [
        { href: 'cabinet-settings.html', label: 'Sozlamalar',
          icon: '<circle cx="10" cy="10" r="2.5"/><path d="M10 2v2M10 16v2M2 10h2M16 10h2M4.22 4.22l1.42 1.42M14.36 14.36l1.42 1.42M4.22 15.78l1.42-1.42M14.36 5.64l1.42-1.42"/>' }
      ]
    }
  ];

  var TOPBAR_HTML =
    '<div class="topbar-title">O\'zNNTMA <span>&nbsp;Boshqaruv Tizimi</span></div>' +
    '<div class="topbar-right">' +
      '<div class="topbar-badge" title="Bildirishnomalar" role="button" tabindex="0" aria-label="Bildirishnomalar">' +
        '<svg width="17" height="17" viewBox="0 0 20 20" fill="none" stroke="currentColor" stroke-width="1.9" aria-hidden="true">' +
          '<path d="M10 2a6 6 0 0 1 6 6c0 3 1.5 4 1.5 4H2.5S4 11 4 8a6 6 0 0 1 6-6z"/>' +
          '<path d="M8.3 17a1.7 1.7 0 0 0 3.4 0"/>' +
        '</svg>' +
        '<span class="dot" aria-hidden="true"></span>' +
      '</div>' +
      '<div class="user-chip" role="button" tabindex="0">' +
        '<div class="user-avatar">AB</div>' +
        '<div class="user-info">' +
          '<div class="user-name">Admin Bekmurod</div>' +
          '<div class="user-role">Tizim administratori</div>' +
        '</div>' +
      '</div>' +
      '<button class="btn-logout" type="button" onclick="window.location.href=\'cabinet-login.html\'">Chiqish</button>' +
    '</div>';

  function svgIcon(paths) {
    return '<svg class="nav-icon" viewBox="0 0 20 20" fill="none" stroke="currentColor" stroke-width="1.8" aria-hidden="true">' + paths + '</svg>';
  }

  function buildSidebar(currentPage) {
    var html =
      '<div class="sidebar-logo">' +
        '<div class="logo-icon">NNT</div>' +
        '<div class="logo-text">O\'zNNTMA<span>Boshqaruv tizimi</span></div>' +
      '</div>';

    NAV.forEach(function (section) {
      html += '<div class="sidebar-section"><div class="sidebar-section-label">' + section.label + '</div>';
      section.items.forEach(function (item) {
        var active = (item.href === currentPage) ? ' active' : '';
        html += '<a class="nav-item' + active + '" href="' + item.href + '">' + svgIcon(item.icon) + item.label + '</a>';
      });
      html += '</div>';
    });

    return html;
  }

  function init() {
    var app = document.querySelector('.app');
    if (!app) return;

    var currentPage = (window.location.pathname.split('/').pop() || 'cabinet-dashboard.html');

    var sidebar = document.createElement('aside');
    sidebar.className = 'sidebar';
    sidebar.innerHTML = buildSidebar(currentPage);

    var topbar = document.createElement('header');
    topbar.className = 'topbar';
    topbar.innerHTML = TOPBAR_HTML;

    var main = app.querySelector('.main');
    app.insertBefore(sidebar, main);
    app.insertBefore(topbar, main);

    // Update date chip if present
    var dateChip = document.getElementById('js-date');
    if (dateChip) {
      var d = new Date();
      var months = ['yanvar','fevral','mart','aprel','may','iyun','iyul','avgust','sentabr','oktabr','noyabr','dekabr'];
      dateChip.textContent = d.getFullYear() + '-yil, ' + d.getDate() + '-' + months[d.getMonth()];
    }
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
  } else {
    init();
  }
})();
