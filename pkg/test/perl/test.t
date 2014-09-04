use lib 'inc';
use TestML;

TestML->new(
    testml => 'test/test.tml',
    bridge => 'TestMLBridge',
)->run;

{
    package TestMLBridge;
    use TestML::Util;
    use Pig::Latin;

    sub convert {
        my ($self, $english) = @_;
        Pig::Latin->new(english => $english->value)->convert;
    }
}
