(** 如何证明 Applicative 的复合也是 Applicative?
https://www.zhihu.com/question/322126797 **)

Set Implicit Arguments .
Set Contextual Implicit.
Require Import FunctionalExtensionality.
Require Import Basics.

Reserved Notation "f <*> a" (at level 4, left associativity).
Reserved Notation "m =<< a" (at level 1, left associativity).
Check compose.
Definition id : forall {A}, A -> A := fun A x => x.


Class Applicative f : Type :=
  {
    pure : forall {a}, a -> f a;
    ap : forall {a} {b}, f (a -> b) -> f a -> f b 
        where "f <*> a" := (@ap _ _ f a);
    
    identity : forall {A} (a : f A), 
        (pure id) <*> a = a;
    homomorphism : forall {A} {B} (g : A -> B)(x : A), 
        (pure g) <*> (pure x) = pure (g x);
    interchange : forall {A} {B} (u : f (A -> B)) y,
        u <*> (pure y) = (pure (fun g => g y)) <*> u;
    composition : forall {A} {B} {C} (u : f (B -> C)) (v : f (A -> B)) w,
        (pure compose) <*> u <*> v <*> w = u <*> (v <*> w)
  }.


Class Monad m : Type := 
  {
    bind : forall {a} {b}, (a -> m b) -> m a -> m b 
        where "m =<< a" := (@bind _ _ m a);
    assoc : forall {A} {B} {C} (f : A -> m B) (g : B -> m C) (x : m A),
        g =<< (f =<< x) = (compose (bind g) f) =<< x
  }.