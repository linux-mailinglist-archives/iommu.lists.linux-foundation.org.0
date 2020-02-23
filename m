Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D75A1692DB
	for <lists.iommu@lfdr.de>; Sun, 23 Feb 2020 02:38:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9F95882300;
	Sun, 23 Feb 2020 01:38:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q6SU13RROQvx; Sun, 23 Feb 2020 01:38:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0D553860F0;
	Sun, 23 Feb 2020 01:38:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 02629C013E;
	Sun, 23 Feb 2020 01:38:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 731DCC013E
 for <iommu@lists.linux-foundation.org>; Sun, 23 Feb 2020 01:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 679C02274B
 for <iommu@lists.linux-foundation.org>; Sun, 23 Feb 2020 01:38:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dz7068S-xcdm for <iommu@lists.linux-foundation.org>;
 Sun, 23 Feb 2020 01:38:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by silver.osuosl.org (Postfix) with ESMTPS id 5AE3820470
 for <iommu@lists.linux-foundation.org>; Sun, 23 Feb 2020 01:38:50 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Feb 2020 17:38:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,474,1574150400"; d="scan'208";a="255216079"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.254.212.230])
 ([10.254.212.230])
 by orsmga002.jf.intel.com with ESMTP; 22 Feb 2020 17:38:46 -0800
Subject: Re: [PATCH V2 5/5] iommu: Document usage of
 "/sys/kernel/iommu_groups/<grp_id>/type" file
To: Sai Praneeth Prakhya <sai.praneeth.prakhya@intel.com>,
 iommu@lists.linux-foundation.org
References: <cover.1581619464.git.sai.praneeth.prakhya@intel.com>
 <91f1770f9c65f14c88e02ee6f310f9fdcca85f66.1581619464.git.sai.praneeth.prakhya@intel.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <f8b07b5e-9a11-1dbe-9fb6-47b851a1b661@linux.intel.com>
Date: Sun, 23 Feb 2020 09:38:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <91f1770f9c65f14c88e02ee6f310f9fdcca85f66.1581619464.git.sai.praneeth.prakhya@intel.com>
Content-Language: en-US
Cc: Ashok Raj <ashok.raj@intel.com>, Will Deacon <will.deacon@arm.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
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

Hi,

On 2020/2/17 5:57, Sai Praneeth Prakhya wrote:
> The default domain type of an iommu group can be changed using file
> "/sys/kernel/iommu_groups/<grp_id>/type". Hence, document it's usage and
> more importantly spell out it's limitations.
> 
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Ashok Raj <ashok.raj@intel.com>
> Cc: Will Deacon <will.deacon@arm.com>
> Cc: Lu Baolu <baolu.lu@linux.intel.com>
> Cc: Sohil Mehta <sohil.mehta@intel.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>
> Signed-off-by: Sai Praneeth Prakhya <sai.praneeth.prakhya@intel.com>
> ---
>   .../ABI/testing/sysfs-kernel-iommu_groups          | 29 ++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-kernel-iommu_groups b/Documentation/ABI/testing/sysfs-kernel-iommu_groups
> index 017f5bc3920c..808a9507b281 100644
> --- a/Documentation/ABI/testing/sysfs-kernel-iommu_groups
> +++ b/Documentation/ABI/testing/sysfs-kernel-iommu_groups
> @@ -33,3 +33,32 @@ Description:    In case an RMRR is used only by graphics or USB devices
>   		it is now exposed as "direct-relaxable" instead of "direct".
>   		In device assignment use case, for instance, those RMRR
>   		are considered to be relaxable and safe.
> +
> +What:		/sys/kernel/iommu_groups/<grp_id>/type
> +Date:		February 2020
> +KernelVersion:	v5.6
> +Contact:	Sai Praneeth Prakhya <sai.praneeth.prakhya@intel.com>
> +Description:	Lets the user know the type of default domain in use by iommu
> +		for this group. A privileged user could request kernel to change

Let the users know the default domain type of the IOMMU group by
reading this file. A privileged user could request to change it by
writing to this file.

> +		the group type by writing to this file. Presently, only three
> +		types are supported
> +		1. DMA: All the DMA transactions from the devices in this group
> +			are translated by the iommu.
> +		2. identity: All the DMA transactions from the devices in this
> +			     group are *not* translated by the iommu.
> +		3. auto: Kernel decides one among DMA/identity mode and hence
> +			 when the user reads the file he would never see "auto".

Just out of curiosity, when could a user reads "auto" from this file?

> +			 This is just a write only value.
> +		Note:
> +		-----
> +		A group type could be modified only when *all* the devices in

group's default domain type (not group type).

> +		the group are not binded to any device driver. So, the user has

bound

> +		to first unbind the appropriate drivers and then change the
> +		default domain type.
> +		Caution:
> +		--------
> +		Unbinding a device driver will take away the drivers control
> +		over the device and if done on devices that host root file
> +		system could lead to catastrophic effects (the user might
> +		need to reboot the machine to get it to normal state). So, it's
> +		expected that the user understands what he is doing.
> 

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
