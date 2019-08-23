Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F74A9AA8C
	for <lists.iommu@lfdr.de>; Fri, 23 Aug 2019 10:40:04 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 014F9C75;
	Fri, 23 Aug 2019 08:40:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BA345C75
	for <iommu@lists.linux-foundation.org>;
	Fri, 23 Aug 2019 08:39:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 493037FB
	for <iommu@lists.linux-foundation.org>;
	Fri, 23 Aug 2019 08:39:59 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 91BBF246; Fri, 23 Aug 2019 10:39:57 +0200 (CEST)
Date: Fri, 23 Aug 2019 10:39:56 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v7 1/7] iommu/vt-d: Don't switch off swiotlb if use
	direct dma
Message-ID: <20190823083956.GB24194@8bytes.org>
References: <20190823071735.30264-1-baolu.lu@linux.intel.com>
	<20190823071735.30264-2-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190823071735.30264-2-baolu.lu@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: alan.cox@intel.com, Christoph Hellwig <hch@lst.de>,
	Stefano Stabellini <sstabellini@kernel.org>, ashok.raj@intel.com,
	Jonathan Corbet <corbet@lwn.net>, pengfei.xu@intel.com,
	Ingo Molnar <mingo@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>, kevin.tian@intel.com,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Steven Rostedt <rostedt@goodmis.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	mika.westerberg@linux.intel.com, Juergen Gross <jgross@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	jacob.jun.pan@intel.com, Robin Murphy <robin.murphy@arm.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On Fri, Aug 23, 2019 at 03:17:29PM +0800, Lu Baolu wrote:
> --- a/drivers/iommu/intel-iommu.c
> +++ b/drivers/iommu/intel-iommu.c
> @@ -4569,9 +4569,6 @@ static int __init platform_optin_force_iommu(void)
>  		iommu_identity_mapping |= IDENTMAP_ALL;
>  
>  	dmar_disabled = 0;
> -#if defined(CONFIG_X86) && defined(CONFIG_SWIOTLB)
> -	swiotlb = 0;
> -#endif
>  	no_iommu = 0;
>  
>  	return 1;
> @@ -4710,9 +4707,6 @@ int __init intel_iommu_init(void)
>  	}
>  	up_write(&dmar_global_lock);
>  
> -#if defined(CONFIG_X86) && defined(CONFIG_SWIOTLB)
> -	swiotlb = 0;
> -#endif

So this will cause the 64MB SWIOTLB aperture to be allocated even when
there will never be an untrusted device in the system, right? I guess
this will break some kdump setups as they need to resize their low
memory allocations to make room for the aperture because of this
patch-set.

But I also don't see a way around this for now as untrusted devices are
usually hotplugged and might not be present at boot. So we can't make
the decision about the allocation at boot time.

But this mechanism needs to be moved to the dma-iommu implementation at
some point, and then we should allocate the bounce memory pages
on-demand. We can easily do this in page-size chunks and map them
together with iommu page-tables. This way we don't need to pre-allocate
a large memory-chunk at boot.

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
