import { CaretDownOutlined } from '@ant-design/icons';
import { useState, useRef, useEffect } from 'react';

function MultiLabel({ arrayItem, index, lastIndex, name }) {
  const [isShowed, setIsShowed] = useState(false);
  const dropdownRef = useRef(null);

  const handleMouseEnter = () => {
    setIsShowed(true);
  };

  const handleMouseLeave = () => {
    setIsShowed(false);
  };

  useEffect(() => {
    const handleOutsideClick = event => {
      if (dropdownRef.current && !dropdownRef.current.contains(event.target)) {
        setIsShowed(false);
      }
    };

    document.addEventListener('mousedown', handleOutsideClick);

    return () => {
      document.removeEventListener('mousedown', handleOutsideClick);
    };
  }, []);

  if (!arrayItem.length) return '-';

  const secondIndex = lastIndex - 1;
  const thirdIndex = lastIndex - 2;

  return (
    <div
      className="relative inline-block"
      ref={dropdownRef}
      onMouseEnter={handleMouseEnter}
      onMouseLeave={handleMouseLeave}
    >
      <div
        className="relative hover:bg-[#d9d9d9] duration-300 flex items-center cursor-pointer p-[1rem] rounded-[0.8rem]"
        onClick={() => setIsShowed(!isShowed)}
        aria-haspopup="listbox"
        aria-expanded={isShowed}
      >
        <span className="text-[1.4rem] font-semibold px-[0.5rem] bg-[#666] rounded-[0.4rem] text-white">
          {arrayItem.length}
        </span>
        <p className="text-[1.4rem] font-semibold ml-2">{name}</p>
        <CaretDownOutlined className="ml-2" />

        <span
          className="absolute bottom-[-8px] left-0 w-full h-[8px] bg-transparent rounded-b-[0.8rem] pointer-events-auto"
          onMouseEnter={handleMouseEnter}
        ></span>

        <span
          className="absolute top-[-8px] left-0 w-full h-[8px] bg-transparent rounded-t-[0.8rem] pointer-events-auto"
          onMouseEnter={handleMouseEnter}
        ></span>
      </div>
      {isShowed && arrayItem.length > 0 && (
        <ul
          className={`mt-2 flex gap-[0.4rem] absolute bg-white shadow-lg rounded-[0.8rem] p-[0.5rem] border border-[#ccc] transform transition-all duration-300 ease-in-out origin-top-right z-50 ${
            index === lastIndex ||
            index === secondIndex ||
            index === thirdIndex ||
            arrayItem.length >= 2
              ? 'bottom-[110%]'
              : 'flex-col'
          }`}
          role="listbox"
        >
          {arrayItem.map(item => (
            <li
              key={item.id}
              className="text-[1.2rem] rounded-[0.4rem] text-center cursor-pointer p-[1rem] min-w-[5rem] hover:bg-[#d9d9d9] text-nowrap"
              role="option"
              aria-selected="false"
            >
              {item.title}
            </li>
          ))}
        </ul>
      )}
    </div>
  );
}

export default MultiLabel;
