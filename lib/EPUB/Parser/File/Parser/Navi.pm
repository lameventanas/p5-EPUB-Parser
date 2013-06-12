package EPUB::Parser::File::Parser::Navi;
use strict;
use warnings;
use Carp;
use base 'EPUB::Parser::File::Parser';

sub new {
    my $class = shift;

    my $self = $class->SUPER::new(@_);
    $self->set_namespace;

    return $self;
}

sub set_namespace {
    my $self = shift;
    $self->set_xhtml_namespace;
}

sub set_xhtml_namespace {
    my $self = shift;

    my $xhtml_ns = $self->{doc}->documentElement()->getAttribute('xmlns');
    $self->{parser}->registerNs( xhtml => $xhtml_ns );
}

sub in_toc { shift->context_node( 'toc' ) }

1;

