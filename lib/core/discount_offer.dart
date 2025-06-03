double calculatePercentage(int mrp, int salePrice) {
  if (mrp <= 0) return 0;
  double discount = ((mrp - salePrice) / mrp) * 100;
  return discount;
}
