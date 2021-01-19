Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1F82FB676
	for <lists.iommu@lfdr.de>; Tue, 19 Jan 2021 14:46:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7667C204DA;
	Tue, 19 Jan 2021 13:46:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gtbOmbVQuSCN; Tue, 19 Jan 2021 13:46:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B64CE204CC;
	Tue, 19 Jan 2021 13:46:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9302BC013A;
	Tue, 19 Jan 2021 13:46:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CE23CC013A
 for <iommu@lists.linux-foundation.org>; Tue, 19 Jan 2021 13:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C9CD485092
 for <iommu@lists.linux-foundation.org>; Tue, 19 Jan 2021 13:46:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ckxlp6N0C3Ko for <iommu@lists.linux-foundation.org>;
 Tue, 19 Jan 2021 13:46:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7FB6A80AE1
 for <iommu@lists.linux-foundation.org>; Tue, 19 Jan 2021 13:46:33 +0000 (UTC)
IronPort-SDR: LvSmSZpNDTkijEC7Q98UX9PxDuRQiKVaj5aoMaaJ9zvKjk7j4HfjBPEjFMxQT5LyltawzVYpyX
 r3j0VWAgaL8Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="179074548"
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; d="scan'208";a="179074548"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2021 05:46:32 -0800
IronPort-SDR: 9Drec6KDlJklq/AcoxMUfb1QCvAcoxdfbXtmTJNG22mG/Mp0KEG2VcE7luN4EQBo8XIwC9N242
 Rg5zSm+ThUOg==
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; d="scan'208";a="383938590"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.249.174.34])
 ([10.249.174.34])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2021 05:46:30 -0800
Subject: Re: [PATCH 0/2 v2] iommu: fix the failure of deferred attach for
 iommu attach device
To: Lianbo Jiang <lijiang@redhat.com>, linux-kernel@vger.kernel.org
References: <20210119111616.12761-1-lijiang@redhat.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <e896bbd5-fdf3-ca04-b2f2-f1c7910f1ee0@linux.intel.com>
Date: Tue, 19 Jan 2021 21:46:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210119111616.12761-1-lijiang@redhat.com>
Content-Language: en-US
Cc: thomas.lendacky@amd.com, iommu@lists.linux-foundation.org, will@kernel.org,
 robin.murphy@arm.com
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

On 2021/1/19 19:16, Lianbo Jiang wrote:
> This patchset is to fix the failure of deferred attach for iommu attach
> device, it includes the following two patches:
> 
> [1] [PATCH 1/2] dma-iommu: use static-key to minimize the impact in the fast-path
>      This is a prepared patch for the second one, move out the is_kdump_kernel()
>      check from iommu_dma_deferred_attach() to iommu_dma_init(), and use the
>      static-key in the fast-path to minimize the impact in the normal case.
> 
> [2] [PATCH 2/2] iommu: use the __iommu_attach_device() directly for deferred attach
>      Move the handling currently in iommu_dma_deferred_attach() into the
>      iommu core code so that it can call the __iommu_attach_device()
>      directly instead of the iommu_attach_device(). The external interface
>      iommu_attach_device() is not suitable for handling this situation.
> 
> Changes since v1:
> [1] use the __iommu_attach_device() directly for deferred attach
> [2] use static-key to minimize the impact in the fast-path
> 
> Lianbo Jiang (2):
>    dma-iommu: use static-key to minimize the impact in the fast-path
>    iommu: use the __iommu_attach_device() directly for deferred attach
> 
>   drivers/iommu/dma-iommu.c | 29 +++++++++++------------------
>   drivers/iommu/iommu.c     | 12 ++++++++++++
>   include/linux/iommu.h     |  2 ++
>   3 files changed, 25 insertions(+), 18 deletions(-)
> 

Good fix and improvement. For the patches in this series:

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
