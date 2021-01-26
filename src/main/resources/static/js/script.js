function showPassword(_this) {
    const x = _this.closest(".row").querySelector(".passwordInput");
    x.type = x.type === "password" ? "text" : "password";
}