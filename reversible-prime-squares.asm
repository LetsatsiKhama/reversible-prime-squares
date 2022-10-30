.data 
	msg: .asciiz"This are the reversable prime squares"
	space:.asciiz"\n"
.text
    main: 
		jal reverse_sqr                                  # CALL_PROCEDDURE
	reverse_sqr:
		addi $s0,$0,0                                    #b= 0
		addi $s1,$s0,1                                   #count =1
		for:
			addi $s2,$s0,3                               #i =3
			ble $s2,0,exit                               #if
			
			add $s2,$s2,1                                # i++
			j for1
			for1:
				addi$s3,$0,2                             # j=2
				div $s4,$s2,2                            # j=i/2
				bgt $s3,$s4,for
				
				add $s3,$s3,1
				j if1
				if1:
					rem $s5,$s2,$s3                       # S5=i%j
					bne $s5,0,for1
					addi $s0,$0,1                         # b=1
					j if
			if:
				mul $s6,$s2,$s2                           # long prime2 =i*i%j
				addi $s7,$0,0
				bne $s0,0,for1
				j while
				while:
					beq $s6,0,for1
					rem $t0,$s6,10                         #remander= prime1%10
					mul $t1,$s7,10
					add $t1,$t1,$s6                        #reversed = reversed+remander
					div $s6,$s6,10
					j if3
				if3:
					beq $s6,$s7 for1                       #branch if equal
					add $s1,$s1,1                           #count++
					j for2
					
					for2:
					    addi $s0,$s0,1                     #counter =1
					    addi $t7,$0,0                      #c=0 
						addi $t2,$0,3                      #p =3
						ble $t2,0,if3                       #_if
						
						add $t2,$t2,1                      # p++
						j for3
						for3:
							addi$t3,$0,2                   # q=2
							div $t4,$t2,2                  # q=p/2
							bgt $t3,$t4,for3               #
							
							add $t3,$t3,1
							j if4
							if4:
								rem $t5,$t2,$t3            # S5=i%j
								bne $t5,0,for3
								addi $t7,$0,1              # c=1
								j if5
						if6:
						    
							mul $t6,$t2,$t2                # long prime2 =p*p
							bne $t7,0,for3                 # branch if not equal
							addi $s0,$0,1                  #counter++
							j if5
							if5:
								bne $t6,$t1,for3
								jal print
								j if8
					addi $t7,$0,0                           #c=0
					if8:
						bne $s0,1000,for2
						j if7
		if7:
			bne $s1,1000,for
	exit:
	li $v0,,4
	la $a0,space
	syscall
	print:
		li $v0,1
		add $a0,$t0,$zero
		syscall
		
		li $v0,4
		la $a0,space
		syscall
		jr $ra
