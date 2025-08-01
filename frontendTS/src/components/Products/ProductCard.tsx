import './ProductCard.css';
import star from '../../assets/white-star.png';
import basket from '../../assets/basket.png';
import { NavLink } from 'react-router-dom';

interface ProductCardProps {
  id: string;
  image: string;
  price: number;
  title: string;
  rating: number;
  ratingCounts: number;
  stock: number;
}

export function ProductCard({
  id,
  image,
  price,
  title,
  rating,
  ratingCounts,
  stock,
}: ProductCardProps) {
  return (
    <article className="product_card">
      <div className="product_image">
        <NavLink to={`/product/${id}`}>
          <img
            src={`http://localhost:5000/products/${image}`}
            alt="product image"
          />
        </NavLink>
      </div>
      <div className="product_details">
        <h3 className="product_price">${price}</h3>
        <p className="product_title">{title}</p>
        <footer className="align_center product_info_footer">
          <div className="align_center">
            <p className="align_center product_rating">
              <img src={star} alt="star" /> {rating}
            </p>
            <p className="product_review_count">{ratingCounts}</p>
          </div>
          {stock > 0 && (
            <button className="add_to_cart">
              <img src={basket} alt="to basket" />
            </button>
          )}
        </footer>
      </div>
    </article>
  );
}
