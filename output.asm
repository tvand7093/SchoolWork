
gcd:     file format elf64-x86-64


Disassembly of section .init:

00000000004004b0 <_init>:
  4004b0:	48 83 ec 08          	sub    $0x8,%rsp
  4004b4:	48 8b 05 3d 0b 20 00 	mov    0x200b3d(%rip),%rax        # 600ff8 <_DYNAMIC+0x1d0>
  4004bb:	48 85 c0             	test   %rax,%rax
  4004be:	74 05                	je     4004c5 <_init+0x15>
  4004c0:	e8 5b 00 00 00       	callq  400520 <__gmon_start__@plt>
  4004c5:	48 83 c4 08          	add    $0x8,%rsp
  4004c9:	c3                   	retq   

Disassembly of section .plt:

00000000004004d0 <write@plt-0x10>:
  4004d0:	ff 35 32 0b 20 00    	pushq  0x200b32(%rip)        # 601008 <_GLOBAL_OFFSET_TABLE_+0x8>
  4004d6:	ff 25 34 0b 20 00    	jmpq   *0x200b34(%rip)        # 601010 <_GLOBAL_OFFSET_TABLE_+0x10>
  4004dc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004004e0 <write@plt>:
  4004e0:	ff 25 32 0b 20 00    	jmpq   *0x200b32(%rip)        # 601018 <_GLOBAL_OFFSET_TABLE_+0x18>
  4004e6:	68 00 00 00 00       	pushq  $0x0
  4004eb:	e9 e0 ff ff ff       	jmpq   4004d0 <_init+0x20>

00000000004004f0 <__stack_chk_fail@plt>:
  4004f0:	ff 25 2a 0b 20 00    	jmpq   *0x200b2a(%rip)        # 601020 <_GLOBAL_OFFSET_TABLE_+0x20>
  4004f6:	68 01 00 00 00       	pushq  $0x1
  4004fb:	e9 d0 ff ff ff       	jmpq   4004d0 <_init+0x20>

0000000000400500 <read@plt>:
  400500:	ff 25 22 0b 20 00    	jmpq   *0x200b22(%rip)        # 601028 <_GLOBAL_OFFSET_TABLE_+0x28>
  400506:	68 02 00 00 00       	pushq  $0x2
  40050b:	e9 c0 ff ff ff       	jmpq   4004d0 <_init+0x20>

0000000000400510 <__libc_start_main@plt>:
  400510:	ff 25 1a 0b 20 00    	jmpq   *0x200b1a(%rip)        # 601030 <_GLOBAL_OFFSET_TABLE_+0x30>
  400516:	68 03 00 00 00       	pushq  $0x3
  40051b:	e9 b0 ff ff ff       	jmpq   4004d0 <_init+0x20>

0000000000400520 <__gmon_start__@plt>:
  400520:	ff 25 12 0b 20 00    	jmpq   *0x200b12(%rip)        # 601038 <_GLOBAL_OFFSET_TABLE_+0x38>
  400526:	68 04 00 00 00       	pushq  $0x4
  40052b:	e9 a0 ff ff ff       	jmpq   4004d0 <_init+0x20>

0000000000400530 <exit@plt>:
  400530:	ff 25 0a 0b 20 00    	jmpq   *0x200b0a(%rip)        # 601040 <_GLOBAL_OFFSET_TABLE_+0x40>
  400536:	68 05 00 00 00       	pushq  $0x5
  40053b:	e9 90 ff ff ff       	jmpq   4004d0 <_init+0x20>

Disassembly of section .text:

0000000000400540 <_start>:
  400540:	31 ed                	xor    %ebp,%ebp
  400542:	49 89 d1             	mov    %rdx,%r9
  400545:	5e                   	pop    %rsi
  400546:	48 89 e2             	mov    %rsp,%rdx
  400549:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  40054d:	50                   	push   %rax
  40054e:	54                   	push   %rsp
  40054f:	49 c7 c0 10 09 40 00 	mov    $0x400910,%r8
  400556:	48 c7 c1 a0 08 40 00 	mov    $0x4008a0,%rcx
  40055d:	48 c7 c7 19 08 40 00 	mov    $0x400819,%rdi
  400564:	e8 a7 ff ff ff       	callq  400510 <__libc_start_main@plt>
  400569:	f4                   	hlt    
  40056a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400570 <deregister_tm_clones>:
  400570:	b8 5f 10 60 00       	mov    $0x60105f,%eax
  400575:	55                   	push   %rbp
  400576:	48 2d 58 10 60 00    	sub    $0x601058,%rax
  40057c:	48 83 f8 0e          	cmp    $0xe,%rax
  400580:	48 89 e5             	mov    %rsp,%rbp
  400583:	77 02                	ja     400587 <deregister_tm_clones+0x17>
  400585:	5d                   	pop    %rbp
  400586:	c3                   	retq   
  400587:	b8 00 00 00 00       	mov    $0x0,%eax
  40058c:	48 85 c0             	test   %rax,%rax
  40058f:	74 f4                	je     400585 <deregister_tm_clones+0x15>
  400591:	5d                   	pop    %rbp
  400592:	bf 58 10 60 00       	mov    $0x601058,%edi
  400597:	ff e0                	jmpq   *%rax
  400599:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000004005a0 <register_tm_clones>:
  4005a0:	b8 58 10 60 00       	mov    $0x601058,%eax
  4005a5:	55                   	push   %rbp
  4005a6:	48 2d 58 10 60 00    	sub    $0x601058,%rax
  4005ac:	48 c1 f8 03          	sar    $0x3,%rax
  4005b0:	48 89 e5             	mov    %rsp,%rbp
  4005b3:	48 89 c2             	mov    %rax,%rdx
  4005b6:	48 c1 ea 3f          	shr    $0x3f,%rdx
  4005ba:	48 01 d0             	add    %rdx,%rax
  4005bd:	48 d1 f8             	sar    %rax
  4005c0:	75 02                	jne    4005c4 <register_tm_clones+0x24>
  4005c2:	5d                   	pop    %rbp
  4005c3:	c3                   	retq   
  4005c4:	ba 00 00 00 00       	mov    $0x0,%edx
  4005c9:	48 85 d2             	test   %rdx,%rdx
  4005cc:	74 f4                	je     4005c2 <register_tm_clones+0x22>
  4005ce:	5d                   	pop    %rbp
  4005cf:	48 89 c6             	mov    %rax,%rsi
  4005d2:	bf 58 10 60 00       	mov    $0x601058,%edi
  4005d7:	ff e2                	jmpq   *%rdx
  4005d9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000004005e0 <__do_global_dtors_aux>:
  4005e0:	80 3d 71 0a 20 00 00 	cmpb   $0x0,0x200a71(%rip)        # 601058 <__TMC_END__>
  4005e7:	75 11                	jne    4005fa <__do_global_dtors_aux+0x1a>
  4005e9:	55                   	push   %rbp
  4005ea:	48 89 e5             	mov    %rsp,%rbp
  4005ed:	e8 7e ff ff ff       	callq  400570 <deregister_tm_clones>
  4005f2:	5d                   	pop    %rbp
  4005f3:	c6 05 5e 0a 20 00 01 	movb   $0x1,0x200a5e(%rip)        # 601058 <__TMC_END__>
  4005fa:	f3 c3                	repz retq 
  4005fc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400600 <frame_dummy>:
  400600:	48 83 3d 18 08 20 00 	cmpq   $0x0,0x200818(%rip)        # 600e20 <__JCR_END__>
  400607:	00 
  400608:	74 1e                	je     400628 <frame_dummy+0x28>
  40060a:	b8 00 00 00 00       	mov    $0x0,%eax
  40060f:	48 85 c0             	test   %rax,%rax
  400612:	74 14                	je     400628 <frame_dummy+0x28>
  400614:	55                   	push   %rbp
  400615:	bf 20 0e 60 00       	mov    $0x600e20,%edi
  40061a:	48 89 e5             	mov    %rsp,%rbp
  40061d:	ff d0                	callq  *%rax
  40061f:	5d                   	pop    %rbp
  400620:	e9 7b ff ff ff       	jmpq   4005a0 <register_tm_clones>
  400625:	0f 1f 00             	nopl   (%rax)
  400628:	e9 73 ff ff ff       	jmpq   4005a0 <register_tm_clones>

000000000040062d <getInt>:
  40062d:	55                   	push   %rbp
  40062e:	48 89 e5             	mov    %rsp,%rbp
  400631:	48 83 ec 30          	sub    $0x30,%rsp
  400635:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  400639:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%rbp)
  400640:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
  400647:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  40064b:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  40064f:	eb 05                	jmp    400656 <getInt+0x29>
  400651:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  400656:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  40065a:	0f b6 00             	movzbl (%rax),%eax
  40065d:	3c 0a                	cmp    $0xa,%al
  40065f:	75 f0                	jne    400651 <getInt+0x24>
  400661:	48 83 6d f0 01       	subq   $0x1,-0x10(%rbp)
  400666:	eb 73                	jmp    4006db <getInt+0xae>
  400668:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  40066c:	0f b6 00             	movzbl (%rax),%eax
  40066f:	3c 20                	cmp    $0x20,%al
  400671:	75 02                	jne    400675 <getInt+0x48>
  400673:	eb 70                	jmp    4006e5 <getInt+0xb8>
  400675:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  400679:	0f b6 00             	movzbl (%rax),%eax
  40067c:	3c 2f                	cmp    $0x2f,%al
  40067e:	7e 0b                	jle    40068b <getInt+0x5e>
  400680:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  400684:	0f b6 00             	movzbl (%rax),%eax
  400687:	3c 39                	cmp    $0x39,%al
  400689:	7e 28                	jle    4006b3 <getInt+0x86>
  40068b:	48 c7 45 f8 24 09 40 	movq   $0x400924,-0x8(%rbp)
  400692:	00 
  400693:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  400697:	ba 0c 00 00 00       	mov    $0xc,%edx
  40069c:	48 89 c6             	mov    %rax,%rsi
  40069f:	bf 01 00 00 00       	mov    $0x1,%edi
  4006a4:	e8 37 fe ff ff       	callq  4004e0 <write@plt>
  4006a9:	bf 00 00 00 00       	mov    $0x0,%edi
  4006ae:	e8 7d fe ff ff       	callq  400530 <exit@plt>
  4006b3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  4006b7:	0f b6 00             	movzbl (%rax),%eax
  4006ba:	0f be c0             	movsbl %al,%eax
  4006bd:	83 e8 30             	sub    $0x30,%eax
  4006c0:	0f af 45 e8          	imul   -0x18(%rbp),%eax
  4006c4:	01 45 ec             	add    %eax,-0x14(%rbp)
  4006c7:	8b 55 e8             	mov    -0x18(%rbp),%edx
  4006ca:	89 d0                	mov    %edx,%eax
  4006cc:	c1 e0 02             	shl    $0x2,%eax
  4006cf:	01 d0                	add    %edx,%eax
  4006d1:	01 c0                	add    %eax,%eax
  4006d3:	89 45 e8             	mov    %eax,-0x18(%rbp)
  4006d6:	48 83 6d f0 01       	subq   $0x1,-0x10(%rbp)
  4006db:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  4006df:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  4006e3:	73 83                	jae    400668 <getInt+0x3b>
  4006e5:	8b 45 ec             	mov    -0x14(%rbp),%eax
  4006e8:	c9                   	leaveq 
  4006e9:	c3                   	retq   

00000000004006ea <makeDecimal>:
  4006ea:	55                   	push   %rbp
  4006eb:	48 89 e5             	mov    %rsp,%rbp
  4006ee:	48 83 ec 20          	sub    $0x20,%rsp
  4006f2:	89 7d ec             	mov    %edi,-0x14(%rbp)
  4006f5:	8b 4d ec             	mov    -0x14(%rbp),%ecx
  4006f8:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
  4006fd:	89 c8                	mov    %ecx,%eax
  4006ff:	f7 e2                	mul    %edx
  400701:	c1 ea 03             	shr    $0x3,%edx
  400704:	89 d0                	mov    %edx,%eax
  400706:	c1 e0 02             	shl    $0x2,%eax
  400709:	01 d0                	add    %edx,%eax
  40070b:	01 c0                	add    %eax,%eax
  40070d:	29 c1                	sub    %eax,%ecx
  40070f:	89 c8                	mov    %ecx,%eax
  400711:	89 45 f8             	mov    %eax,-0x8(%rbp)
  400714:	8b 45 ec             	mov    -0x14(%rbp),%eax
  400717:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
  40071c:	f7 e2                	mul    %edx
  40071e:	89 d0                	mov    %edx,%eax
  400720:	c1 e8 03             	shr    $0x3,%eax
  400723:	89 45 fc             	mov    %eax,-0x4(%rbp)
  400726:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  40072a:	74 0a                	je     400736 <makeDecimal+0x4c>
  40072c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  40072f:	89 c7                	mov    %eax,%edi
  400731:	e8 b4 ff ff ff       	callq  4006ea <makeDecimal>
  400736:	8b 45 f8             	mov    -0x8(%rbp),%eax
  400739:	83 c0 30             	add    $0x30,%eax
  40073c:	88 45 f7             	mov    %al,-0x9(%rbp)
  40073f:	48 8d 45 f7          	lea    -0x9(%rbp),%rax
  400743:	ba 01 00 00 00       	mov    $0x1,%edx
  400748:	48 89 c6             	mov    %rax,%rsi
  40074b:	bf 01 00 00 00       	mov    $0x1,%edi
  400750:	e8 8b fd ff ff       	callq  4004e0 <write@plt>
  400755:	c9                   	leaveq 
  400756:	c3                   	retq   

0000000000400757 <readNumber>:
  400757:	55                   	push   %rbp
  400758:	48 89 e5             	mov    %rsp,%rbp
  40075b:	48 83 ec 30          	sub    $0x30,%rsp
  40075f:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  400766:	00 00 
  400768:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  40076c:	31 c0                	xor    %eax,%eax
  40076e:	48 c7 45 d8 31 09 40 	movq   $0x400931,-0x28(%rbp)
  400775:	00 
  400776:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  40077a:	ba 1a 00 00 00       	mov    $0x1a,%edx
  40077f:	48 89 c6             	mov    %rax,%rsi
  400782:	bf 01 00 00 00       	mov    $0x1,%edi
  400787:	e8 54 fd ff ff       	callq  4004e0 <write@plt>
  40078c:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  400790:	ba 14 00 00 00       	mov    $0x14,%edx
  400795:	48 89 c6             	mov    %rax,%rsi
  400798:	bf 00 00 00 00       	mov    $0x0,%edi
  40079d:	e8 5e fd ff ff       	callq  400500 <read@plt>
  4007a2:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  4007a6:	48 89 c7             	mov    %rax,%rdi
  4007a9:	e8 7f fe ff ff       	callq  40062d <getInt>
  4007ae:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  4007b1:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  4007b4:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  4007b8:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  4007bf:	00 00 
  4007c1:	74 05                	je     4007c8 <readNumber+0x71>
  4007c3:	e8 28 fd ff ff       	callq  4004f0 <__stack_chk_fail@plt>
  4007c8:	c9                   	leaveq 
  4007c9:	c3                   	retq   

00000000004007ca <gcd>:
  4007ca:	55                   	push   %rbp
  4007cb:	48 89 e5             	mov    %rsp,%rbp
  4007ce:	48 83 ec 10          	sub    $0x10,%rsp
  4007d2:	89 7d fc             	mov    %edi,-0x4(%rbp)
  4007d5:	89 75 f8             	mov    %esi,-0x8(%rbp)
  4007d8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  4007db:	3b 45 f8             	cmp    -0x8(%rbp),%eax
  4007de:	76 16                	jbe    4007f6 <gcd+0x2c>
  4007e0:	8b 45 f8             	mov    -0x8(%rbp),%eax
  4007e3:	8b 55 fc             	mov    -0x4(%rbp),%edx
  4007e6:	29 c2                	sub    %eax,%edx
  4007e8:	8b 45 f8             	mov    -0x8(%rbp),%eax
  4007eb:	89 c6                	mov    %eax,%esi
  4007ed:	89 d7                	mov    %edx,%edi
  4007ef:	e8 d6 ff ff ff       	callq  4007ca <gcd>
  4007f4:	eb 21                	jmp    400817 <gcd+0x4d>
  4007f6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  4007f9:	3b 45 f8             	cmp    -0x8(%rbp),%eax
  4007fc:	73 16                	jae    400814 <gcd+0x4a>
  4007fe:	8b 45 fc             	mov    -0x4(%rbp),%eax
  400801:	8b 55 f8             	mov    -0x8(%rbp),%edx
  400804:	29 c2                	sub    %eax,%edx
  400806:	8b 45 fc             	mov    -0x4(%rbp),%eax
  400809:	89 d6                	mov    %edx,%esi
  40080b:	89 c7                	mov    %eax,%edi
  40080d:	e8 b8 ff ff ff       	callq  4007ca <gcd>
  400812:	eb 03                	jmp    400817 <gcd+0x4d>
  400814:	8b 45 fc             	mov    -0x4(%rbp),%eax
  400817:	c9                   	leaveq 
  400818:	c3                   	retq   

0000000000400819 <main>:
  400819:	55                   	push   %rbp
  40081a:	48 89 e5             	mov    %rsp,%rbp
  40081d:	48 83 ec 20          	sub    $0x20,%rsp
  400821:	c6 45 eb 0a          	movb   $0xa,-0x15(%rbp)
  400825:	b8 00 00 00 00       	mov    $0x0,%eax
  40082a:	e8 28 ff ff ff       	callq  400757 <readNumber>
  40082f:	89 45 ec             	mov    %eax,-0x14(%rbp)
  400832:	b8 00 00 00 00       	mov    $0x0,%eax
  400837:	e8 1b ff ff ff       	callq  400757 <readNumber>
  40083c:	89 45 f0             	mov    %eax,-0x10(%rbp)
  40083f:	8b 55 f0             	mov    -0x10(%rbp),%edx
  400842:	8b 45 ec             	mov    -0x14(%rbp),%eax
  400845:	89 d6                	mov    %edx,%esi
  400847:	89 c7                	mov    %eax,%edi
  400849:	e8 7c ff ff ff       	callq  4007ca <gcd>
  40084e:	89 45 f4             	mov    %eax,-0xc(%rbp)
  400851:	48 c7 45 f8 4c 09 40 	movq   $0x40094c,-0x8(%rbp)
  400858:	00 
  400859:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  40085d:	ba 1a 00 00 00       	mov    $0x1a,%edx
  400862:	48 89 c6             	mov    %rax,%rsi
  400865:	bf 01 00 00 00       	mov    $0x1,%edi
  40086a:	e8 71 fc ff ff       	callq  4004e0 <write@plt>
  40086f:	8b 45 f4             	mov    -0xc(%rbp),%eax
  400872:	89 c7                	mov    %eax,%edi
  400874:	e8 71 fe ff ff       	callq  4006ea <makeDecimal>
  400879:	48 8d 45 eb          	lea    -0x15(%rbp),%rax
  40087d:	ba 01 00 00 00       	mov    $0x1,%edx
  400882:	48 89 c6             	mov    %rax,%rsi
  400885:	bf 01 00 00 00       	mov    $0x1,%edi
  40088a:	e8 51 fc ff ff       	callq  4004e0 <write@plt>
  40088f:	bf 00 00 00 00       	mov    $0x0,%edi
  400894:	e8 97 fc ff ff       	callq  400530 <exit@plt>
  400899:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000004008a0 <__libc_csu_init>:
  4008a0:	41 57                	push   %r15
  4008a2:	41 89 ff             	mov    %edi,%r15d
  4008a5:	41 56                	push   %r14
  4008a7:	49 89 f6             	mov    %rsi,%r14
  4008aa:	41 55                	push   %r13
  4008ac:	49 89 d5             	mov    %rdx,%r13
  4008af:	41 54                	push   %r12
  4008b1:	4c 8d 25 58 05 20 00 	lea    0x200558(%rip),%r12        # 600e10 <__frame_dummy_init_array_entry>
  4008b8:	55                   	push   %rbp
  4008b9:	48 8d 2d 58 05 20 00 	lea    0x200558(%rip),%rbp        # 600e18 <__init_array_end>
  4008c0:	53                   	push   %rbx
  4008c1:	4c 29 e5             	sub    %r12,%rbp
  4008c4:	31 db                	xor    %ebx,%ebx
  4008c6:	48 c1 fd 03          	sar    $0x3,%rbp
  4008ca:	48 83 ec 08          	sub    $0x8,%rsp
  4008ce:	e8 dd fb ff ff       	callq  4004b0 <_init>
  4008d3:	48 85 ed             	test   %rbp,%rbp
  4008d6:	74 1e                	je     4008f6 <__libc_csu_init+0x56>
  4008d8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  4008df:	00 
  4008e0:	4c 89 ea             	mov    %r13,%rdx
  4008e3:	4c 89 f6             	mov    %r14,%rsi
  4008e6:	44 89 ff             	mov    %r15d,%edi
  4008e9:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  4008ed:	48 83 c3 01          	add    $0x1,%rbx
  4008f1:	48 39 eb             	cmp    %rbp,%rbx
  4008f4:	75 ea                	jne    4008e0 <__libc_csu_init+0x40>
  4008f6:	48 83 c4 08          	add    $0x8,%rsp
  4008fa:	5b                   	pop    %rbx
  4008fb:	5d                   	pop    %rbp
  4008fc:	41 5c                	pop    %r12
  4008fe:	41 5d                	pop    %r13
  400900:	41 5e                	pop    %r14
  400902:	41 5f                	pop    %r15
  400904:	c3                   	retq   
  400905:	66 66 2e 0f 1f 84 00 	data32 nopw %cs:0x0(%rax,%rax,1)
  40090c:	00 00 00 00 

0000000000400910 <__libc_csu_fini>:
  400910:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000400914 <_fini>:
  400914:	48 83 ec 08          	sub    $0x8,%rsp
  400918:	48 83 c4 08          	add    $0x8,%rsp
  40091c:	c3                   	retq   
