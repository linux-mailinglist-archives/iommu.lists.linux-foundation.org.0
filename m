Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4954AD84B
	for <lists.iommu@lfdr.de>; Tue,  8 Feb 2022 13:27:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 847E94059B;
	Tue,  8 Feb 2022 12:27:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I4t4Mlye6Xdu; Tue,  8 Feb 2022 12:27:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 3E86D40594;
	Tue,  8 Feb 2022 12:27:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EBFAFC0039;
	Tue,  8 Feb 2022 12:27:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 47EE5C000B
 for <iommu@lists.linux-foundation.org>; Tue,  8 Feb 2022 12:26:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 195D440590
 for <iommu@lists.linux-foundation.org>; Tue,  8 Feb 2022 12:26:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eHCd6sDW0nu8 for <iommu@lists.linux-foundation.org>;
 Tue,  8 Feb 2022 12:26:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9EF224010C
 for <iommu@lists.linux-foundation.org>; Tue,  8 Feb 2022 12:26:57 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id a8so51743018ejc.8
 for <iommu@lists.linux-foundation.org>; Tue, 08 Feb 2022 04:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=M8fVVO69k6oFQmGgr86L7p4G8m91URmGx/JG7vItFGs=;
 b=dAsTDu0+VLjq0oBcw9NnZRu5y2DTId/+y+M247gWdZefn7zWi36p0IIYIl89FtNG+y
 ZmoMBA6A2WGST+9q3NV3cIi63JW+J1w5/gvOmjbNvX3J2+jQQ403n8WzdV3WtqbkG8pj
 ZZGQzQxIn5MvzxefYZ/HWt/x2wGLHEr6jQzqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=M8fVVO69k6oFQmGgr86L7p4G8m91URmGx/JG7vItFGs=;
 b=VKwUUlXtMP2NUfPvMIMuPoNmHiN0H5H26ewU7y+JR2EYss98uu42dvXjGihVlVcAS2
 xgcmsXShEZAF0Ee9S55YQiFAJsMBdtJJ0ht7gT9yjkit3iD0X02/iH6K+wViitcTUC2m
 Wusi5Z8tAuJyj/w5JHkFIY0tdZeXBofaylozLC0bT46m2HzGUe6DT6LggG0ruw7whvBp
 o8ud2mJn3t7BvuPuY/Vw5FwX9vsv3kLUMnQRUVyPA0m5+kZAJ3rNWrS2fzfM552Q+CVp
 Ea/uW9LEskUFguwZAuZw09OEQUF2RpnN4s7DujTIAupVw1dX7KLob4w6sRnT9ZbfzWUq
 mQAQ==
X-Gm-Message-State: AOAM533lufHYtyq3SIsYfvszaZdoCDVKTnPoI8xpFf2cnkYc8UN+J9OF
 RHshe5M941lrAEvC/JjVJwWJDw==
X-Google-Smtp-Source: ABdhPJw7c5LEuehZYQwnQ5zdMdwsVOu9wqdYqAvYs7q5kZCAp5j9VLgZXrO4g6Gb8AVX2xj/iHVgDA==
X-Received: by 2002:a17:906:9b87:: with SMTP id
 dd7mr3386674ejc.178.1644323215615; 
 Tue, 08 Feb 2022 04:26:55 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d7sm1613552ejp.98.2022.02.08.04.26.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 04:26:54 -0800 (PST)
Date: Tue, 8 Feb 2022 13:26:53 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: syzbot <syzbot+10e27961f4da37c443b2@syzkaller.appspotmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [syzbot] WARNING in __dma_map_sg_attrs
Message-ID: <YgJhjdAbRHdnCZ4T@phenom.ffwll.local>
Mail-Followup-To: syzbot
 <syzbot+10e27961f4da37c443b2@syzkaller.appspotmail.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org,
 linaro-mm-sig-owner@lists.linaro.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, m.szyprowski@samsung.com,
 robin.murphy@arm.com, sumit.semwal@linaro.org,
 syzkaller-bugs@googlegroups.com
References: <000000000000f0196305d219b2fe@google.com>
 <000000000000b968f305d74b1195@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000000000000b968f305d74b1195@google.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Cc: sumit.semwal@linaro.org, linaro-mm-sig-owner@lists.linaro.org,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hch@lst.de, linaro-mm-sig@lists.linaro.org,
 iommu@lists.linux-foundation.org, robin.murphy@arm.com,
 christian.koenig@amd.com, linux-media@vger.kernel.org
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

On Sat, Feb 05, 2022 at 12:18:23PM -0800, syzbot wrote:
> syzbot has found a reproducer for the following issue on:
> 
> HEAD commit:    0457e5153e0e Merge tag 'for-linus' of git://git.kernel.org..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=11b2637c700000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=6f043113811433a5
> dashboard link: https://syzkaller.appspot.com/bug?extid=10e27961f4da37c443b2
> compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11c65542700000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1163f480700000
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+10e27961f4da37c443b2@syzkaller.appspotmail.com

Adding Gerd, since this seems to blow up in udmabuf.

I wonder why syzbot didn't figure this out, since it seems to have
correctly added both dma-api and dma-buf people. Just not the maintainer
for the begin_cpu_udmabuf function in the middle of the backtrace?
-Daniel

> 

> ------------[ cut here ]------------
> WARNING: CPU: 1 PID: 3595 at kernel/dma/mapping.c:188 __dma_map_sg_attrs+0x181/0x1f0 kernel/dma/mapping.c:188
> Modules linked in:
> CPU: 0 PID: 3595 Comm: syz-executor249 Not tainted 5.17.0-rc2-syzkaller-00316-g0457e5153e0e #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> RIP: 0010:__dma_map_sg_attrs+0x181/0x1f0 kernel/dma/mapping.c:188
> Code: 00 00 00 00 00 fc ff df 48 c1 e8 03 80 3c 10 00 75 71 4c 8b 3d c0 83 b5 0d e9 db fe ff ff e8 b6 0f 13 00 0f 0b e8 af 0f 13 00 <0f> 0b 45 31 e4 e9 54 ff ff ff e8 a0 0f 13 00 49 8d 7f 50 48 b8 00
> RSP: 0018:ffffc90002a07d68 EFLAGS: 00010293
> RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
> RDX: ffff88807e25e2c0 RSI: ffffffff81649e91 RDI: ffff88801b848408
> RBP: ffff88801b848000 R08: 0000000000000002 R09: ffff88801d86c74f
> R10: ffffffff81649d72 R11: 0000000000000001 R12: 0000000000000002
> R13: ffff88801d86c680 R14: 0000000000000001 R15: 0000000000000000
> FS:  0000555556e30300(0000) GS:ffff8880b9d00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00000000200000cc CR3: 000000001d74a000 CR4: 00000000003506e0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  <TASK>
>  dma_map_sgtable+0x70/0xf0 kernel/dma/mapping.c:264
>  get_sg_table.isra.0+0xe0/0x160 drivers/dma-buf/udmabuf.c:72
>  begin_cpu_udmabuf+0x130/0x1d0 drivers/dma-buf/udmabuf.c:126
>  dma_buf_begin_cpu_access+0xfd/0x1d0 drivers/dma-buf/dma-buf.c:1164
>  dma_buf_ioctl+0x259/0x2b0 drivers/dma-buf/dma-buf.c:363
>  vfs_ioctl fs/ioctl.c:51 [inline]
>  __do_sys_ioctl fs/ioctl.c:874 [inline]
>  __se_sys_ioctl fs/ioctl.c:860 [inline]
>  __x64_sys_ioctl+0x193/0x200 fs/ioctl.c:860
>  do_syscall_x64 arch/x86/entry/common.c:50 [inline]
>  do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
>  entry_SYSCALL_64_after_hwframe+0x44/0xae
> RIP: 0033:0x7f62fcf530f9
> Code: 28 c3 e8 2a 14 00 00 66 2e 0f 1f 84 00 00 00 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007ffe3edab9b8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f62fcf530f9
> RDX: 0000000020000200 RSI: 0000000040086200 RDI: 0000000000000006
> RBP: 00007f62fcf170e0 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 00007f62fcf17170
> R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
>  </TASK>
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
