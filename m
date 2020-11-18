Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DA22B7E95
	for <lists.iommu@lfdr.de>; Wed, 18 Nov 2020 14:51:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4FD5820482;
	Wed, 18 Nov 2020 13:51:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2ruao-+cgGIk; Wed, 18 Nov 2020 13:51:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id CC5C4203D9;
	Wed, 18 Nov 2020 13:51:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B88E7C07FF;
	Wed, 18 Nov 2020 13:51:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9AE0FC07FF
 for <iommu@lists.linux-foundation.org>; Wed, 18 Nov 2020 13:51:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 85F892044F
 for <iommu@lists.linux-foundation.org>; Wed, 18 Nov 2020 13:51:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cvF40RVBNOjJ for <iommu@lists.linux-foundation.org>;
 Wed, 18 Nov 2020 13:51:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 2BE40203D9
 for <iommu@lists.linux-foundation.org>; Wed, 18 Nov 2020 13:51:43 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 575EE2065C;
 Wed, 18 Nov 2020 13:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605707502;
 bh=Hy+MTj5kSeluGl0rCCVvD+on5N7PHZ7TOPQtJXf1Fwg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q5HF8U6bv7SmLb5h2VfHV/xNE+uA7TW8TTldldie0K8++cdWTIuNZf85T0NUo9AXL
 x6+2zjHjAxatEfjo7Kuudw8J4LL2BLw+eUpRZAgs0f7TJZJWI8yGElZ3HUG+Ypj9aM
 f+mNZdvGH+bBY/Yk8gaHZ/+/AuuUdj8MtKY1wuRA=
Date: Wed, 18 Nov 2020 13:51:37 +0000
From: Will Deacon <will@kernel.org>
To: Ashok Raj <ashok.raj@intel.com>
Subject: Re: [Patch V8 3/3] iommu: Document usage of
 "/sys/kernel/iommu_groups/<grp_id>/type" file
Message-ID: <20201118135137.GA2177@willie-the-truck>
References: <20200925190620.18732-1-ashok.raj@intel.com>
 <20200925190620.18732-4-ashok.raj@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200925190620.18732-4-ashok.raj@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Robin Murphy <robin.murphy@arm.com>, Will Deacon <will.deacon@arm.com>,
 iommu@lists.linux-foundation.org, Christoph Hellwig <hch@lst.de>
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

On Fri, Sep 25, 2020 at 12:06:20PM -0700, Ashok Raj wrote:
> From: Sai Praneeth Prakhya <sai.praneeth.prakhya@intel.com>
> 
> The default domain type of an iommu group can be changed by writing to
> "/sys/kernel/iommu_groups/<grp_id>/type" file. Hence, document it's usage
> and more importantly spell out its limitations.
> 
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Ashok Raj <ashok.raj@intel.com>
> Cc: Will Deacon <will.deacon@arm.com>
> Cc: Lu Baolu <baolu.lu@linux.intel.com>
> Cc: Sohil Mehta <sohil.mehta@intel.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Sai Praneeth Prakhya <sai.praneeth.prakhya@intel.com>
> ---
>  .../ABI/testing/sysfs-kernel-iommu_groups          | 30 ++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-kernel-iommu_groups b/Documentation/ABI/testing/sysfs-kernel-iommu_groups
> index 017f5bc3920c..effde9d23f4f 100644
> --- a/Documentation/ABI/testing/sysfs-kernel-iommu_groups
> +++ b/Documentation/ABI/testing/sysfs-kernel-iommu_groups
> @@ -33,3 +33,33 @@ Description:    In case an RMRR is used only by graphics or USB devices
>  		it is now exposed as "direct-relaxable" instead of "direct".
>  		In device assignment use case, for instance, those RMRR
>  		are considered to be relaxable and safe.
> +
> +What:		/sys/kernel/iommu_groups/<grp_id>/type
> +Date:		September 2020
> +KernelVersion:	v5.10

^^ Please can you update these two lines?

> +Contact:	Sai Praneeth Prakhya <sai.praneeth.prakhya@intel.com>
> +Description:	Let the user know the type of default domain in use by iommu
> +		for this group. A privileged user could request kernel to change
> +		the group type by writing to this file. Presently, only three
> +		types are supported
> +		1. DMA: All the DMA transactions from the device in this group
> +			are translated by the iommu.
> +		2. identity: All the DMA transactions from the device in this
> +			     group are *not* translated by the iommu.
> +		3. auto: Change to the type the device was booted with. When the
> +			 user reads the file he would never see "auto". This is

Can we avoid assuming gender here and just use "they" instead of "he", please?
Same thing for the "Caution" note below.

> +			 just a write only value.

I can't figure out from this description what string is returned to
userspace in the case that the group is configured as  blocked or unmanaged.

> +		Note:
> +		-----
> +		A group type could be modified only when

s/could be/may be/

> +		1. The group has *only* one device
> +		2. The device in the group is not bound to any device driver.
> +		   So, the user must first unbind the appropriate driver and
> +		   then change the default domain type.
> +		Caution:
> +		--------
> +		Unbinding a device driver will take away the driver's control
> +		over the device and if done on devices that host root file
> +		system could lead to catastrophic effects (the user might
> +		need to reboot the machine to get it to normal state). So, it's
> +		expected that the user understands what he is doing.

Thanks,

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
