Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBEA465808
	for <lists.iommu@lfdr.de>; Wed,  1 Dec 2021 21:57:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A820B41CA0;
	Wed,  1 Dec 2021 20:57:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SUIgQ7VDfWjv; Wed,  1 Dec 2021 20:57:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B651541CBC;
	Wed,  1 Dec 2021 20:57:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 897A3C000A;
	Wed,  1 Dec 2021 20:57:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7A263C000A
 for <iommu@lists.linux-foundation.org>; Wed,  1 Dec 2021 18:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 74EB361BEC
 for <iommu@lists.linux-foundation.org>; Wed,  1 Dec 2021 18:18:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DoPZCdkhBb86 for <iommu@lists.linux-foundation.org>;
 Wed,  1 Dec 2021 18:18:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 81C9761BE5
 for <iommu@lists.linux-foundation.org>; Wed,  1 Dec 2021 18:18:22 +0000 (UTC)
Received: by mail-io1-f71.google.com with SMTP id
 k12-20020a0566022a4c00b005ebe737d989so29475494iov.19
 for <iommu@lists.linux-foundation.org>; Wed, 01 Dec 2021 10:18:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=KmGHnus3au4WKakf/x0ccGJ36I1Q4G9nkOFdXChMgyI=;
 b=BS/FRBO0PW3dzr44dunZ6uJPUhk/Vy8dzXWzxGJrTUHOpdGxz56GLETjXzIw6uShwQ
 dV8d+JBVaaHAcbJdx2OkQO0E/C6XmuBFnk//bitQNhhGrcTHJjRReM5s1np19kEY01Rc
 vvWvqZDwJVOFAHwp+u9c5uYgbp9+/xCkTJKL+HYgbmfiKu96legTKrmKuHXIq5sk/enG
 NC6UNEKHldJ7ReNrDbMkCAf4Imz9Sbxoy957KN/rtrFs2O82V6ZYaj+MgkLfnlga3RbB
 7ITtHKzL98xRBoiNPgkYr7iSO7goya5coKjOS5Riv/fSU1NikrVQ5OIPeIRqTU8HZta3
 0eyw==
X-Gm-Message-State: AOAM531jhXVINtzHCKSNZ01HVl6O6QTB85+YwwAWhmldHR8wFjbQcwPv
 0CgRokOx6eEfWVi/nzsq0ex9HU22un8wx4hjy/LzzKbT9ivU
X-Google-Smtp-Source: ABdhPJzzxBSjfCCgWl06pj/98H1jXN8SBT3ib/P63vbsCEnafdEnFiMSCzOq9028jCHqMSBm6Rffmik21G3i+WxGm314Gx6zrhEn
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1ca1:: with SMTP id
 x1mr10308551ill.72.1638382701646; 
 Wed, 01 Dec 2021 10:18:21 -0800 (PST)
Date: Wed, 01 Dec 2021 10:18:21 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f0196305d219b2fe@google.com>
Subject: [syzbot] WARNING in __dma_map_sg_attrs
From: syzbot <syzbot+10e27961f4da37c443b2@syzkaller.appspotmail.com>
To: christian.koenig@amd.com, dri-devel@lists.freedesktop.org, hch@lst.de, 
 iommu@lists.linux-foundation.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 m.szyprowski@samsung.com, robin.murphy@arm.com, sumit.semwal@linaro.org, 
 syzkaller-bugs@googlegroups.com
X-Mailman-Approved-At: Wed, 01 Dec 2021 20:57:31 +0000
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

Hello,

syzbot found the following issue on:

HEAD commit:    c5c17547b778 Merge tag 'net-5.16-rc3' of git://git.kernel...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13a73609b00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=bf85c53718a1e697
dashboard link: https://syzkaller.appspot.com/bug?extid=10e27961f4da37c443b2
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+10e27961f4da37c443b2@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 2 PID: 17169 at kernel/dma/mapping.c:188 __dma_map_sg_attrs+0x181/0x1f0 kernel/dma/mapping.c:188
Modules linked in:
CPU: 0 PID: 17169 Comm: syz-executor.3 Not tainted 5.16.0-rc2-syzkaller #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.14.0-2 04/01/2014
RIP: 0010:__dma_map_sg_attrs+0x181/0x1f0 kernel/dma/mapping.c:188
Code: 00 00 00 00 00 fc ff df 48 c1 e8 03 80 3c 10 00 75 71 4c 8b 3d 70 6d b1 0d e9 db fe ff ff e8 86 ff 12 00 0f 0b e8 7f ff 12 00 <0f> 0b 45 31 e4 e9 54 ff ff ff e8 70 ff 12 00 49 8d 7f 50 48 b8 00
RSP: 0018:ffffc90002c0fb20 EFLAGS: 00010216
RAX: 0000000000013018 RBX: 0000000000000020 RCX: ffffc900037d4000
RDX: 0000000000040000 RSI: ffffffff8163d361 RDI: ffff8880182ae4d0
RBP: ffff8880182ae088 R08: 0000000000000002 R09: ffff888017ba054f
R10: ffffffff8163d242 R11: 000000000008808a R12: 0000000000000000
R13: ffff888024ca5700 R14: 0000000000000001 R15: 0000000000000000
FS:  00007fa269e34700(0000) GS:ffff88802cb00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000000040c120 CR3: 000000006c77c000 CR4: 0000000000150ee0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 dma_map_sgtable+0x70/0xf0 kernel/dma/mapping.c:264
 drm_gem_map_dma_buf+0x12a/0x1e0 drivers/gpu/drm/drm_prime.c:633
 __map_dma_buf drivers/dma-buf/dma-buf.c:675 [inline]
 dma_buf_map_attachment+0x39a/0x5b0 drivers/dma-buf/dma-buf.c:954
 drm_gem_prime_import_dev.part.0+0x85/0x220 drivers/gpu/drm/drm_prime.c:939
 drm_gem_prime_import_dev drivers/gpu/drm/drm_prime.c:982 [inline]
 drm_gem_prime_import+0xc8/0x200 drivers/gpu/drm/drm_prime.c:982
 virtgpu_gem_prime_import+0x49/0x150 drivers/gpu/drm/virtio/virtgpu_prime.c:166
 drm_gem_prime_fd_to_handle+0x21d/0x550 drivers/gpu/drm/drm_prime.c:318
 drm_prime_fd_to_handle_ioctl+0x9b/0xd0 drivers/gpu/drm/drm_prime.c:374
 drm_ioctl_kernel+0x27d/0x4e0 drivers/gpu/drm/drm_ioctl.c:782
 drm_ioctl+0x51e/0x9d0 drivers/gpu/drm/drm_ioctl.c:885
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:874 [inline]
 __se_sys_ioctl fs/ioctl.c:860 [inline]
 __x64_sys_ioctl+0x193/0x200 fs/ioctl.c:860
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7fa26c8beae9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 bc ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fa269e34188 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fa26c9d1f60 RCX: 00007fa26c8beae9
RDX: 00000000200004c0 RSI: 00000000c00c642e RDI: 0000000000000005
RBP: 00007fa26c918f6d R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007ffc0019c51f R14: 00007fa269e34300 R15: 0000000000022000
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
