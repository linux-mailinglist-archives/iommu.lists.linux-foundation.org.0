Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 064393A6A7A
	for <lists.iommu@lfdr.de>; Mon, 14 Jun 2021 17:33:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B72940379;
	Mon, 14 Jun 2021 15:33:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EEP_2sdDhm0p; Mon, 14 Jun 2021 15:33:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id A980B4036A;
	Mon, 14 Jun 2021 15:33:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 82A64C000B;
	Mon, 14 Jun 2021 15:33:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 56C57C000B
 for <iommu@lists.linux-foundation.org>; Mon, 14 Jun 2021 15:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 41A6140379
 for <iommu@lists.linux-foundation.org>; Mon, 14 Jun 2021 15:33:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rgwcyyn8j9rC for <iommu@lists.linux-foundation.org>;
 Mon, 14 Jun 2021 15:33:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9C7E24036A
 for <iommu@lists.linux-foundation.org>; Mon, 14 Jun 2021 15:33:42 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 4E32868AFE; Mon, 14 Jun 2021 17:33:39 +0200 (CEST)
Date: Mon, 14 Jun 2021 17:33:39 +0200
From: Christoph Hellwig <hch@lst.de>
To: Tianyu Lan <ltykernel@gmail.com>
Subject: Re: [RFC PATCH V3 10/11] HV/Netvsc: Add Isolation VM support for
 netvsc driver
Message-ID: <20210614153339.GB1741@lst.de>
References: <20210530150628.2063957-1-ltykernel@gmail.com>
 <20210530150628.2063957-11-ltykernel@gmail.com>
 <20210607065007.GE24478@lst.de>
 <279cb4bf-c5b6-6db9-0f1e-9238e902c8f2@gmail.com>
 <20210614070903.GA29976@lst.de>
 <e10c2696-23c3-befe-4f4d-25e18918132f@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e10c2696-23c3-befe-4f4d-25e18918132f@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: linux-hyperv@vger.kernel.org, brijesh.singh@amd.com,
 thomas.lendacky@amd.com, peterz@infradead.org, dave.hansen@linux.intel.com,
 hpa@zytor.com, kys@microsoft.com, will@kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org, wei.liu@kernel.org,
 sstabellini@kernel.org, sthemmin@microsoft.com, linux-scsi@vger.kernel.org,
 x86@kernel.org, decui@microsoft.com, mingo@redhat.com,
 xen-devel@lists.xenproject.org, jejb@linux.ibm.com, jgross@suse.com,
 Tianyu.Lan@microsoft.com, arnd@arndb.de, konrad.wilk@oracle.com,
 haiyangz@microsoft.com, kuba@kernel.org, bp@alien8.de, luto@kernel.org,
 krish.sadhukhan@oracle.com, tglx@linutronix.de, vkuznets@redhat.com,
 boris.ostrovsky@oracle.com, martin.petersen@oracle.com, saravanand@fb.com,
 netdev@vger.kernel.org, sunilmut@microsoft.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, kirill.shutemov@linux.intel.com,
 hannes@cmpxchg.org, cai@lca.pw, akpm@linux-foundation.org,
 robin.murphy@arm.com, davem@davemloft.net, rppt@kernel.org
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

On Mon, Jun 14, 2021 at 10:04:06PM +0800, Tianyu Lan wrote:
> The pages in the hv_page_buffer array here are in the kernel linear 
> mapping. The packet sent to host will contain an array which contains 
> transaction data. In the isolation VM, data in the these pages needs to be 
> copied to bounce buffer and so call dma_map_single() here to map these data 
> pages with bounce buffer. The vmbus has ring buffer where the send/receive 
> packets are copied to/from. The ring buffer has been remapped to the extra 
> space above shared gpa boundary/vTom during probing Netvsc driver and so 
> not call dma map function for vmbus ring
> buffer.

So why do we have all that PFN magic instead of using struct page or
the usual kernel I/O buffers that contain a page pointer?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
