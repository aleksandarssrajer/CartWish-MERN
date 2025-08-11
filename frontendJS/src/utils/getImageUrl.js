export const getImageUrl = (filename, type = 'products') => {
  if (!filename) return ''; // safety check
  // Samo vrati relativnu putanju. Browser će uraditi ostalo.
  return `/${type}/${filename}`;
};