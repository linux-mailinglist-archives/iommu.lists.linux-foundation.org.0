Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBC918B889
	for <lists.iommu@lfdr.de>; Thu, 19 Mar 2020 15:03:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 60AE22273B;
	Thu, 19 Mar 2020 14:03:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aH8VXPkc3gMD; Thu, 19 Mar 2020 14:03:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id DB4582094B;
	Thu, 19 Mar 2020 14:03:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BCC67C1D89;
	Thu, 19 Mar 2020 14:03:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 71FD0C07FF
 for <iommu@lists.linux-foundation.org>; Thu, 19 Mar 2020 14:03:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 69C0087E9D
 for <iommu@lists.linux-foundation.org>; Thu, 19 Mar 2020 14:03:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R+j+41t5oBAc for <iommu@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 14:03:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7093887E9C
 for <iommu@lists.linux-foundation.org>; Thu, 19 Mar 2020 14:03:25 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 13DF71D4; Thu, 19 Mar 2020 15:03:23 +0100 (CET)
Date: Thu, 19 Mar 2020 15:03:21 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v2 2/6] iommu: Configure default domain with
 def_domain_type
Message-ID: <20200319140321.GA5122@8bytes.org>
References: <20200314010705.30711-1-baolu.lu@linux.intel.com>
 <20200314010705.30711-3-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200314010705.30711-3-baolu.lu@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: kevin.tian@intel.com, ashok.raj@intel.com, linux-kernel@vger.kernel.org,
 Daniel Drake <drake@endlessm.com>, iommu@lists.linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 Derrick Jonathan <jonathan.derrick@intel.com>
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

Hi Baolu,

On Sat, Mar 14, 2020 at 09:07:01AM +0800, Lu Baolu wrote:
> +static int iommu_group_change_def_domain(struct iommu_group *group, int type)
> +{
> +	struct group_device *grp_dev, *temp;
> +	struct iommu_domain *new, *old;
> +	const struct iommu_ops *ops;
> +	int ret = 0;
> +
> +	if ((type != IOMMU_DOMAIN_IDENTITY && type != IOMMU_DOMAIN_DMA) ||
> +	    !group->default_domain || type == group->default_domain->type ||
> +	    !group->default_domain->ops)
> +		return -EINVAL;
> +
> +	if (group->domain != group->default_domain)
> +		return -EBUSY;
> +
> +	iommu_group_ref_get(group);
> +	old = group->default_domain;
> +	ops = group->default_domain->ops;
> +
> +	/* Allocate a new domain of requested type. */
> +	new = ops->domain_alloc(type);
> +	if (!new) {
> +		ret = -ENOMEM;
> +		goto domain_out;
> +	}
> +	new->type = type;
> +	new->ops = ops;
> +	new->pgsize_bitmap = group->default_domain->pgsize_bitmap;
> +
> +	group->default_domain = new;
> +	group->domain = new;
> +	list_for_each_entry_safe(grp_dev, temp, &group->devices, list) {
> +		struct device *dev;
> +
> +		dev = grp_dev->dev;
> +		if (device_is_bound(dev)) {
> +			ret = -EINVAL;
> +			goto device_out;
> +		}
> +
> +		iommu_group_create_direct_mappings(group, dev);
> +		ret = __iommu_attach_device(group->domain, dev);
> +		if (ret)
> +			goto device_out;

In case of a failure here with a group containing multiple devices, the
other devices temporarily lose their mappings. Please only do the
device_is_bound() check in the loop and the actual re-attachment of the
group with a call to __iommu_attach_group().

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
