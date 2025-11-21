
// //========= TOGGLE MATERIE
document.addEventListener("DOMContentLoaded", () => {
    document.querySelectorAll(".toggle-materie").forEach(btn => {
        btn.addEventListener("click", () => {
            const target = document.getElementById(btn.dataset.target);
            if (target) {
                target.classList.toggle("materie-aggiuntive-on");
            }
        });
    });
});
