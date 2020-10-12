Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8DD28AC32
	for <lists.iommu@lfdr.de>; Mon, 12 Oct 2020 04:38:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id F297385EFB;
	Mon, 12 Oct 2020 02:38:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pvo0G8lmT0xU; Mon, 12 Oct 2020 02:38:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 651B485EEF;
	Mon, 12 Oct 2020 02:38:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 43F2BC0051;
	Mon, 12 Oct 2020 02:38:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5CF58C0051
 for <iommu@lists.linux-foundation.org>; Mon, 12 Oct 2020 02:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 48D2820501
 for <iommu@lists.linux-foundation.org>; Mon, 12 Oct 2020 02:38:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w1KXGxTRGXeU for <iommu@lists.linux-foundation.org>;
 Mon, 12 Oct 2020 02:38:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by silver.osuosl.org (Postfix) with ESMTPS id D3B931FC71
 for <iommu@lists.linux-foundation.org>; Mon, 12 Oct 2020 02:38:13 +0000 (UTC)
IronPort-SDR: F/ymlvKBNT9mYo5uJ85rmVMoqppfzWHJkdCN++651vFS4tykj0kfxb12eXToKBVX95D0E7uS89
 uxoYVNE0AJxQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9771"; a="165794272"
X-IronPort-AV: E=Sophos;i="5.77,365,1596524400"; d="scan'208";a="165794272"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2020 19:38:09 -0700
IronPort-SDR: 6SS+sDvmGGVHmqq3yHY5Cj2vODTAbxVolMjhokJy+QIAbUZFsPU0NmPOvo0ldjggmQeKu8M1eg
 6rd5lq/ch96A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,365,1596524400"; d="scan'208";a="344679529"
Received: from allen-box.sh.intel.com (HELO [10.239.159.139])
 ([10.239.159.139])
 by fmsmga004.fm.intel.com with ESMTP; 11 Oct 2020 19:38:05 -0700
Subject: Re: [PATCH v3 0/2] Add support for ACPI device in RMRR
To: FelixCuioc <FelixCui-oc@zhaoxin.com>, Joerg Roedel <joro@8bytes.org>,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 David Woodhouse <dwmw2@infradead.org>,
 Dan Carpenter <dan.carpenter@oracle.com>, kbuild@lists.01.org
References: <20201010080241.14642-1-FelixCui-oc@zhaoxin.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <06de2814-36c9-bea4-d0e1-0b6dddd1006e@linux.intel.com>
Date: Mon, 12 Oct 2020 10:31:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201010080241.14642-1-FelixCui-oc@zhaoxin.com>
Content-Language: en-US
Cc: TonyWWang-oc@zhaoxin.com, CobeChen-oc@zhaoxin.com
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

Hi Felix,

On 10/10/20 4:02 PM, FelixCuioc wrote:
> BIOS allocate reserved memory ranges that may be DMA targets.
> BIOS may report each such reserved memory region through the
> RMRR structures,along with the devices that requires access to
> the specified reserved memory region.
> 
> The purpose of this series is to achieve ACPI device in RMRR
> access reserved memory.Therefore,it is necessary to increase
> the analysis of acpi device in RMRR and establish a mapping
> for this device.
> 
> The first patch adds interfaces for detecting ACPI device
> in RMRR and in order to distinguish it from pci device,
> some interface functions are modified.
> 
> The second patch adds support for probing ACPI device in RMRR.
> In probe_acpi_namespace_devices(),add support for direct mapping
> of ACPI device and add support for physical node of acpi device
> to be NULL.

Thanks for your patches. As I explained in the previous reply, RMRRs
were added as work around for certain legacy device and we have been
working hard to fix those legacy devices so that RMRR are no longer
needed. Any new use case of RMRR is not encouraged.

By the way, I guess the problem you are facing can still be handled well
under current RMRR mechanism by simple putting the device in the
ACPI/ANDD table. It's worth trying.

Best regards,
baolu

> 
> v2->v3:
>     - Add the blank line between functions.
>     - Make dmar_acpi_insert_dev_scope() bool,change the 1/0 to true/false
>       and add a comment explaining.
>     - Delete unused initialization.
>     - if dmar_acpi_insert_dev_scope() always returns zero,will not
>       call dmar_rmrr_add_acpi_dev().
>     - Use a proper error code.
>     - Use if(!pdev).
>     - Use goto unlock instead of mutex_unlock().
> 
> 
> FelixCuioc (2):
>    iommu/vt-d:Add support for detecting ACPI device in RMRR
>    iommu/vt-d:Add support for probing ACPI device in RMRR
> 
>   drivers/iommu/intel/dmar.c  | 76 +++++++++++++++++++++----------------
>   drivers/iommu/intel/iommu.c | 52 ++++++++++++++++++++++++-
>   drivers/iommu/iommu.c       |  6 +++
>   include/linux/dmar.h        | 12 +++++-
>   include/linux/iommu.h       |  2 +
>   5 files changed, 113 insertions(+), 35 deletions(-)
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
