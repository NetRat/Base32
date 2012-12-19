/*
  Base32.cpp - Library for encoding to/decoding from Base32.
  Compatible with RFC 4648 ( http://tools.ietf.org/html/rfc4648 )
  Created by Vladimir Tarasow, December 18, 2012.
  Released into the public domain.
*/
#include "Arduino.h"
#include "Base32.h"
#include "stdint.h"

Base32::Base32() 
{
}

String Base32::toBase32String(char* data, long length)
{
  return toBase32String(data, length, false);
}

String Base32::toBase32String(char* data, long length, boolean usePadding)
{
  char base32StandardAlphabet[] = {"ABCDEFGHIJKLMNOPQRSTUVWXYZ234567"};
  char standardPaddingChar = '='; 

  String result = "";
  int count = 0;
  int bufSize = 8;
  
  if (length < 0 || length > 268435456LL) { return ""; }
  
  if (length > 0)
  {
    int buffer = data[0];
    int next = 1;
    int bitsLeft = 8;
    
    while (count < bufSize && (bitsLeft > 0 || next < length))
    {
      if (bitsLeft < 5)
      {
        if (next < length)
        {
          buffer <<= 8;
          buffer |= data[next] & 0xFF;
          next++;
          bitsLeft += 8;
        }
        else
        {
          int pad = 5 - bitsLeft;
          buffer <<= pad;
          bitsLeft += pad;
        }
      }
      int index = 0x1F & (buffer >> (bitsLeft -5));
      bitsLeft -= 5;
      result += base32StandardAlphabet[index];
    }
  }
  
  if (usePadding)
  {
    int pads = (result.length() % 8);
    if (pads > 0)
    {
      pads = (8 - pads);
      for (int i = 0; i < pads; i++) result += '=';
    }
  }
  
  return result;
}

String Base32::fromBase32String(char* data, long length)
{
  String result = "";
  int buffer = 0;
  int bitsLeft = 0;
  int count = 0;
  
  for (int i = 0; i < length; i++)
  {
    char ch = data[i];
    
    // ignoring some characters
    if (ch == ' ' || ch == '\t' || ch == '\r' || ch == '\n' || ch == '=') continue;
    // recovering mistyped
    if (ch == '0') { ch = 'O'; } 
    else if (ch == '1') { ch = 'L'; } 
    else if (ch == '8') { ch = 'B'; }
    
    buffer <<= 5;

    // look up one base32 digit
    if ((ch >= 'A' && ch <= 'Z') || (ch >= 'a' && ch <= 'z'))
    {
        ch = (char)((ch & 0x1F) - 1);
    }
    else if (ch >= '2' && ch <= '7')
    {
        ch -= (char)('2' - 26);
    }
    else
    {
        return "";
    }
    
    buffer |= ch;
    bitsLeft += 5;
    if (bitsLeft >= 8)
    {
      result += (char)((byte)(buffer >> (bitsLeft - 8)) & 0xFF); //
      count++;
      bitsLeft -= 8;
    }
  }
  return result;
}