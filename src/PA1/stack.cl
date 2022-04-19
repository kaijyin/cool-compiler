(*
 *  CS164 Fall 94
 *
 *  Programming Assignment 1
 *    Implementation of a simple stack machine.
 *
 *  Skeleton file
 e
e
1
+
2
s
d
e
e
d
e
+
1
s
s
s
d
e
e
s
e
e
e
d
x
 *)

class Node{
    next:Node;
    value:String;
    init(val:String,nxt:Node):Node{
     {
         value <- val;
         next <- nxt;
         self;
     }
    };
    nextNode():Node{
       next
    };
    getvalue():String{
       value
    };
};
class BaseStack{
    push(value:String):Object{self};
    pop():Object{self};
};
class Stack inherits BaseStack{
   head:Node;
   io:IO<-(new IO);
   a2i:A2I<-(new A2I);
   push(value:String):Object{
      {
         head<-(new Node).init(value,head);
         self;
      }
   };
   pop():Object{
     {
        head <- head.nextNode();
        self;
     }
   };
   display():Object{
      let cur:Node<-head in{
         while(not isvoid cur)loop
         {
            io.out_string(cur.getvalue().concat("\n"));
            cur<-cur.nextNode();                        
         }
         pool;
         self;
      }
   };
   eval():Object{
   if not isvoid head then{
      if not isvoid head.nextNode() then{
      let cmd : String <- head.getvalue() in{
      pop();
      if cmd="s" then {
          let i:String,j:String in{
             i<-head.getvalue();
             pop();
             j<-head.getvalue();
             pop();
             push(i);
             push(j);
          };
      }else if cmd="+" then{
          let i:String,j:String in{
             i<-head.getvalue();
             pop();
             j<-head.getvalue();
             pop();
             push(a2i.i2a(a2i.a2i(j)+a2i.a2i(i)));
             };
      }else 0 fi fi;
     };
     }else 0 fi;
   }else 0 fi
   }; 
};
class Main inherits IO {
   stack:Stack <- (new Stack);
   main() : Object {
      let end:Bool<-false in{
         while(not end)loop{
            let io:IO<-out_string(">"),char:String<-in_string() in{
               if char="e" then{
                  stack.eval();
               }else if char="d" then{
                  stack.display();
               }else if char="x" then{
                  end<-true;
               }else{
                   stack.push(char);
               } fi fi fi;
            }; 
         }pool;
      }
   }; 
};

