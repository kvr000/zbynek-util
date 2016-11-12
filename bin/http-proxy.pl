#!/usr/bin/env perl

use strict;
use warnings;

use HTTP::Proxy;
use HTTP::Proxy::Engine::ScoreBoard;
use HTTP::Proxy::BodyFilter;
use HTTP::Proxy::HeaderFilter;
use Data::Dumper;


package main;

my $proxy = HTTP::Proxy->new(host => undef, port => 9080, engine => 'ScoreBoard');
$proxy->start();
