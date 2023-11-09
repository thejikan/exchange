enum IconsEnum {
  //Generics
  waves(urlName: "waves.svg", label: "waves"),
  wallet(urlName: "wallet.svg", label: "wallet"),
  solana(urlName: 'solana.svg', label: 'solana'),
  ripple(urlName: 'ripple.svg', label: 'ripple'),
  launchpads(urlName: 'launchpads.svg', label: 'launchpads'),
  increase(urlName: "increase.svg", label: "increase"),

  exchange(urlName: "exchange.svg", label: "exchange"),
  ethereum(urlName: "ethereum.svg", label: "ethereum"),
  eShop(urlName: "eShop.svg", label: "EShop"),
  decrese(urlName: "decrese.svg", label: "decrese"),
  cardano(urlName: "cardano.svg", label: "cardano"),
  bitcoin(urlName: "bitcoin.svg", label: "bitcoin"),
  binanceCoin(label: "Binance Coin", urlName: "binanceCoin.svg"),
  metaverse(label: "Metaverse", urlName: "planet.svg")
  ;

  const IconsEnum({
    required this.urlName,
    required this.label,
  });

  final String urlName;
  final String label;
}
