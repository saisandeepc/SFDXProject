@isTest 
public class TestAddtoSFDC99 {
static testMethod void sfdc99(){
contact C = new contact ();
 C .FirstName = 'Joe';
    C .LastName  = 'Montana';
    insert C ;

}
}