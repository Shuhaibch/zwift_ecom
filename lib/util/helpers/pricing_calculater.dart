class CPricingCalculator {
  //* calculate Price based on tax and Shipping
  static double calculateTotalPrice(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice + taxRate;

    double shippingCost = getShippingCost(location);

    double totalPrice = productPrice + taxAmount + shippingCost;
    return totalPrice;
  }

  //* calculate shipping Cost

  static String calculateShippingCost(double productPrice, String location) {
    double shippingCost = getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
  }

  //* Calculate Tax
  static String calculateTax(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    return taxAmount.toStringAsFixed(2);
  }

  static double getTaxRateForLocation(String location) {
    // Look the tax rate for the given location from a tax rate database or API.
    // Return Appropriate tax rate.
    return 0.10; // For eg tax rate is 10%
  }

  static double getShippingCost(String location) {
    // Look the Shipping Cost for the given location from a tax rate database or API.
    // Calculate the Shipping cost based on various factors like distance, weight, etc.
    return 5.00; // for eg shipping cost is $5
  }

  //* sum all cart total and return Total Amount
  // static double calculateCartTotal(CartModel cart) {
  //   return cart.items.map((e) => e.price).fold(0,
  //       (previousPrice, currentPrice) => previousPrice + (currentPrice ?? 0));
  // }
}
