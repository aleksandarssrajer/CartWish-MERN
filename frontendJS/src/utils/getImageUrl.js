export const getImageUrl = (filename, type = 'products') => {
  if (!filename) return ''; // safety check
  
  // const baseUrl = 'http://localhost:5000/api';
  return `/static/${type}/${filename}`;
};