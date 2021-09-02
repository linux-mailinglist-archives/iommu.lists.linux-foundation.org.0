Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F85E3FEA3F
	for <lists.iommu@lfdr.de>; Thu,  2 Sep 2021 09:51:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6EBA80DF8;
	Thu,  2 Sep 2021 07:51:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xHEmYpUQVUDj; Thu,  2 Sep 2021 07:51:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id DE7FC823F4;
	Thu,  2 Sep 2021 07:51:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BAAA0C000E;
	Thu,  2 Sep 2021 07:51:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 66780C000E
 for <iommu@lists.linux-foundation.org>; Thu,  2 Sep 2021 07:51:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45BB440102
 for <iommu@lists.linux-foundation.org>; Thu,  2 Sep 2021 07:51:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4DHkyytv0M7u for <iommu@lists.linux-foundation.org>;
 Thu,  2 Sep 2021 07:51:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1A2E740004
 for <iommu@lists.linux-foundation.org>; Thu,  2 Sep 2021 07:51:39 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id A78796736F; Thu,  2 Sep 2021 09:51:31 +0200 (CEST)
Date: Thu, 2 Sep 2021 09:51:31 +0200
From: Christoph Hellwig <hch@lst.de>
To: Tianyu Lan <ltykernel@gmail.com>
Subject: Re: [PATCH V4 00/13] x86/Hyper-V: Add Hyper-V Isolation VM support
Message-ID: <20210902075131.GA14986@lst.de>
References: <20210827172114.414281-1-ltykernel@gmail.com>
 <20210830120036.GA22005@lst.de>
 <91b5e997-8d44-77f0-6519-f574b541ba9f@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <91b5e997-8d44-77f0-6519-f574b541ba9f@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: parri.andrea@gmail.com, linux-hyperv@vger.kernel.org, brijesh.singh@amd.com,
 peterz@infradead.org, catalin.marinas@arm.com, dave.hansen@linux.intel.com,
 dave.hansen@intel.com, netdev@vger.kernel.org, hpa@zytor.com,
 kys@microsoft.com, will@kernel.org, tglx@linutronix.de,
 linux-arch@vger.kernel.org, wei.liu@kernel.org, sstabellini@kernel.org,
 sthemmin@microsoft.com, xen-devel@lists.xenproject.org,
 linux-scsi@vger.kernel.org, aneesh.kumar@linux.ibm.com, x86@kernel.org,
 decui@microsoft.com, Christoph Hellwig <hch@lst.de>,
 michael.h.kelley@microsoft.com, mingo@redhat.com, pgonda@google.com,
 rientjes@google.com, kuba@kernel.org, jejb@linux.ibm.com,
 martin.b.radev@gmail.com, thomas.lendacky@amd.com, Tianyu.Lan@microsoft.com,
 arnd@arndb.de, konrad.wilk@oracle.com, haiyangz@microsoft.com, bp@alien8.de,
 luto@kernel.org, krish.sadhukhan@oracle.com, boris.ostrovsky@oracle.com,
 vkuznets@redhat.com, linux-arm-kernel@lists.infradead.org, jgross@suse.com,
 martin.petersen@oracle.com, saravanand@fb.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 rppt@kernel.org, hannes@cmpxchg.org, ardb@kernel.org,
 akpm@linux-foundation.org, robin.murphy@arm.com, davem@davemloft.net,
 kirill.shutemov@linux.intel.com
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

On Tue, Aug 31, 2021 at 11:20:06PM +0800, Tianyu Lan wrote:
>> If so I suspect the best way to allocate them is by not using vmalloc
>> but just discontiguous pages, and then use kmap_local_pfn where the
>> PFN includes the share_gpa offset when actually copying from/to the
>> skbs.
>>
> When netvsc needs to copy packet data to send buffer, it needs to caculate 
> position with section_index and send_section_size.
> Please seee netvsc_copy_to_send_buf() detail. So the contiguous virtual 
> address of send buffer is necessary to copy data and batch packets.

Actually that makes the kmap approach much easier.  The phys_to_virt
can just be replaced with a kmap_local_pfn and the unmap needs to
be added.  I've been mostly focussing on the receive path, which
would need a similar treatment.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
