public class AssignmentForTestClass{
        Public String name1;
        public String name2;

        public void resetName(){
                if(name1 == 'Test1'){
                        processTest1(name1);
                }else if(name1 == 'Test2'){
                        if(name2 == 'Test3'){
                                name1 = name2;
                                processTest2(name1);
                        }
                }else{
                        Integer a = 10;
                        Integer b = 20;
                        Integer c = a*b;
                }
        }

        public void processTest1(String nm1){
                if(nm1 == 'Test1'){
                        Integer a = 10;
                        Integer b = 20;
                        Integer c = a*b;
                }else if(nm1 == 'Test5'){
                        Integer a = 10;
                        Integer b = 20;
                        Integer c = a*b;
                }else if(nm1 == 'Test'){
                        Integer a = 10;
                        Integer b = 20;
                        Integer c = a*b;
                }
        }

        public void processTest2(String nm1){
                if(nm1 == 'Test1'){
                        Integer a = 10;
                        Integer b = 20;
                        Integer c = a*b;
                }else if(nm1 == 'Test5'){
                        Integer a = 10;
                        Integer b = 20;
                        Integer c = a*b;
                }else if(nm1 == 'Test'){
                        Integer a = 10;
                        Integer b = 20;
                        Integer c = a*b;
                }
        }
}