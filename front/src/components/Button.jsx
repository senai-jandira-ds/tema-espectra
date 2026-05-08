function Button({
  children,
  onClick,
  variantClick = "basicClick",
  type = "button",
}) {
  const estiloBase =
    "instrument-sans text-xl w-48 h-12 rounded-lg font-bold shadow-[5px_10px_20px_rgba(0,0,0,0.25)] transition-colors duration-200";

  const variants = {
    basicClick:
      "bg-[var(--bg-primary-color)] text-white hover:bg-[var(--bg-secondary-color)]",
    deleteButton: "bg-red-500 text-white hover:bg-red-600",
  };

  return (
    <button
      type={type}
      onClick={onClick}
      className={`${estiloBase} ${variants[variantClick]}`}
    >
      {children}
    </button>
  );
}

export default Button;
