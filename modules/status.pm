#------------------------------------------------------------------------
# status
#------------------------------------------------------------------------

package status;
use strict;

sub scan(&$$) {
    my ($callback,$message,$who)=@_;
    
    if ($message =~ /^statu?s/) {
        my $upString = &::timeToString(time()-$::startTime);
        my $eTime = &::get("is", "the qEpochDate");
        $callback->("Since $::setup_time, there have been $::updateCount " 
                . "modifications and $::questionCount questions.  " 
                . "I have been awake for $upString this session, "
                . "and currently reference $::factoidCount factoids. "
                . "Addressing is in ".lc(::getparam('addressing'))." mode.");
    }
    return undef;
}

"status";
