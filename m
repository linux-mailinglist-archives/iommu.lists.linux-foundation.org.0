Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 194E2318665
	for <lists.iommu@lfdr.de>; Thu, 11 Feb 2021 09:38:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C4AD087543;
	Thu, 11 Feb 2021 08:38:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7CdA+tTh9Dgk; Thu, 11 Feb 2021 08:38:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id F184E87542;
	Thu, 11 Feb 2021 08:38:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D29DAC013A;
	Thu, 11 Feb 2021 08:38:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4FE31C013A
 for <iommu@lists.linux-foundation.org>; Thu, 11 Feb 2021 08:38:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3CD8C86D52
 for <iommu@lists.linux-foundation.org>; Thu, 11 Feb 2021 08:38:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ASTgM8fs2NCg for <iommu@lists.linux-foundation.org>;
 Thu, 11 Feb 2021 08:38:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8C76786D3C
 for <iommu@lists.linux-foundation.org>; Thu, 11 Feb 2021 08:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613032682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OshEwSbCv9NPTYWa6eOuk9tJUyjlTdPMJ4VCPbd4Iv0=;
 b=HxPsNGhXHaIWPMcxOcmiU1izS3iDwqJ694uepCIfmTy74PaN1jsaFBno6PIlODamT7UyC9
 dPl5ctnRFz0gAGr682BmUrj2mDoCeDpghTRHuz6AoHynryRCYD7NYe+Wxxbyk+UpXad5oX
 C7xVl5Qt/+yKzyX8ueWnwi6k1b1z1BA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-blTG32R_OI-ZaE04sIMUog-1; Thu, 11 Feb 2021 03:37:56 -0500
X-MC-Unique: blTG32R_OI-ZaE04sIMUog-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 548D2AFA83;
 Thu, 11 Feb 2021 08:37:54 +0000 (UTC)
Received: from [10.36.114.52] (ovpn-114-52.ams2.redhat.com [10.36.114.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 83EC16268E;
 Thu, 11 Feb 2021 08:37:51 +0000 (UTC)
Subject: Re: [PATCH 0/3] mm/page_alloc: Fix pageblock_order with
 HUGETLB_PAGE_SIZE_VARIABLE
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
 akpm@linux-foundation.org, will@kernel.org
References: <1613024531-19040-1-git-send-email-anshuman.khandual@arm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <683c812a-ce3d-ef74-10d1-eaf8a3ae93d4@redhat.com>
Date: Thu, 11 Feb 2021 09:37:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <1613024531-19040-1-git-send-email-anshuman.khandual@arm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 11.02.21 07:22, Anshuman Khandual wrote:
> The following warning gets triggered while trying to boot a 64K page size
> without THP config kernel on arm64 platform.
> 
> WARNING: CPU: 5 PID: 124 at mm/vmstat.c:1080 __fragmentation_index+0xa4/0xc0
> Modules linked in:
> CPU: 5 PID: 124 Comm: kswapd0 Not tainted 5.11.0-rc6-00004-ga0ea7d62002 #159
> Hardware name: linux,dummy-virt (DT)
> [    8.810673] pstate: 20400005 (nzCv daif +PAN -UAO -TCO BTYPE=--)
> [    8.811732] pc : __fragmentation_index+0xa4/0xc0
> [    8.812555] lr : fragmentation_index+0xf8/0x138
> [    8.813360] sp : ffff0000864079b0
> [    8.813958] x29: ffff0000864079b0 x28: 0000000000000372
> [    8.814901] x27: 0000000000007682 x26: ffff8000135b3948
> [    8.815847] x25: 1fffe00010c80f48 x24: 0000000000000000
> [    8.816805] x23: 0000000000000000 x22: 000000000000000d
> [    8.817764] x21: 0000000000000030 x20: ffff0005ffcb4d58
> [    8.818712] x19: 000000000000000b x18: 0000000000000000
> [    8.819656] x17: 0000000000000000 x16: 0000000000000000
> [    8.820613] x15: 0000000000000000 x14: ffff8000114c6258
> [    8.821560] x13: ffff6000bff969ba x12: 1fffe000bff969b9
> [    8.822514] x11: 1fffe000bff969b9 x10: ffff6000bff969b9
> [    8.823461] x9 : dfff800000000000 x8 : ffff0005ffcb4dcf
> [    8.824415] x7 : 0000000000000001 x6 : 0000000041b58ab3
> [    8.825359] x5 : ffff600010c80f48 x4 : dfff800000000000
> [    8.826313] x3 : ffff8000102be670 x2 : 0000000000000007
> [    8.827259] x1 : ffff000086407a60 x0 : 000000000000000d
> [    8.828218] Call trace:
> [    8.828667]  __fragmentation_index+0xa4/0xc0
> [    8.829436]  fragmentation_index+0xf8/0x138
> [    8.830194]  compaction_suitable+0x98/0xb8
> [    8.830934]  wakeup_kcompactd+0xdc/0x128
> [    8.831640]  balance_pgdat+0x71c/0x7a0
> [    8.832327]  kswapd+0x31c/0x520
> [    8.832902]  kthread+0x224/0x230
> [    8.833491]  ret_from_fork+0x10/0x30
> [    8.834150] ---[ end trace 472836f79c15516b ]---
> 
> This warning comes from __fragmentation_index() when the requested order
> is greater than MAX_ORDER.
> 
> static int __fragmentation_index(unsigned int order,
> 				 struct contig_page_info *info)
> {
>          unsigned long requested = 1UL << order;
> 
>          if (WARN_ON_ONCE(order >= MAX_ORDER)) <===== Triggered here
>                  return 0;
> 
> Digging it further reveals that pageblock_order has been assigned a value
> which is greater than MAX_ORDER failing the above check. But why this
> happened ? Because HUGETLB_PAGE_ORDER for the given config on arm64 is
> greater than MAX_ORDER.
> 
> The solution involves enabling HUGETLB_PAGE_SIZE_VARIABLE which would make
> pageblock_order a variable instead of constant HUGETLB_PAGE_ORDER. But that
> change alone also did not really work as pageblock_order still got assigned
> as HUGETLB_PAGE_ORDER in set_pageblock_order(). HUGETLB_PAGE_ORDER needs to
> be less than MAX_ORDER for its appropriateness as pageblock_order otherwise
> just fallback to MAX_ORDER - 1 as before. While here it also fixes a build
> problem via type casting MAX_ORDER in rmem_cma_setup().

I'm wondering, is there any real value in allowing FORCE_MAX_ZONEORDER 
to be "11" with ARM64_64K_PAGES/ARM64_16K_PAGES?

Meaning: are there any real use cases that actually build a kernel 
without TRANSPARENT_HUGEPAGE and with ARM64_64K_PAGES/ARM64_16K_PAGES?

As builds are essentially broken, I assume this is not that relevant? Or 
how long has it been broken?

It might be easier to just drop the "TRANSPARENT_HUGEPAGE" part from the 
FORCE_MAX_ZONEORDER config.

-- 
Thanks,

David / dhildenb

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
