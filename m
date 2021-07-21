Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 932573D116C
	for <lists.iommu@lfdr.de>; Wed, 21 Jul 2021 16:34:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32B11605D5;
	Wed, 21 Jul 2021 14:34:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3txy2Zm2ISvv; Wed, 21 Jul 2021 14:34:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 46D38606C6;
	Wed, 21 Jul 2021 14:34:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 11804C000E;
	Wed, 21 Jul 2021 14:34:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 76834C000E
 for <iommu@lists.linux-foundation.org>; Wed, 21 Jul 2021 14:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 505C882882
 for <iommu@lists.linux-foundation.org>; Wed, 21 Jul 2021 14:34:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZQ7fdH1Yh3ZI for <iommu@lists.linux-foundation.org>;
 Wed, 21 Jul 2021 14:34:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1282582881
 for <iommu@lists.linux-foundation.org>; Wed, 21 Jul 2021 14:34:02 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 089B867373; Wed, 21 Jul 2021 16:33:56 +0200 (CEST)
Date: Wed, 21 Jul 2021 16:33:55 +0200
From: Christoph Hellwig <hch@lst.de>
To: Tianyu Lan <ltykernel@gmail.com>
Subject: Re: [Resend RFC PATCH V4 09/13] x86/Swiotlb/HV: Add Swiotlb bounce
 buffer remap function for HV IVM
Message-ID: <20210721143355.GA10848@lst.de>
References: <20210707154629.3977369-1-ltykernel@gmail.com>
 <20210707154629.3977369-10-ltykernel@gmail.com>
 <20210720135437.GA13554@lst.de>
 <8f1a285d-4b67-8041-d326-af565b2756c0@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8f1a285d-4b67-8041-d326-af565b2756c0@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: linux-hyperv@vger.kernel.org, brijesh.singh@amd.com, david@redhat.com,
 peterz@infradead.org, dave.hansen@linux.intel.com, hpa@zytor.com,
 anparri@microsoft.com, kys@microsoft.com, will@kernel.org, tglx@linutronix.de,
 linux-arch@vger.kernel.org, robh@kernel.org, wei.liu@kernel.org,
 sstabellini@kernel.org, sthemmin@microsoft.com, xen-devel@lists.xenproject.org,
 linux-scsi@vger.kernel.org, x86@kernel.org, decui@microsoft.com,
 Christoph Hellwig <hch@lst.de>, michael.h.kelley@microsoft.com,
 nramas@linux.microsoft.com, mingo@redhat.com, pgonda@google.com,
 rientjes@google.com, kuba@kernel.org, jejb@linux.ibm.com,
 martin.b.radev@gmail.com, thomas.lendacky@amd.com, Tianyu.Lan@microsoft.com,
 keescook@chromium.org, arnd@arndb.de, konrad.wilk@oracle.com,
 haiyangz@microsoft.com, bp@alien8.de, luto@kernel.org,
 krish.sadhukhan@oracle.com, boris.ostrovsky@oracle.com, vkuznets@redhat.com,
 jgross@suse.com, martin.petersen@oracle.com, saravanand@fb.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, rppt@kernel.org, hannes@cmpxchg.org,
 ardb@kernel.org, akpm@linux-foundation.org, robin.murphy@arm.com,
 davem@davemloft.net, kirill.shutemov@linux.intel.com
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

On Wed, Jul 21, 2021 at 06:28:48PM +0800, Tianyu Lan wrote:
> dma_mmap_attrs() and dma_get_sgtable_attrs() get input virtual address
> belonging to backing memory with struct page and returns bounce buffer
> dma physical address which is below shared_gpa_boundary(vTOM) and passed
> to Hyper-V via vmbus protocol.
>
> The new map virtual address is only to access bounce buffer in swiotlb
> code and will not be used other places. It's stored in the mem->vstart.
> So the new API set_memory_decrypted_map() in this series is only called
> in the swiotlb code. Other platforms may replace set_memory_decrypted()
> with set_memory_decrypted_map() as requested.

It seems like you are indeed not using these new helpers in
dma_direct_alloc.  How is dma_alloc_attrs/dma_alloc_coherent going to
work on these systems?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
