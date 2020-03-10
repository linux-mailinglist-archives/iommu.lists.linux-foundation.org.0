Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A75AC17ED72
	for <lists.iommu@lfdr.de>; Tue, 10 Mar 2020 01:51:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 50F5A8619E;
	Tue, 10 Mar 2020 00:51:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iZuAiD_FAV4k; Tue, 10 Mar 2020 00:51:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3E48086194;
	Tue, 10 Mar 2020 00:50:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2B6B8C0177;
	Tue, 10 Mar 2020 00:50:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 07E51C0177
 for <iommu@lists.linux-foundation.org>; Tue, 10 Mar 2020 00:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E47E720469
 for <iommu@lists.linux-foundation.org>; Tue, 10 Mar 2020 00:50:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mo8M+GIxQjDJ for <iommu@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 00:50:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by silver.osuosl.org (Postfix) with ESMTPS id 39A5820413
 for <iommu@lists.linux-foundation.org>; Tue, 10 Mar 2020 00:50:54 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Mar 2020 17:50:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,535,1574150400"; d="scan'208";a="235764028"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.254.215.55])
 ([10.254.215.55])
 by fmsmga008.fm.intel.com with ESMTP; 09 Mar 2020 17:50:48 -0700
Subject: Re: [Patch V1 0/2] iommu/vtd: Fixes to the IOMMU debugfs
To: Megha Dey <megha.dey@linux.intel.com>, dwmw2@infradead.org,
 iommu@lists.linux-foundation.org, Joerg Roedel <joro@8bytes.org>
References: <1583784587-26126-1-git-send-email-megha.dey@linux.intel.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <378262ba-3ab8-c458-e6ca-a656bbcd653f@linux.intel.com>
Date: Tue, 10 Mar 2020 08:50:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1583784587-26126-1-git-send-email-megha.dey@linux.intel.com>
Content-Language: en-US
Cc: megha.dey@intel.com
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

Hi Megha,

Thanks for the fixes. For two patches in this series:

Acked-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu

On 2020/3/10 4:09, Megha Dey wrote:
> This patchset aims to fix some of the existing issues in the iommu debugfs.
> 
> The first patch aims to fix the debugfs register reads by using the correct
> read function variant while reading the contents of iommu registers while
> the second patch ensures the debugfs directory is populated even if DMA
> remapping is disabled.
> 
> Megha Dey (2):
>    iommu/vt-d: Fix debugfs register reads
>    iommu/vt-d: Populate debugfs if IOMMUs are detected
> 
>   drivers/iommu/intel-iommu-debugfs.c | 53 ++++++++++++++++++++++++++-----------
>   drivers/iommu/intel-iommu.c         |  4 ++-
>   include/linux/intel-iommu.h         |  2 ++
>   3 files changed, 43 insertions(+), 16 deletions(-)
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
