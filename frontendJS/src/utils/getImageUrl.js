// utils/getImageUrl.js
export const getImageUrl = (filename) => {
  const baseUrl = import.meta.env.VITE_API_URL.replace('/api', '');
  return `${baseUrl}/products/${filename}`;
};
