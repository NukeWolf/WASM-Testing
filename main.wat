(module
  (memory 1)
  (func (param $n i32) (result i32)
    (local $prime_num i32)
    (local $i i32)
    (local.set $prime_num (i32.const 0))
    (local.set $i (i32.const 2))
    (block 
        (loop
            ;;Check if i is prime
            (call $is_prime
                (local.get $i)
            )
            ;; If Prime, increase the prime num counter
            (i32.const 1)
            (i32.eq)
            (if 
                (then 
                    (local.set $prime_num (i32.add (local.get $prime_num) (i32.const 1))) 
                )
            )
            (br_if 1 (
                i32.eq (local.get $prime_num) (local.get $n)
                
            ))
            (local.set $i (i32.add (local.get $i) (i32.const 1))) 
            (br 0)
        )
    )
    (local.get $i)
  )
  ;;Check if prime
  (func $is_prime (param $n i32) (result i32)
    (local $i i32)
    (local.set $i (i32.const 2))

    (block 
        (loop
            ;; Get Divisor
            local.get $n 
            local.get $i
            i32.rem_u
            ;; Check equal to 0
            i32.const 0
            i32.eq            
            (if 
                (then
                    ;; If it is divisable, return 0
                    i32.const 0
                    return
                )
            )
            ;; Otherwise Increment and continue
            (local.set $i (i32.add (local.get $i) (i32.const 1))) 
            ;; Branch one depth out
            (br_if 1 
                (i32.ge_u
                    (local.get $i)
                    (local.get $n)
                )
            )
            ;; Restart the loop by default
            (br 0)
        )
    )
    ;; Default return true
    (i32.const 1)
  )
  (export "nth_prime" (func 0))
  (export "is_prime" (func 1))
)