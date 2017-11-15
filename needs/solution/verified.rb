require 'base64'
require 'pry'
require 'encrypto_signo'
string = 'PiBCbGVzcyB1cC4geER6ZExwN3NlNW0vR2Y4QXNlZHVLSVlWcW9aZG9leUtr\nMlI2ZTJHSVlWOD0geW91ciBrZXktLWs5L0paUlo2TE9oR1ltcUlJZVNpSENV\nbldLZWRMRnFkbHRuOEFIRXJmMzBab1F0YUFRaitaUC8xemZMLwpQNFY2c1JJ\nUGx6UjQ1akR0TXRPUFEySk83OStVbEV4eG51UzFuSnJsUVlwS014dzFxRWs3\nQW5zMnF3eTIKZWI5NGZ3RmFYNXZVZFJ3c2UrVi95blE5QTQ3TlB2dlBiYnV5\nY2VoZ1BQZkcxUUVoV2V3PQo=\n'

no_new_lines = string.gsub('\n', '')
public_key = File.read('real_public')
string, signature = Base64.decode64(no_new_lines).split('--')
p string
p signature
p EncryptoSigno.verify(public_key, signature, string)
