import 'dart:async';
import 'package:oauth2/oauth2.dart';

class PetFinderClient {
  final String _clientId = 'gvzhsqlRYJZ8CIxfYG60swbWvS8B4dVMQK8DQ39r1Zkqa043Gv';
  final String _clientSecret = 'atu6mkvUCSA0YBWr9roHYvjpPVX3qdjNQnNqJmAM';

  final Uri _authorizationEndpoint =
      Uri.parse('https://api.petfinder.com/v2/oauth2/token');

  Future<Client> _getClient() async {
    return clientCredentialsGrant(
      _authorizationEndpoint,
      _clientId,
      _clientSecret,
    );
  }

  Future<String> getData(Uri url, {Map<String, String>? headers}) async {
    Client client = await _getClient();
    return client.read(url, headers: headers);
  }
}
