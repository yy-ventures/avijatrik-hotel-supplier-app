class SupplierBidSubmitPayload {
  SupplierBidSubmitPayload({
    required this.bidId,
    required this.discountedPrice,
    required this.roomId,
    required this.numberOfRooms,
    this.description,
    this.note,
  });

  int bidId;
  int discountedPrice;
  int roomId;
  int numberOfRooms;
  String? description;
  String? note;
}
