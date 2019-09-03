Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E4CA68EE
	for <lists.iommu@lfdr.de>; Tue,  3 Sep 2019 14:50:58 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 030E0CDD;
	Tue,  3 Sep 2019 12:50:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D64E1A95
	for <iommu@lists.linux-foundation.org>;
	Tue,  3 Sep 2019 12:50:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3C03C756
	for <iommu@lists.linux-foundation.org>;
	Tue,  3 Sep 2019 12:50:54 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 29A13284; Tue,  3 Sep 2019 14:50:51 +0200 (CEST)
Date: Tue, 3 Sep 2019 14:50:46 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Sai Praneeth Prakhya <sai.praneeth.prakhya@intel.com>
Subject: Re: [PATCH 3/4] iommu: Add support to change default domain of an
	iommu_group
Message-ID: <20190903125046.GA11530@8bytes.org>
References: <cover.1566353521.git.sai.praneeth.prakhya@intel.com>
	<03cbec8c95b13d417dd1c44f545241d01e7b9654.1566353521.git.sai.praneeth.prakhya@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <03cbec8c95b13d417dd1c44f545241d01e7b9654.1566353521.git.sai.praneeth.prakhya@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Ashok Raj <ashok.raj@intel.com>, Will Deacon <will.deacon@arm.com>,
	iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
	Christoph Hellwig <hch@lst.de>
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

On Tue, Aug 20, 2019 at 07:42:25PM -0700, Sai Praneeth Prakhya wrote:
> +	/*
> +	 * iommu_domain_alloc() takes "struct bus_type" as an argument which is
> +	 * a member in "struct device". Changing a group's default domain type
> +	 * deals at iommu_group level rather than device level and hence there
> +	 * is no straight forward way to get "bus_type" of an iommu_group that
> +	 * could be passed to iommu_domain_alloc(). So, instead of directly
> +	 * calling iommu_domain_alloc(), use iommu_ops from previous default
> +	 * domain.
> +	 */
> +	if (!prev_domain || !prev_domain->ops ||
> +	    !prev_domain->ops->domain_alloc || !type)
> +		return -EINVAL;

Hmm, this isn't really nice and clean, but I understand why you need it.
I will think about a better way to get iommu_ops here.

> +free_prev_domain:
> +	/*
> +	 * Free the existing default domain and replace it with the newly
> +	 * created default domain. No need to set group->domain because
> +	 * __iommu_attach_group() already does it on success.
> +	 */
> +	iommu_domain_free(prev_domain);
> +	group->default_domain = new_domain;
> +	return 0;

It isn't obvious to me from this patch, how to are the dma_ops updated
when the default domain changes between identity and dma?

> +	/* Check if any device in the group still has a driver binded to it */
> +	if (iommu_group_for_each_dev(group, NULL, is_driver_binded)) {
> +		pr_err("Active drivers exist for devices in the group\n");
> +		return -EBUSY;
> +	}

This is racy with device driver probing code. Unfortunatly there is no
clean way out of that either, locking all devices in the group and then
do the re-attach will introduce a lock-inversion with group->mutex. But
please put a comment here saying that this might race with device driver
probing.


Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
