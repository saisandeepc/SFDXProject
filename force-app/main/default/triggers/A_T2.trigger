trigger A_T2 on Account (before insert,before update) {
For(Account A : Trigger.new){
if(A.industry == 'education')
A.adderror('We are no more working with education Industry');
}

}