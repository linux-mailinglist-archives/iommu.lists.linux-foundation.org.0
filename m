Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 497E03BF9E
	for <lists.iommu@lfdr.de>; Tue, 11 Jun 2019 00:55:00 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9F7011116;
	Mon, 10 Jun 2019 22:54:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 26F91110B
	for <iommu@lists.linux-foundation.org>;
	Mon, 10 Jun 2019 22:54:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4D908174
	for <iommu@lists.linux-foundation.org>;
	Mon, 10 Jun 2019 22:54:56 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id r7so247810pfl.3
	for <iommu@lists.linux-foundation.org>;
	Mon, 10 Jun 2019 15:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=u4S6mVqAF45f40neQ5ism0z/kNZlwpU/7h2+UnMmDbw=;
	b=bWmKpJMUxgoonciVa+Ru6GUy3oPJ5WZ+W0iKofmZE2a9A9ONMHMQUGsIzJaTiz6eBK
	denmEb2Pr699DR1cENFzLNxQeYJL0kbL5dRA6OEcKUrPGe2sUuB4yOqRz5mMLW9rgKwW
	jmnOeCge1e6e+345Yj6hJhJDt1qPdPxbY5Ymga+ulG/MdXdVEwSayRvoPB5YGGQqAwTl
	aHyrUFF5U0HuEBosxagU/O+6YiLOWy8tmMcKnbLWVIdIVJnhy/DKLmDLn6e5pWfsjE8H
	FP8a9rUou303aQFmxizXbgHp7YHnyks3QQL1GJ12Z5f1sEEIAkNnKX1Q6mkYsfu7i5lX
	RgVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=u4S6mVqAF45f40neQ5ism0z/kNZlwpU/7h2+UnMmDbw=;
	b=E4PaK5MU4LdnSo2/uGTHo3Xcaoupb4BTrtxTpk0DdYzMFmKQZHlT2+v8GfN6B6KOxY
	2yMzH/cx0aRhs1ydL67NHPd1cJN4YlJbq/0uDjsRBsMbqOr85aZWc/P+JzJ3ZP38ehqq
	XhTyt5db/OPCZ1JESxgk59tLxIb4QfpHoztnaMSBE/uKWDy5CX4dbvj0D/77GG7BYv+6
	bK3MC0cD+/jDij0zTM8WWrPiOHk7r7OtNx2OAh6NKsMhZ9qDGoHZi/RJolyTYFyfKhVW
	b1wsdYn6x/ENQltifR9FtnY2eI8wBZd31x9fC+lkUMftxeRB2PP6Feh+qxeUVfLFSqEm
	L2Ww==
X-Gm-Message-State: APjAAAUXfLXB0LZ8ZDxp0W742crocbnfJiTa/0nG5pi9fhIo3PzdK1mU
	GYdOTTrPwlR09mhJx+lVwFU=
X-Google-Smtp-Source: APXvYqyu6T/WCNiXIrmWTZBlLF7lllugGkJR2tYzP8v1lp0+d9NQYLQ+Jh/RvExRWKB+V3SXx8D1Mg==
X-Received: by 2002:a17:90a:9202:: with SMTP id
	m2mr23548461pjo.37.1560207295556; 
	Mon, 10 Jun 2019 15:54:55 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
	by smtp.gmail.com with ESMTPSA id d6sm437986pjo.32.2019.06.10.15.54.54
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 10 Jun 2019 15:54:54 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] dma-remap: Avoid de-referencing NULL atomic_pool
Date: Mon, 10 Jun 2019 15:54:37 -0700
Message-Id: <20190610225437.10912-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190607234333.9776-1-f.fainelli@gmail.com>
References: <20190607234333.9776-1-f.fainelli@gmail.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, Christoph Hellwig <hch@lst.de>,
	"open list:DMA MAPPING HELPERS" <iommu@lists.linux-foundation.org>,
	alexey.skidanov@intel.com, bcm-kernel-feedback-list@broadcom.com,
	akpm@linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
	sjhuang@iluvatar.ai
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

With architectures allowing the kernel to be placed almost arbitrarily
in memory (e.g.: ARM64), it is possible to have the kernel resides at
physical addresses above 4GB, resulting in neither the default CMA area,
nor the atomic pool from successfully allocating. This does not prevent
specific peripherals from working though, one example is XHCI, which
still operates correctly.

Trouble comes when the XHCI driver gets suspended and resumed, since we
can now trigger the following NPD:

[   12.664170] usb usb1: root hub lost power or was reset
[   12.669387] usb usb2: root hub lost power or was reset
[   12.674662] Unable to handle kernel NULL pointer dereference at virtual address 00000008
[   12.682896] pgd = ffffffc1365a7000
[   12.686386] [00000008] *pgd=0000000136500003, *pud=0000000136500003, *pmd=0000000000000000
[   12.694897] Internal error: Oops: 96000006 [#1] SMP
[   12.699843] Modules linked in:
[   12.702980] CPU: 0 PID: 1499 Comm: pml Not tainted 4.9.135-1.13pre #51
[   12.709577] Hardware name: BCM97268DV (DT)
[   12.713736] task: ffffffc136bb6540 task.stack: ffffffc1366cc000
[   12.719740] PC is at addr_in_gen_pool+0x4/0x48
[   12.724253] LR is at __dma_free+0x64/0xbc
[   12.728325] pc : [<ffffff80083c0df8>] lr : [<ffffff80080979e0>] pstate: 60000145
[   12.735825] sp : ffffffc1366cf990
[   12.739196] x29: ffffffc1366cf990 x28: ffffffc1366cc000
[   12.744608] x27: 0000000000000000 x26: ffffffc13a8568c8
[   12.750020] x25: 0000000000000000 x24: ffffff80098f9000
[   12.755433] x23: 000000013a5ff000 x22: ffffff8009c57000
[   12.760844] x21: ffffffc13a856810 x20: 0000000000000000
[   12.766255] x19: 0000000000001000 x18: 000000000000000a
[   12.771667] x17: 0000007f917553e0 x16: 0000000000001002
[   12.777078] x15: 00000000000a36cb x14: ffffff80898feb77
[   12.782490] x13: ffffffffffffffff x12: 0000000000000030
[   12.787899] x11: 00000000fffffffe x10: ffffff80098feb7f
[   12.793311] x9 : 0000000005f5e0ff x8 : 65776f702074736f
[   12.798723] x7 : 6c2062756820746f x6 : ffffff80098febb1
[   12.804134] x5 : ffffff800809797c x4 : 0000000000000000
[   12.809545] x3 : 000000013a5ff000 x2 : 0000000000000fff
[   12.814955] x1 : ffffff8009c57000 x0 : 0000000000000000
[   12.820363]
[   12.821907] Process pml (pid: 1499, stack limit = 0xffffffc1366cc020)
[   12.828421] Stack: (0xffffffc1366cf990 to 0xffffffc1366d0000)
[   12.834240] f980:                                   ffffffc1366cf9e0 ffffff80086004d0
[   12.842186] f9a0: ffffffc13ab08238 0000000000000010 ffffff80097c2218 ffffffc13a856810
[   12.850131] f9c0: ffffff8009c57000 000000013a5ff000 0000000000000008 000000013a5ff000
[   12.858076] f9e0: ffffffc1366cfa50 ffffff80085f9250 ffffffc13ab08238 0000000000000004
[   12.866021] fa00: ffffffc13ab08000 ffffff80097b6000 ffffffc13ab08130 0000000000000001
[   12.873966] fa20: 0000000000000008 ffffffc13a8568c8 0000000000000000 ffffffc1366cc000
[   12.881911] fa40: ffffffc13ab08130 0000000000000001 ffffffc1366cfa90 ffffff80085e3de8
[   12.889856] fa60: ffffffc13ab08238 0000000000000000 ffffffc136b75b00 0000000000000000
[   12.897801] fa80: 0000000000000010 ffffff80089ccb92 ffffffc1366cfac0 ffffff80084ad040
[   12.905746] faa0: ffffffc13a856810 0000000000000000 ffffff80084ad004 ffffff80084b91a8
[   12.913691] fac0: ffffffc1366cfae0 ffffff80084b91b4 ffffffc13a856810 ffffff80080db5cc
[   12.921636] fae0: ffffffc1366cfb20 ffffff80084b96bc ffffffc13a856810 0000000000000010
[   12.929581] fb00: ffffffc13a856870 0000000000000000 ffffffc13a856810 ffffff800984d2b8
[   12.937526] fb20: ffffffc1366cfb50 ffffff80084baa70 ffffff8009932ad0 ffffff800984d260
[   12.945471] fb40: 0000000000000010 00000002eff0a065 ffffffc1366cfbb0 ffffff80084bafbc
[   12.953415] fb60: 0000000000000010 0000000000000003 ffffff80098fe000 0000000000000000
[   12.961360] fb80: ffffff80097b6000 ffffff80097b6dc8 ffffff80098c12b8 ffffff80098c12f8
[   12.969306] fba0: ffffff8008842000 ffffff80097b6dc8 ffffffc1366cfbd0 ffffff80080e0d88
[   12.977251] fbc0: 00000000fffffffb ffffff80080e10bc ffffffc1366cfc60 ffffff80080e16a8
[   12.985196] fbe0: 0000000000000000 0000000000000003 ffffff80097b6000 ffffff80098fe9f0
[   12.993140] fc00: ffffff80097d4000 ffffff8008983802 0000000000000123 0000000000000040
[   13.001085] fc20: ffffff8008842000 ffffffc1366cc000 ffffff80089803c2 00000000ffffffff
[   13.009029] fc40: 0000000000000000 0000000000000000 ffffffc1366cfc60 0000000000040987
[   13.016974] fc60: ffffffc1366cfcc0 ffffff80080dfd08 0000000000000003 0000000000000004
[   13.024919] fc80: 0000000000000003 ffffff80098fea08 ffffffc136577ec0 ffffff80089803c2
[   13.032864] fca0: 0000000000000123 0000000000000001 0000000500000002 0000000000040987
[   13.040809] fcc0: ffffffc1366cfd00 ffffff80083a89d4 0000000000000004 ffffffc136577ec0
[   13.048754] fce0: ffffffc136610cc0 ffffffffffffffea ffffffc1366cfeb0 ffffffc136610cd8
[   13.056700] fd00: ffffffc1366cfd10 ffffff800822a614 ffffffc1366cfd40 ffffff80082295d4
[   13.064645] fd20: 0000000000000004 ffffffc136577ec0 ffffffc136610cc0 0000000021670570
[   13.072590] fd40: ffffffc1366cfd80 ffffff80081b5d10 ffffff80097b6000 ffffffc13aae4200
[   13.080536] fd60: ffffffc1366cfeb0 0000000000000004 0000000021670570 0000000000000004
[   13.088481] fd80: ffffffc1366cfe30 ffffff80081b6b20 ffffffc13aae4200 0000000000000000
[   13.096427] fda0: 0000000000000004 0000000021670570 ffffffc1366cfeb0 ffffffc13a838200
[   13.104371] fdc0: 0000000000000000 000000000000000a ffffff80097b6000 0000000000040987
[   13.112316] fde0: ffffffc1366cfe20 ffffff80081b3af0 ffffffc13a838200 0000000000000000
[   13.120261] fe00: ffffffc1366cfe30 ffffff80081b6b0c ffffffc13aae4200 0000000000000000
[   13.128206] fe20: 0000000000000004 0000000000040987 ffffffc1366cfe70 ffffff80081b7dd8
[   13.136151] fe40: ffffff80097b6000 ffffffc13aae4200 ffffffc13aae4200 fffffffffffffff7
[   13.144096] fe60: 0000000021670570 ffffffc13a8c63c0 0000000000000000 ffffff8008083180
[   13.152042] fe80: ffffffffffffff1d 0000000021670570 ffffffffffffffff 0000007f917ad9b8
[   13.159986] fea0: 0000000020000000 0000000000000015 0000000000000000 0000000000040987
[   13.167930] fec0: 0000000000000001 0000000021670570 0000000000000004 0000000000000000
[   13.175874] fee0: 0000000000000888 0000440110000000 000000000000006d 0000000000000003
[   13.183819] ff00: 0000000000000040 ffffff80ffffffc8 0000000000000000 0000000000000020
[   13.191762] ff20: 0000000000000000 0000000000000000 0000000000000001 0000000000000000
[   13.199707] ff40: 0000000000000000 0000007f917553e0 0000000000000000 0000000000000004
[   13.207651] ff60: 0000000021670570 0000007f91835480 0000000000000004 0000007f91831638
[   13.215595] ff80: 0000000000000004 00000000004b0de0 00000000004b0000 0000000000000000
[   13.223539] ffa0: 0000000000000000 0000007fc92ac8c0 0000007f9175d178 0000007fc92ac8c0
[   13.231483] ffc0: 0000007f917ad9b8 0000000020000000 0000000000000001 0000000000000040
[   13.239427] ffe0: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
[   13.247360] Call trace:
[   13.249866] Exception stack(0xffffffc1366cf7a0 to 0xffffffc1366cf8d0)
[   13.256386] f7a0: 0000000000001000 0000007fffffffff ffffffc1366cf990 ffffff80083c0df8
[   13.264331] f7c0: 0000000060000145 ffffff80089b5001 ffffffc13ab08130 0000000000000001
[   13.272275] f7e0: 0000000000000008 ffffffc13a8568c8 0000000000000000 0000000000000000
[   13.280220] f800: ffffffc1366cf960 ffffffc1366cf960 ffffffc1366cf930 00000000ffffffd8
[   13.288165] f820: ffffff8009931ac0 4554535953425553 4544006273753d4d 3831633d45434956
[   13.296110] f840: ffff003832313a39 ffffff800845926c ffffffc1366cf880 0000000000040987
[   13.304054] f860: 0000000000000000 ffffff8009c57000 0000000000000fff 000000013a5ff000
[   13.311999] f880: 0000000000000000 ffffff800809797c ffffff80098febb1 6c2062756820746f
[   13.319944] f8a0: 65776f702074736f 0000000005f5e0ff ffffff80098feb7f 00000000fffffffe
[   13.327884] f8c0: 0000000000000030 ffffffffffffffff
[   13.332835] [<ffffff80083c0df8>] addr_in_gen_pool+0x4/0x48
[   13.338398] [<ffffff80086004d0>] xhci_mem_cleanup+0xc8/0x51c
[   13.344137] [<ffffff80085f9250>] xhci_resume+0x308/0x65c
[   13.349524] [<ffffff80085e3de8>] xhci_brcm_resume+0x84/0x8c
[   13.355174] [<ffffff80084ad040>] platform_pm_resume+0x3c/0x64
[   13.360997] [<ffffff80084b91b4>] dpm_run_callback+0x5c/0x15c
[   13.366732] [<ffffff80084b96bc>] device_resume+0xc0/0x190
[   13.372205] [<ffffff80084baa70>] dpm_resume+0x144/0x2cc
[   13.377504] [<ffffff80084bafbc>] dpm_resume_end+0x20/0x34
[   13.382980] [<ffffff80080e0d88>] suspend_devices_and_enter+0x104/0x704
[   13.389585] [<ffffff80080e16a8>] pm_suspend+0x320/0x53c
[   13.394881] [<ffffff80080dfd08>] state_store+0xbc/0xe0
[   13.400094] [<ffffff80083a89d4>] kobj_attr_store+0x14/0x24
[   13.405655] [<ffffff800822a614>] sysfs_kf_write+0x60/0x70
[   13.411128] [<ffffff80082295d4>] kernfs_fop_write+0x130/0x194
[   13.416954] [<ffffff80081b5d10>] __vfs_write+0x60/0x150
[   13.422254] [<ffffff80081b6b20>] vfs_write+0xc8/0x164
[   13.427376] [<ffffff80081b7dd8>] SyS_write+0x70/0xc8
[   13.432412] [<ffffff8008083180>] el0_svc_naked+0x34/0x38
[   13.437800] Code: 92800173 97f6fb9e 17fffff5 d1000442 (f8408c03)
[   13.444033] ---[ end trace 2effe12f909ce205 ]---

The call path leading to this problem is xhci_mem_cleanup() ->
dma_free_coherent() -> dma_free_from_pool() -> addr_in_gen_pool. If the
atomic_pool is NULL, we can't possibly have the address in the atomic
pool anyway, so guard against that.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
Christoph,

This is a follow-up to this patch that was sent earlier:

https://lore.kernel.org/patchwork/patch/1085565/

which takes APKM's feedback into account.

 kernel/dma/remap.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/dma/remap.c b/kernel/dma/remap.c
index 7a723194ecbe..0207e3764d52 100644
--- a/kernel/dma/remap.c
+++ b/kernel/dma/remap.c
@@ -158,6 +158,9 @@ int __init dma_atomic_pool_init(gfp_t gfp, pgprot_t prot)
 
 bool dma_in_atomic_pool(void *start, size_t size)
 {
+	if (unlikely(!atomic_pool))
+		return false;
+
 	return addr_in_gen_pool(atomic_pool, (unsigned long)start, size);
 }
 
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
