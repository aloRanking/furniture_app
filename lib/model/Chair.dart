
// ignore_for_file: file_names

class Chair{
  String image;
  String title;
  String author;
  String subtitle;
  String price;
  String details;

  Chair(this.image, this.title, this.author, this.subtitle, this.price,
      this.details);
}

List<Chair> chairList = [
   Chair('assets/images/chair1.png', 'Irul Chair', 'Seto', 'Egronomical for human curve',
      '\$102', 'Crafted with the perfect construction by Seto Fabniaz and have a balance egronomical for human body, top quality leather in the back of the rest'),

  Chair('assets/images/chair2.png', 'Amazon Chair', 'Seto', 'Egronomical for human curve',
      '\$202', 'Crafted with the perfect construction by Seto Fabniaz and have a balance egronomical for human body, top quality leather in the back of the rest'),

  Chair('assets/images/chair3.png', 'Corrigan Studio', 'WayFair', 'The Harun chair has a simple and clean look',
      '\$202', 'Corrigan Studio The Harun chair has a simple, clean look that is elevated by unexpected details, such as the single buttonless tufting accents. The slightly flared armrests and metal tapered legs gives this collection an airy, open feel, while the grey fabric and PU upholstery grounds the design and keeps it looking polished and sophisticated. '),

Chair('assets/images/chair4.png', 'Costway Armless', 'Target', ' Crafted from durable and sturdy rubber wood',
      '\$255','Reinforced Sturdy Frame: Crafted from durable and sturdy rubber wood, the chair is promised to have a longer service life and a super strong construction.')


];