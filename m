Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1041A28B7
	for <lists.iommu@lfdr.de>; Wed,  8 Apr 2020 20:30:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id BA99320405;
	Wed,  8 Apr 2020 18:30:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D-dnUOAbaHQH; Wed,  8 Apr 2020 18:30:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8FDBE203D1;
	Wed,  8 Apr 2020 18:30:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 72EC1C0177;
	Wed,  8 Apr 2020 18:30:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 749D9C0177
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 18:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6C6D387B5B
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 18:30:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N-CSRLAYfCSM for <iommu@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 18:30:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 011FB87B2B
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 18:30:07 +0000 (UTC)
IronPort-SDR: YTBwI5HVm9HEgJG0ZhdVENimousDmmod2spfS7nuVzmLNY3pS/EfROKZav13vkMYrG4G+MaeHz
 +ET2YqyCiVkA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2020 11:30:07 -0700
IronPort-SDR: WhkuPGaJAo3oRFzXS1Qs7elsK0ybEGfNrZCHWJ8CQjQieX1f1OXIMbrAPk0OnVyla7R8NJ/YM1
 DnZwVk0dK4rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,359,1580803200"; d="scan'208";a="242429272"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
 by fmsmga007.fm.intel.com with ESMTP; 08 Apr 2020 11:30:06 -0700
Date: Wed, 8 Apr 2020 11:35:52 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH 0/2] iommu: Remove iommu_sva_ops::mm_exit()
Message-ID: <20200408113552.7888bfee@jacob-builder>
In-Reply-To: <20200408140427.212807-1-jean-philippe@linaro.org>
References: <20200408140427.212807-1-jean-philippe@linaro.org>
Organization: OTC
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: arnd@arndb.de, gregkh@linuxfoundation.org, iommu@lists.linux-foundation.org,
 jgg@ziepe.ca, zhangfei.gao@linaro.org, linux-accelerators@lists.ozlabs.org
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

Hi Jean,

On Wed,  8 Apr 2020 16:04:25 +0200
Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:

> The IOMMU SVA API currently requires device drivers to implement an
> mm_exit() callback, which stops device jobs that do DMA. This function
> is called in the release() MMU notifier, when an address space that is
> shared with a device exits.
> 
> It has been noted several time during discussions about SVA that
> cancelling DMA jobs can be slow and complex, and doing it in the
> release() notifier might cause synchronization issues (patch 2 has
> more background). Device drivers must in any case call unbind() to
> remove their bond, after stopping DMA from a more favorable context
> (release of a file descriptor).
> 
> So after mm exits, rather than notifying device drivers, we can hold
> on to the PASID until unbind(), ask IOMMU drivers to silently abort
> DMA and Page Requests in the meantime. This change should relieve the
> mmput() path.
> 
I assume mm is destroyed after all the FDs are closed, so if uacce
tied unbind to FD release then unbind already happened before mm is
destroyed. What is there to worry about?

In VT-d, because of enqcmd and lazy PASID free we plan to hold on to the
PASID until mmdrop.
https://lore.kernel.org/patchwork/patch/1217762/

> Patch 1 removes the mm_exit() callback from the uacce module, and
> patch 2 removes it from the IOMMU API.
> 
> Jean-Philippe Brucker (2):
>   uacce: Remove mm_exit() op
>   iommu: Remove iommu_sva_ops::mm_exit()
> 
>  include/linux/iommu.h      |  30 -------
>  include/linux/uacce.h      |  34 ++------
>  drivers/iommu/iommu.c      |  11 ---
>  drivers/misc/uacce/uacce.c | 171
> +++++++++---------------------------- 4 files changed, 50
> insertions(+), 196 deletions(-)
> 

[Jacob Pan]
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
