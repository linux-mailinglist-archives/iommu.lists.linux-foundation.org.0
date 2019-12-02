Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3507110F12E
	for <lists.iommu@lfdr.de>; Mon,  2 Dec 2019 20:58:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B6D52854EF;
	Mon,  2 Dec 2019 19:58:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ffCa8Okftnk2; Mon,  2 Dec 2019 19:58:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 12FDE855DF;
	Mon,  2 Dec 2019 19:58:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EEB51C087F;
	Mon,  2 Dec 2019 19:58:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 519AFC087F
 for <iommu@lists.linux-foundation.org>; Mon,  2 Dec 2019 19:58:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 464F1845C6
 for <iommu@lists.linux-foundation.org>; Mon,  2 Dec 2019 19:58:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 40VVulRvDbAv for <iommu@lists.linux-foundation.org>;
 Mon,  2 Dec 2019 19:58:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7230D845C0
 for <iommu@lists.linux-foundation.org>; Mon,  2 Dec 2019 19:58:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Dec 2019 11:58:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,270,1571727600"; d="scan'208";a="385017081"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
 by orsmga005.jf.intel.com with ESMTP; 02 Dec 2019 11:58:10 -0800
Date: Mon, 2 Dec 2019 12:02:52 -0800
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH 0/5] iommu/vt-d: Consolidate various cache flush ops
Message-ID: <20191202120252.45606c47@jacob-builder>
In-Reply-To: <20191122030449.28892-1-baolu.lu@linux.intel.com>
References: <20191122030449.28892-1-baolu.lu@linux.intel.com>
Organization: OTC
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: kevin.tian@intel.com, ashok.raj@intel.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, David Woodhouse <dwmw2@infradead.org>
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

On Fri, 22 Nov 2019 11:04:44 +0800
Lu Baolu <baolu.lu@linux.intel.com> wrote:

> Intel VT-d 3.0 introduces more caches and interfaces for software to
> flush when it runs in the scalable mode. Currently various cache flush
> helpers are scattered around. This consolidates them by putting them
> in the existing iommu_flush structure.
> 
> /* struct iommu_flush - Intel IOMMU cache invalidation ops
>  *
>  * @cc_inv: invalidate context cache
>  * @iotlb_inv: Invalidate IOTLB and paging structure caches when
> software
>  *             has changed second-level tables.
>  * @p_iotlb_inv: Invalidate IOTLB and paging structure caches when
> software
>  *               has changed first-level tables.
>  * @pc_inv: invalidate pasid cache
>  * @dev_tlb_inv: invalidate cached mappings used by
> requests-without-PASID
>  *               from the Device-TLB on a endpoint device.
>  * @p_dev_tlb_inv: invalidate cached mappings used by
> requests-with-PASID
>  *                 from the Device-TLB on an endpoint device
>  */
> struct iommu_flush {
>         void (*cc_inv)(struct intel_iommu *iommu, u16 did,
>                        u16 sid, u8 fm, u64 type);
>         void (*iotlb_inv)(struct intel_iommu *iommu, u16 did, u64
> addr, unsigned int size_order, u64 type);
>         void (*p_iotlb_inv)(struct intel_iommu *iommu, u16 did, u32
> pasid, u64 addr, unsigned long npages, bool ih);
>         void (*pc_inv)(struct intel_iommu *iommu, u16 did, u32 pasid,
>                        u64 granu);
>         void (*dev_tlb_inv)(struct intel_iommu *iommu, u16 sid, u16
> pfsid, u16 qdep, u64 addr, unsigned int mask);
>         void (*p_dev_tlb_inv)(struct intel_iommu *iommu, u16 sid, u16
> pfsid, u32 pasid, u16 qdep, u64 addr,
>                               unsigned long npages);
> };
> 
> The name of each cache flush ops is defined according to the spec
> section 6.5 so that people are easy to look up them in the spec.
> 
Nice consolidation. For nested SVM, I also introduced cache flushed
helpers as needed.
https://lkml.org/lkml/2019/10/24/857

Should I wait for yours to be merged or you want to extend the this
consolidation after SVA/SVM cache flush? I expect to send my v8 shortly.

> Best regards,
> Lu Baolu
> 
> Lu Baolu (5):
>   iommu/vt-d: Extend iommu_flush for scalable mode
>   iommu/vt-d: Consolidate pasid cache invalidation
>   iommu/vt-d: Consolidate device tlb invalidation
>   iommu/vt-d: Consolidate pasid-based tlb invalidation
>   iommu/vt-d: Consolidate pasid-based device tlb invalidation
> 
>  drivers/iommu/dmar.c        |  61 ---------
>  drivers/iommu/intel-iommu.c | 246
> +++++++++++++++++++++++++++++------- drivers/iommu/intel-pasid.c |
> 39 +----- drivers/iommu/intel-svm.c   |  60 ++-------
>  include/linux/intel-iommu.h |  39 ++++--
>  5 files changed, 244 insertions(+), 201 deletions(-)
> 

[Jacob Pan]
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
