// item li que se repete na página inicial
function NavItem({ href, children }) {
  return (
    <li className="hover:bg-[#3277CF] hover:text-white px-2 rounded-2xl transition-colors duration-200">
      <a href={href}>{children}</a>
    </li>
  );
}

export default NavItem;
