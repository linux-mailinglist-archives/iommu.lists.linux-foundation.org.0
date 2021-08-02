Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4760E3DD62D
	for <lists.iommu@lfdr.de>; Mon,  2 Aug 2021 14:58:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD43B403DC;
	Mon,  2 Aug 2021 12:58:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NVCPHZflPGa8; Mon,  2 Aug 2021 12:58:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 5F48D4039B;
	Mon,  2 Aug 2021 12:58:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 49D73C000E;
	Mon,  2 Aug 2021 12:58:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0F00BC000E
 for <iommu@lists.linux-foundation.org>; Mon,  2 Aug 2021 12:58:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F1750403DC
 for <iommu@lists.linux-foundation.org>; Mon,  2 Aug 2021 12:58:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nv1-AsnPIy5D for <iommu@lists.linux-foundation.org>;
 Mon,  2 Aug 2021 12:58:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5C0284039B
 for <iommu@lists.linux-foundation.org>; Mon,  2 Aug 2021 12:58:33 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 9AD29379; Mon,  2 Aug 2021 14:58:30 +0200 (CEST)
Date: Mon, 2 Aug 2021 14:58:26 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Tianyu Lan <ltykernel@gmail.com>
Subject: Re: [PATCH 07/13] HV/Vmbus: Add SNP support for VMbus channel
 initiate message
Message-ID: <YQfr8lsaghth8Zix@8bytes.org>
References: <20210728145232.285861-1-ltykernel@gmail.com>
 <20210728145232.285861-8-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210728145232.285861-8-ltykernel@gmail.com>
Cc: linux-hyperv@vger.kernel.org, brijesh.singh@amd.com, david@redhat.com,
 peterz@infradead.org, dave.hansen@linux.intel.com, vkuznets@redhat.com,
 hpa@zytor.com, anparri@microsoft.com, kys@microsoft.com, will@kernel.org,
 boris.ostrovsky@oracle.com, linux-arch@vger.kernel.org, sfr@canb.auug.org.au,
 wei.liu@kernel.org, sstabellini@kernel.org, sthemmin@microsoft.com,
 xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org,
 aneesh.kumar@linux.ibm.com, x86@kernel.org, decui@microsoft.com, hch@lst.de,
 michael.h.kelley@microsoft.com, mingo@redhat.com, pgonda@google.com,
 rientjes@google.com, kuba@kernel.org, jejb@linux.ibm.com,
 martin.b.radev@gmail.com, thomas.lendacky@amd.com, Tianyu.Lan@microsoft.com,
 keescook@chromium.org, arnd@arndb.de, konrad.wilk@oracle.com,
 haiyangz@microsoft.com, bp@alien8.de, luto@kernel.org,
 krish.sadhukhan@oracle.com, tglx@linutronix.de, akpm@linux-foundation.org,
 jgross@suse.com, martin.petersen@oracle.com, saravanand@fb.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, kirill.shutemov@linux.intel.com,
 hannes@cmpxchg.org, ardb@kernel.org, robin.murphy@arm.com, davem@davemloft.net,
 rppt@kernel.org
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

On Wed, Jul 28, 2021 at 10:52:22AM -0400, Tianyu Lan wrote:
> +	if (hv_is_isolation_supported()) {
> +		vmbus_connection.monitor_pages_va[0]
> +			= vmbus_connection.monitor_pages[0];
> +		vmbus_connection.monitor_pages[0]
> +			= memremap(msg->monitor_page1, HV_HYP_PAGE_SIZE,
> +				   MEMREMAP_WB);
> +		if (!vmbus_connection.monitor_pages[0])
> +			return -ENOMEM;
> +
> +		vmbus_connection.monitor_pages_va[1]
> +			= vmbus_connection.monitor_pages[1];
> +		vmbus_connection.monitor_pages[1]
> +			= memremap(msg->monitor_page2, HV_HYP_PAGE_SIZE,
> +				   MEMREMAP_WB);
> +		if (!vmbus_connection.monitor_pages[1]) {
> +			memunmap(vmbus_connection.monitor_pages[0]);
> +			return -ENOMEM;
> +		}
> +
> +		memset(vmbus_connection.monitor_pages[0], 0x00,
> +		       HV_HYP_PAGE_SIZE);
> +		memset(vmbus_connection.monitor_pages[1], 0x00,
> +		       HV_HYP_PAGE_SIZE);
> +	}

Okay, let me see if I got this right. In Hyper-V Isolation VMs, when the
guest wants to make memory shared, it does":

	- Call to the Hypervisor the mark the pages shared. The
	  Hypervisor will do the RMP update and remap the pages at
	  (VTOM + pa)

	- The guest maps the memory again into its page-table, so that
	  the entries point to the correct GPA (which is above VTOM
	  now).

Or in other words, Hyper-V implements a hardware-independent and
configurable c-bit position, as the VTOM value is always power-of-two
aligned. Is that correct?
This would at least explain why there is no separate
allocation/dealloction of memory for the shared range.

Thanks,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
