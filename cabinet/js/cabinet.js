(function () {
  var page = (location.pathname.split("/").pop() || "cabinet-dashboard.html").toLowerCase();
  var links = document.querySelectorAll(".side nav a[data-page]");
  links.forEach(function (a) {
    a.classList.toggle("active", a.getAttribute("data-page") === page);
  });

  var segButtons = document.querySelectorAll("[data-seg]");
  if (segButtons.length) {
    segButtons.forEach(function (btn) {
      btn.addEventListener("click", function () {
        var seg = btn.getAttribute("data-seg");
        segButtons.forEach(function (x) {
          x.classList.toggle("active", x === btn);
        });
        var cards = document.querySelectorAll("[data-segments]");
        cards.forEach(function (card) {
          var map = card.getAttribute("data-segments") || "";
          card.style.display = seg === "all" || map.indexOf(seg) !== -1 ? "" : "none";
        });
      });
    });
  }

  // Documents page demo upload flow: progress + timeline insertion.
  var fileInput = document.getElementById("doc-file");
  var uploadBtn = document.getElementById("doc-upload");
  var statusEl = document.getElementById("doc-status");
  var progressEl = document.getElementById("doc-progress");
  var timelineEl = document.getElementById("doc-timeline");

  if (fileInput && uploadBtn && statusEl && progressEl && timelineEl) {
    uploadBtn.addEventListener("click", function () {
      var file = fileInput.files && fileInput.files[0];
      if (!file) {
        statusEl.textContent = "Avval fayl tanlang";
        progressEl.textContent = "0%";
        return;
      }

      var p = 0;
      uploadBtn.disabled = true;
      statusEl.textContent = "Yuklanmoqda: " + file.name;
      progressEl.textContent = "0%";

      var timer = setInterval(function () {
        p = Math.min(100, p + 20);
        progressEl.textContent = p + "%";

        if (p === 100) {
          clearInterval(timer);
          statusEl.textContent = "Yuklandi va navbatga qo'shildi";
          uploadBtn.disabled = false;

          var now = new Date();
          var dd = String(now.getDate()).padStart(2, "0");
          var mm = String(now.getMonth() + 1).padStart(2, "0");
          var yyyy = String(now.getFullYear());

          var item = document.createElement("li");
          item.className = "event-item";
          item.innerHTML = "<h4>" + file.name + "</h4><p>" + dd + "." + mm + "." + yyyy + " - Yangi versiya yuklandi</p>";
          timelineEl.insertBefore(item, timelineEl.firstChild);

          fileInput.value = "";
        }
      }, 220);
    });
  }
})();
