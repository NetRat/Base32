#include "Base32.h"

Base32 base32;

boolean tests()
{
  String encoded, decoded = "";
  char* tempEncoded = NULL;
  char* tempDecoded = NULL;
  
  //          encoding               decoding
  char enc0[] = "";        char dec0[] = "";
  char enc1[] = "f";       char dec1[] = "MY======";
  char enc2[] = "fo";      char dec2[] = "MZXQ====";
  char enc3[] = "foo";     char dec3[] = "MZXW6===";
  char enc4[] = "foob";    char dec4[] = "MZXW6YQ=";
  char enc5[] = "fooba";   char dec5[] = "MZXW6YTB";
  char enc6[] = "foobar";  char dec6[] = "MZXW6YTBOI======";

  encoded = base32.toBase32String(enc0, sizeof(enc0) - 1, true);
  tempEncoded = (char*)calloc(encoded.length() + 1, sizeof(char));   encoded.toCharArray(tempEncoded, encoded.length() + 1);    
  decoded = base32.fromBase32String(dec0, sizeof(dec0) - 1);
  tempDecoded = (char*)calloc(decoded.length() + 1, sizeof(char));   decoded.toCharArray(tempDecoded, decoded.length() + 1);
  if (strcmp(tempEncoded, dec0) == 0 && strcmp(tempDecoded, enc0) == 0) {} else { return false; }
  free(tempEncoded);
  free(tempDecoded);

  encoded = base32.toBase32String(enc1, sizeof(enc1) - 1, true);
  tempEncoded = (char*)calloc(encoded.length() + 1, sizeof(char));   encoded.toCharArray(tempEncoded, encoded.length() + 1);
  decoded = base32.fromBase32String(dec1, sizeof(dec1) - 1);
  tempDecoded = (char*)calloc(decoded.length() + 1, sizeof(char));   decoded.toCharArray(tempDecoded, decoded.length() + 1);
  if (strcmp(tempEncoded, dec1) == 0 && strcmp(tempDecoded, enc1) == 0) {} else { return false; }
  free(tempEncoded);
  free(tempDecoded);

  encoded = base32.toBase32String(enc2, sizeof(enc2) - 1, true);
  tempEncoded = (char*)calloc(encoded.length() + 1, sizeof(char));   encoded.toCharArray(tempEncoded, encoded.length() + 1);
  decoded = base32.fromBase32String(dec2, sizeof(dec2) - 1);
  tempDecoded = (char*)calloc(decoded.length() + 1, sizeof(char));   decoded.toCharArray(tempDecoded, decoded.length() + 1);
  if (strcmp(tempEncoded, dec2) == 0 && strcmp(tempDecoded, enc2) == 0) {} else { return false; }
  free(tempEncoded);
  free(tempDecoded);

  encoded = base32.toBase32String(enc3, sizeof(enc3) - 1, true);
  tempEncoded = (char*)calloc(encoded.length() + 1, sizeof(char));   encoded.toCharArray(tempEncoded, encoded.length() + 1);
  decoded = base32.fromBase32String(dec3, sizeof(dec3) - 1);
  tempDecoded = (char*)calloc(decoded.length() + 1, sizeof(char));   decoded.toCharArray(tempDecoded, decoded.length() + 1);
  if (strcmp(tempEncoded, dec3) == 0 && strcmp(tempDecoded, enc3) == 0) {} else { return false; }
  free(tempEncoded);
  free(tempDecoded);

  encoded = base32.toBase32String(enc4, sizeof(enc4) - 1, true);
  tempEncoded = (char*)calloc(encoded.length() + 1, sizeof(char));   encoded.toCharArray(tempEncoded, encoded.length() + 1);
  decoded = base32.fromBase32String(dec4, sizeof(dec4) - 1);
  tempDecoded = (char*)calloc(decoded.length() + 1, sizeof(char));   decoded.toCharArray(tempDecoded, decoded.length() + 1);
  if (strcmp(tempEncoded, dec4) == 0 && strcmp(tempDecoded, enc4) == 0) {} else { return false; }
  free(tempEncoded);
  free(tempDecoded);

  encoded = base32.toBase32String(enc5, sizeof(enc5) - 1, true);
  tempEncoded = (char*)calloc(encoded.length() + 1, sizeof(char));   encoded.toCharArray(tempEncoded, encoded.length() + 1);
  decoded = base32.fromBase32String(dec5, sizeof(dec5) - 1);
  tempDecoded = (char*)calloc(decoded.length() + 1, sizeof(char));   decoded.toCharArray(tempDecoded, decoded.length() + 1);
  if (strcmp(tempEncoded, dec5) == 0 && strcmp(tempDecoded, enc5) == 0) {} else { return false; }
  free(tempEncoded);
  free(tempDecoded);
  
  encoded = base32.toBase32String(enc6, sizeof(enc6) - 1, true);
  tempEncoded = (char*)calloc(encoded.length() + 1, sizeof(char));   encoded.toCharArray(tempEncoded, encoded.length() + 1);
  decoded = base32.fromBase32String(dec6, sizeof(dec6) - 1);
  tempDecoded = (char*)calloc(decoded.length() + 1, sizeof(char));   decoded.toCharArray(tempDecoded, decoded.length() + 1);
  if (strcmp(tempEncoded, dec6) == 0 && strcmp(tempDecoded, enc6) == 0) {} else { return false; }
  free(tempEncoded);
  free(tempDecoded);

  return true;
}

void setup()
{
  pinMode(13, OUTPUT);
  digitalWrite(13, LOW);
  
  if (tests() == true) { digitalWrite(13, HIGH); } // if tests passed, then on-board LED is on
}

void loop()
{
}

