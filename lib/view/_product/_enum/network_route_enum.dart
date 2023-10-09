enum NetworkRoutes {
  // ignore: constant_identifier_names
  LOGIN,
  REGISTER,
  CARICART,

  CARICARTBYIDUSER,
  POMVARDIMASBYIDUSER,
  MARSATMASBYIDUSER,
  POMVARDIMAS,
  MARSATMAS,
  BUILD_HOME,
  FRIENDS,
  GAME,
  SLIDER
}

extension NetwrokRoutesString on NetworkRoutes {
  String get rawValue {
    switch (this) {
      case NetworkRoutes.LOGIN:
        return 'api/Auth/login';
      case NetworkRoutes.REGISTER:
        return 'api/Auth/register';
      case NetworkRoutes.CARICARTBYIDUSER:
        return 'api/CariCart/getuserfirmano';
      case NetworkRoutes.POMVARDIMASBYIDUSER:
        return 'api/Pomvardimas/getuserfirmano';
      case NetworkRoutes.MARSATMASBYIDUSER:
        return 'api/Marsatmas/getuserfirmano';  
      case NetworkRoutes.CARICART:
        return 'api/CariCart/getall';
      case NetworkRoutes.POMVARDIMAS:
        return 'api/Pomvardimas/getall';
      case NetworkRoutes.MARSATMAS:
        return 'api/Marsatmas/getall';
      case NetworkRoutes.BUILD_HOME:
        return 'house';
      case NetworkRoutes.FRIENDS:
        return 'friends';

      case NetworkRoutes.GAME:
        return 'games';

      case NetworkRoutes.SLIDER:
        return 'slider';
      default:
        throw Exception('Routes Not FouND');
    }
  }
}
