Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB5B3F16F8
	for <lists.iommu@lfdr.de>; Thu, 19 Aug 2021 12:02:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4E9F606BE;
	Thu, 19 Aug 2021 10:02:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wM7h_aEN3Tph; Thu, 19 Aug 2021 10:02:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id BB9246068B;
	Thu, 19 Aug 2021 10:02:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9B8ECC000E;
	Thu, 19 Aug 2021 10:02:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 641BAC000E
 for <iommu@lists.linux-foundation.org>; Thu, 19 Aug 2021 10:02:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49831400AE
 for <iommu@lists.linux-foundation.org>; Thu, 19 Aug 2021 10:02:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F2r4LI0-vqhk for <iommu@lists.linux-foundation.org>;
 Thu, 19 Aug 2021 10:02:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 77479401C4
 for <iommu@lists.linux-foundation.org>; Thu, 19 Aug 2021 10:02:07 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 7AB826736F; Thu, 19 Aug 2021 12:02:00 +0200 (CEST)
Date: Thu, 19 Aug 2021 12:02:00 +0200
From: Christoph Hellwig <hch@lst.de>
To: Tianyu Lan <ltykernel@gmail.com>
Subject: Re: [PATCH V3 10/13] x86/Swiotlb: Add Swiotlb bounce buffer remap
 function for HV IVM
Message-ID: <20210819100200.GA16908@lst.de>
References: <20210809175620.720923-1-ltykernel@gmail.com>
 <20210809175620.720923-11-ltykernel@gmail.com>
 <20210812122741.GC19050@lst.de>
 <d18ae061-6fc2-e69e-fc2c-2e1a1114c4b4@gmail.com>
 <890e5e21-714a-2db6-f68a-6211a69bebb9@gmail.com>
 <20210819084951.GA10461@lst.de>
 <1c5ae861-2c35-2ef5-e764-db45bbcb88a9@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1c5ae861-2c35-2ef5-e764-db45bbcb88a9@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: parri.andrea@gmail.com, linux-hyperv@vger.kernel.org, brijesh.singh@amd.com,
 peterz@infradead.org, dave.hansen@linux.intel.com, vkuznets@redhat.com,
 hpa@zytor.com, kys@microsoft.com, will@kernel.org, tglx@linutronix.de,
 linux-arch@vger.kernel.org, sfr@canb.auug.org.au, wei.liu@kernel.org,
 sstabellini@kernel.org, sthemmin@microsoft.com, xen-devel@lists.xenproject.org,
 linux-scsi@vger.kernel.org, aneesh.kumar@linux.ibm.com, x86@kernel.org,
 decui@microsoft.com, Christoph Hellwig <hch@lst.de>,
 michael.h.kelley@microsoft.com, mingo@redhat.com, pgonda@google.com,
 rientjes@google.com, kuba@kernel.org, jejb@linux.ibm.com,
 martin.b.radev@gmail.com, thomas.lendacky@amd.com, Tianyu.Lan@microsoft.com,
 arnd@arndb.de, konrad.wilk@oracle.com, haiyangz@microsoft.com, bp@alien8.de,
 luto@kernel.org, krish.sadhukhan@oracle.com, boris.ostrovsky@oracle.com,
 akpm@linux-foundation.org, jgross@suse.com, martin.petersen@oracle.com,
 saravanand@fb.com, netdev@vger.kernel.org, dave.hansen@intel.com,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 rppt@kernel.org, hannes@cmpxchg.org, tj@kernel.org, ardb@kernel.org,
 robin.murphy@arm.com, davem@davemloft.net, kirill.shutemov@linux.intel.com
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

On Thu, Aug 19, 2021 at 05:59:02PM +0800, Tianyu Lan wrote:
>
>
> On 8/19/2021 4:49 PM, Christoph Hellwig wrote:
>> On Mon, Aug 16, 2021 at 10:50:26PM +0800, Tianyu Lan wrote:
>>> Hi Christoph:
>>>        Sorry to bother you.Please double check with these two patches
>>> " [PATCH V3 10/13] x86/Swiotlb: Add Swiotlb bounce buffer remap function
>>> for HV IVM" and "[PATCH V3 09/13] DMA: Add dma_map_decrypted/dma_
>>> unmap_encrypted() function".
>>
>> Do you have a git tree somewhere to look at the whole tree?
>
> Yes, here is my github link for these two patches.
>
> https://github.com/lantianyu/linux/commit/462f7e4e44644fe7e182f7a5fb043a75acb90ee5
>
> https://github.com/lantianyu/linux/commit/c8de236bf4366d39e8b98e5a091c39df29b03e0b

Which branch is this?

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
