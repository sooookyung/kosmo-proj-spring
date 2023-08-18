function showToast(message, type) {
  const toastContainer = document.createElement("div");
  toastContainer.classList.add("toast-container", "p-3", "position-fixed", "bottom-0", "end-0");
  const toast = document.createElement("div");
  toast.classList.add("toast", "align-items-center");
  if (type !== undefined) {
    toast.classList.add("text-bg-" + type);
  }
  toast.setAttribute("role", "alert");
  toast.innerHTML = `<div class="d-flex">
    <div class="toast-body">
      ${message}
    </div>
    <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
    </div>`;
  toastContainer.appendChild(toast);
  document.body.appendChild(toastContainer);
  new bootstrap.Toast(toast, { delay: 3000 }).show();
}
