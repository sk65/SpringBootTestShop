function showPassword(_this) {
    const x = _this.closest(".row").querySelector(".form-control")
    if (x.type === "password") {
        x.type = "text";
    } else {
        x.type = "password";
    }
}