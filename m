Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3833B297A8A
	for <lists.iommu@lfdr.de>; Sat, 24 Oct 2020 05:40:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3B44F8748B;
	Sat, 24 Oct 2020 03:40:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hdNGrWog9vsw; Sat, 24 Oct 2020 03:40:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3FFB087484;
	Sat, 24 Oct 2020 03:40:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2133DC0051;
	Sat, 24 Oct 2020 03:40:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 72DFEC0051
 for <iommu@lists.linux-foundation.org>; Sat, 24 Oct 2020 03:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6493387440
 for <iommu@lists.linux-foundation.org>; Sat, 24 Oct 2020 03:07:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZDjwUyvcpqji for <iommu@lists.linux-foundation.org>;
 Sat, 24 Oct 2020 03:07:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id BE8AD8723E
 for <iommu@lists.linux-foundation.org>; Sat, 24 Oct 2020 03:07:17 +0000 (UTC)
Received: by mail-il1-f200.google.com with SMTP id r12so3139614iln.3
 for <iommu@lists.linux-foundation.org>; Fri, 23 Oct 2020 20:07:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=+f5KaRkMNp2H9YTKaVRIxMmnVKmfIt7q48LvCaRF0Ns=;
 b=NWgGhAVxMX/2hoEPN3LFgNFvrddXn9xTAluqJpKMw1+/kuelVqIjMaGQq9kXChujtj
 8dI0/HOb3OcDCdKDqtOpt4UKOTbse14Fe7g0c3XaLbI6DNN2LYU3VTR5xnESxq969JKU
 oBR+Y65tr4lVc2ITGyj8K6JpJnP24UHJF2Fvsfm4Xuj7Fmi0wrWUCBp1S/YS/kbk7CL9
 IUlAKAP5qa/g86cBLFR/YxTs6aTUu0Cw6EYGjHrHFXYnwFuaErh6TPp2uIqApiUtFx4G
 SbRHNKcDdBBJv5RdMTS8Axx4L7kDsCmmM/df+K3x7c6wX6Qz6zJxlvxZNrd3CKnxt62E
 t6aQ==
X-Gm-Message-State: AOAM533wl9XDowYH4uWsbBzAeQ85HhLGfa7MJTvaYsTGP5RaEtr7v6st
 /4SWqISYLJUvzeXVwNijf8yd3nHNEZF534wr95ulxvLcJahv
X-Google-Smtp-Source: ABdhPJyX5CGjMWLoP15isE4qEaNneI+lMoj529yEcMzeMQUaUvz6w9wzt3J5qhiARVu2523YJ/lzwBOs4QaY8mpAEsQOou9UfSXn
MIME-Version: 1.0
X-Received: by 2002:a5e:9618:: with SMTP id a24mr4169239ioq.27.1603508837084; 
 Fri, 23 Oct 2020 20:07:17 -0700 (PDT)
Date: Fri, 23 Oct 2020 20:07:17 -0700
In-Reply-To: <000000000000335adc05b23300f6@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a0f8a305b261fe4a@google.com>
Subject: Re: WARNING in dma_map_page_attrs
From: syzbot <syzbot+34dc2fea3478e659af01@syzkaller.appspotmail.com>
To: christian.koenig@amd.com, dri-devel@lists.freedesktop.org, hch@lst.de, 
 iommu@lists.linux-foundation.org, linaro-mm-sig-owner@lists.linaro.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, m.szyprowski@samsung.com, netdev@vger.kernel.org, 
 robin.murphy@arm.com, sumit.semwal@linaro.org, 
 syzkaller-bugs@googlegroups.com
X-Mailman-Approved-At: Sat, 24 Oct 2020 03:40:03 +0000
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development issues for Linux IOMMU support
 <iommu.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu@lists.linux-foundation.org>
List-Help: <mailto:iommu-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

syzbot has found a reproducer for the following issue on:

HEAD commit:    3cb12d27 Merge tag 'net-5.10-rc1' of git://git.kernel.org/..
git tree:       net
console output: https://syzkaller.appspot.com/x/log.txt?x=13125390500000
kernel config:  https://syzkaller.appspot.com/x/.config?x=46c6fea3eb827ae1
dashboard link: https://syzkaller.appspot.com/bug?extid=34dc2fea3478e659af01
compiler:       gcc (GCC) 10.1.0-syz 20200507
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16858664500000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11f402ef900000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+34dc2fea3478e659af01@syzkaller.appspotmail.com

netdevsim netdevsim0 netdevsim1: set [1, 0] type 2 family 0 port 6081 - 0
netdevsim netdevsim0 netdevsim2: set [1, 0] type 2 family 0 port 6081 - 0
netdevsim netdevsim0 netdevsim3: set [1, 0] type 2 family 0 port 6081 - 0
infiniband syz2: set active
infiniband syz2: added macvlan0
------------[ cut here ]------------
WARNING: CPU: 1 PID: 8488 at kernel/dma/mapping.c:149 dma_map_page_attrs+0x493/0x700 kernel/dma/mapping.c:149
Modules linked in:
CPU: 1 PID: 8488 Comm: syz-executor144 Not tainted 5.9.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:dma_map_page_attrs+0x493/0x700 kernel/dma/mapping.c:149
Code: 80 3c 10 00 0f 85 ed 01 00 00 48 8b 1d 86 38 e9 0c e9 2d fc ff ff 48 89 c3 e9 d1 fd ff ff e8 04 11 12 00 0f 0b e8 fd 10 12 00 <0f> 0b 49 c7 c4 ff ff ff ff e9 d5 fd ff ff e8 ea 10 12 00 48 8d 7b
RSP: 0018:ffffc90000fdec68 EFLAGS: 00010293
RAX: 0000000000000000 RBX: ffffffff894d1060 RCX: ffffffff815df1e3
RDX: ffff8880208c1a40 RSI: ffffffff815df5b3 RDI: ffff8880196f8b00
RBP: ffff88801412d800 R08: 0000000000000002 R09: 0000000000000000
R10: 0000000000000002 R11: 0000000000000000 R12: ffffea0000504b40
R13: ffff8880196f86e8 R14: 00000000000008b8 R15: 0000000000000002
FS:  0000000001b26880(0000) GS:ffff8880b9f00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000200002c0 CR3: 0000000022446000 CR4: 00000000001506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 dma_map_single_attrs include/linux/dma-mapping.h:279 [inline]
 ib_dma_map_single include/rdma/ib_verbs.h:3967 [inline]
 ib_mad_post_receive_mads+0x23f/0xd60 drivers/infiniband/core/mad.c:2715
 ib_mad_port_start drivers/infiniband/core/mad.c:2862 [inline]
 ib_mad_port_open drivers/infiniband/core/mad.c:3016 [inline]
 ib_mad_init_device+0x72b/0x1400 drivers/infiniband/core/mad.c:3092
 add_client_context+0x405/0x5e0 drivers/infiniband/core/device.c:680
 enable_device_and_get+0x1d5/0x3c0 drivers/infiniband/core/device.c:1301
 ib_register_device drivers/infiniband/core/device.c:1376 [inline]
 ib_register_device+0x7a7/0xa40 drivers/infiniband/core/device.c:1335
 rxe_register_device+0x46d/0x570 drivers/infiniband/sw/rxe/rxe_verbs.c:1182
 rxe_add+0x12fe/0x16d0 drivers/infiniband/sw/rxe/rxe.c:247
 rxe_net_add+0x8c/0xe0 drivers/infiniband/sw/rxe/rxe_net.c:507
 rxe_newlink drivers/infiniband/sw/rxe/rxe.c:269 [inline]
 rxe_newlink+0xb7/0xe0 drivers/infiniband/sw/rxe/rxe.c:250
 nldev_newlink+0x30e/0x540 drivers/infiniband/core/nldev.c:1555
 rdma_nl_rcv_msg+0x367/0x690 drivers/infiniband/core/netlink.c:195
 rdma_nl_rcv_skb drivers/infiniband/core/netlink.c:239 [inline]
 rdma_nl_rcv+0x2f2/0x440 drivers/infiniband/core/netlink.c:259
 netlink_unicast_kernel net/netlink/af_netlink.c:1304 [inline]
 netlink_unicast+0x533/0x7d0 net/netlink/af_netlink.c:1330
 netlink_sendmsg+0x856/0xd90 net/netlink/af_netlink.c:1919
 sock_sendmsg_nosec net/socket.c:651 [inline]
 sock_sendmsg+0xcf/0x120 net/socket.c:671
 ____sys_sendmsg+0x6e8/0x810 net/socket.c:2353
 ___sys_sendmsg+0xf3/0x170 net/socket.c:2407
 __sys_sendmsg+0xe5/0x1b0 net/socket.c:2440
 do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x443699
Code: 18 89 d0 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 0f 83 db 0d fc ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007ffc067db418 EFLAGS: 00000246 ORIG_RAX: 000000000000002e
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 0000000000443699
RDX: 0000000000000000 RSI: 00000000200002c0 RDI: 0000000000000003
RBP: 00007ffc067db420 R08: 0000000001bbbbbb R09: 0000000001bbbbbb
R10: 0000000000000000 R11: 0000000000000246 R12: 00007ffc067db430
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
