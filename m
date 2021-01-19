Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F282FBB2A
	for <lists.iommu@lfdr.de>; Tue, 19 Jan 2021 16:29:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 580D9204F0;
	Tue, 19 Jan 2021 15:29:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9ApSUJA0gSPW; Tue, 19 Jan 2021 15:29:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 99B65204E9;
	Tue, 19 Jan 2021 15:29:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 812ACC013A;
	Tue, 19 Jan 2021 15:29:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A67D2C013A
 for <iommu@lists.linux-foundation.org>; Tue, 19 Jan 2021 15:29:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8D59F84C16
 for <iommu@lists.linux-foundation.org>; Tue, 19 Jan 2021 15:29:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BSVVfneDhPPT for <iommu@lists.linux-foundation.org>;
 Tue, 19 Jan 2021 15:29:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D121084B80
 for <iommu@lists.linux-foundation.org>; Tue, 19 Jan 2021 15:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=qN5w7+5mI1ro4bld5PO3eX1ssRp5DBRYLgSIAZw6YTg=; b=sVTpXquCMX/7Pn2sWrNH+72X43
 US6K5TEuXzMbenqwGZ4BKzkVBh4nDwBVL0tlw/C4Ikwwf3Fwk2gDWxyUXBrQ9rSbcv4mvGe2bEubg
 Tz07XFsDCcOwcPNURjBr4G92j4oQiUXZX5aDP9F1Yk3L62L3BNG8FPgDl+wnrtIJXae6U3EEB/hnZ
 1NTqIRnzHqyT79yQCoVCxHHwEbIoGa4T1Y4vBn8vP+GNHJpc18Ibyo6/JifkbVX9hSShMK2TRWLAC
 CJaJY9wO9nlWs/bUOO/2CsM8CxXaUbpD9mV86f590jWVRyThVrbDaqc/TnR9YbBNjbMVeazFgUnwX
 iPc1Z8fw==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1l1swt-00EUnW-Kc; Tue, 19 Jan 2021 15:29:42 +0000
Date: Tue, 19 Jan 2021 15:29:39 +0000
From: Christoph Hellwig <hch@infradead.org>
To: Lianbo Jiang <lijiang@redhat.com>
Subject: Re: [PATCH 2/2 v2] iommu: use the __iommu_attach_device() directly
 for deferred attach
Message-ID: <20210119152939.GB3453587@infradead.org>
References: <20210119111616.12761-1-lijiang@redhat.com>
 <20210119111616.12761-3-lijiang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210119111616.12761-3-lijiang@redhat.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: thomas.lendacky@amd.com, iommu@lists.linux-foundation.org, will@kernel.org,
 linux-kernel@vger.kernel.org, robin.murphy@arm.com
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

> +int iommu_do_deferred_attach(struct device *dev,
> +			     struct iommu_domain *domain)

I'd remove the "do_" from the name, it doesn't really add any value.

> +{
> +	const struct iommu_ops *ops = domain->ops;
> +
> +	if (unlikely(ops->is_attach_deferred &&
> +		     ops->is_attach_deferred(domain, dev)))
> +		return __iommu_attach_device(domain, dev);
> +
> +	return 0;

Now that everyting is under the static key we don't really need to
bother with the unlikely micro optimization, do we?

> +extern int iommu_do_deferred_attach(struct device *dev,
> +				    struct iommu_domain *domain);

No need for the extern.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
