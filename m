Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id C620B341E97
	for <lists.iommu@lfdr.de>; Fri, 19 Mar 2021 14:42:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 78DB2400A4;
	Fri, 19 Mar 2021 13:42:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eobnaGyUJUg6; Fri, 19 Mar 2021 13:42:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id B09CF4011B;
	Fri, 19 Mar 2021 13:42:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8A9FFC0001;
	Fri, 19 Mar 2021 13:42:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BC2C2C0001
 for <iommu@lists.linux-foundation.org>; Fri, 19 Mar 2021 13:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B83FF83C7D
 for <iommu@lists.linux-foundation.org>; Fri, 19 Mar 2021 13:42:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZcN8_Eslq7mC for <iommu@lists.linux-foundation.org>;
 Fri, 19 Mar 2021 13:42:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9F04D83508
 for <iommu@lists.linux-foundation.org>; Fri, 19 Mar 2021 13:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=hyqxq7U5LtljeCAGVk4jeQy+LJbspwfVIdmGiMDlRVY=; b=K6sZZ2c8ZAynBR9zLv5S0z6QDr
 BDwKiB6zrKMHSRXAzjutLw3yP6QFdejiG0QhCjppZUklh/+w2M4Tq+1kMJTaSKJ2zdrllh2iUYBZe
 v9JJRsAcquRaCpiXnXuRWxjvG+jJ/Pm0F68N4WdfeUlbgfx7fFOBmwnmXHFQ7sz+1S+8NfRSfyTCR
 0PbSrfo6JOnc4NrYn+gRusRRcWGy/yiHKUifgFPG9uZDxdqA5VG2SnrtEoWzp9Q1pnr5X/nnzhhcn
 lkcPm3yw/vkzC9VYfSjy0Px0TuyEqiVXZZ9tONpCY48dOQnbmJdHySLAdCL+XmONI81aRyK1uMGJ1
 0adS+lDA==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lNFON-004Svd-TZ; Fri, 19 Mar 2021 13:42:23 +0000
Date: Fri, 19 Mar 2021 13:42:19 +0000
From: Christoph Hellwig <hch@infradead.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 2/2] iommu: Streamline registration interface
Message-ID: <20210319134219.GB1063154@infradead.org>
References: <f4de29d8330981301c1935e667b507254a2691ae.1616157612.git.robin.murphy@arm.com>
 <95f69c593aa9dd57a5333e490dc06b8bae27fedf.1616157612.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <95f69c593aa9dd57a5333e490dc06b8bae27fedf.1616157612.git.robin.murphy@arm.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: will@kernel.org, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
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

> +int iommu_device_register(struct iommu_device *iommu, const struct iommu_ops *ops,

It would be nice to avoid the pointlessly overlong line here.

> +			    struct device *hwdev)
>  {
> +	iommu->ops = ops;
> +	if (hwdev)
> +		iommu->fwnode = hwdev->fwnode;

This function could use a kerneldoc comment now.  Especially the hwdev
agument isn't exactly obvious.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
