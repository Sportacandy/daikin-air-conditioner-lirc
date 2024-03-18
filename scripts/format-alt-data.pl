#!/usr/bin/perl

while (<>) {
  next if /^ {1,2}[0-9]/;
  next if /^\s*$/;
  s/ *[0-9]+-pulse//;
  print;
}
